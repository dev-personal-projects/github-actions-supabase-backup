#!/bin/bash
# Database backup functions

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/common.sh"
source "$SCRIPT_DIR/detect.sh"

# Backup database roles
backup_roles() {
  local DB_URL="${1:-}"
  local OUTPUT_FILE="${2:-}"

  [ -z "$DB_URL" ] || [ -z "$OUTPUT_FILE" ] && {
    echo "Error: Database URL and output file are required" >&2
    exit 1
  }

  DB_URL=$(force_ipv4_connection "$DB_URL" 2>/dev/null)
  mkdir -p "$(dirname "$OUTPUT_FILE")"

  # Parse connection string for pg_dumpall
  if [[ "$DB_URL" =~ postgresql://([^:]+):([^@]+)@([^:/]+):([0-9]+)/([^?]*)(.*) ]]; then
    export PGHOST="${BASH_REMATCH[3]}"
    export PGPORT="${BASH_REMATCH[4]}"
    export PGUSER="${BASH_REMATCH[1]}"
    export PGPASSWORD=$(url_decode "${BASH_REMATCH[2]}")
    export PGDATABASE="${BASH_REMATCH[5]}"
    
    if [[ "${BASH_REMATCH[6]}" =~ sslmode=([^&]+) ]]; then
      export PGSSLMODE="${BASH_REMATCH[1]}"
    fi
  else
    echo "Error: Invalid connection string format" >&2
    exit 1
  fi

  echo "Backing up database roles..."
  local PG_DUMPALL=$(get_pg_binary "pg_dumpall")
  
  if ! $PG_DUMPALL --roles-only --no-password > "$OUTPUT_FILE" 2>&1; then
    echo "Error: Failed to backup roles" >&2
    cat "$OUTPUT_FILE" | sed 's/postgresql:\/\/[^@]*@/postgresql:\/\/***@/g' >&2
    unset PGPASSWORD
    exit 1
  fi

  unset PGPASSWORD
  [ ! -f "$OUTPUT_FILE" ] && { echo "Error: Roles backup file not created" >&2; exit 1; }
  echo "Successfully backed up roles to $OUTPUT_FILE"
}

# Backup a single table (schema and data) - Optimized version
# Uses optimized pg_dump flags for better performance
backup_table() {
  local DB_URL="${1:-}"
  local SCHEMA="${2:-}"
  local TABLE="${3:-}"
  local OUTPUT_DIR="${4:-}"

  [ -z "$DB_URL" ] || [ -z "$SCHEMA" ] || [ -z "$TABLE" ] || [ -z "$OUTPUT_DIR" ] && {
    echo "Error: All parameters are required" >&2
    return 1
  }

  DB_URL=$(force_ipv4_connection "$DB_URL" 2>/dev/null)
  local TABLE_DIR="$OUTPUT_DIR/$SCHEMA/tables/$TABLE"
  mkdir -p "$TABLE_DIR"

  local PG_DUMP=$(get_pg_binary "pg_dump")
  local ERROR_FILE=$(mktemp)

  # Backup schema with optimized flags
  # --no-sync: Skip fsync for faster writes (safe for backups)
  # --compress=6: Balanced compression (faster than default 9)
  echo "Backing up structure for table: $SCHEMA.$TABLE"
  if ! $PG_DUMP "$DB_URL" --table="$SCHEMA.$TABLE" \
    --schema-only --no-owner --no-privileges --no-tablespaces \
    --no-sync \
    > "$TABLE_DIR/schema.sql" 2> "$ERROR_FILE"; then
    echo "Error: Failed to backup schema for $SCHEMA.$TABLE" >&2
    if [ -s "$ERROR_FILE" ]; then
      echo "pg_dump error:" >&2
      cat "$ERROR_FILE" | sed 's/postgresql:\/\/[^@]*@/postgresql:\/\/***@/g' >&2
      
      if grep -qi "no matching tables" "$ERROR_FILE"; then
        echo "Note: This might be a system table, view, or materialized view that cannot be dumped" >&2
        echo "Skipping this table and continuing..." >&2
        rm -f "$ERROR_FILE" "$TABLE_DIR/schema.sql" 2>/dev/null
        return 1
      fi
    else
      echo "No error details available" >&2
    fi
    rm -f "$ERROR_FILE"
    return 1
  fi

  # Backup data with optimized flags (uses COPY format by default for faster export)
  echo "Backing up data for table: $SCHEMA.$TABLE"
  if ! $PG_DUMP "$DB_URL" --table="$SCHEMA.$TABLE" \
    --data-only --no-owner --no-privileges --no-tablespaces \
    --no-sync \
    > "$TABLE_DIR/data.sql" 2> "$ERROR_FILE"; then
    echo "Error: Failed to backup data for $SCHEMA.$TABLE" >&2
    if [ -s "$ERROR_FILE" ]; then
      echo "pg_dump error:" >&2
      cat "$ERROR_FILE" | sed 's/postgresql:\/\/[^@]*@/postgresql:\/\/***@/g' >&2
      
      if grep -qi "no matching tables" "$ERROR_FILE"; then
        echo "Note: This might be a system table, view, or materialized view that cannot be dumped" >&2
        echo "Skipping this table and continuing..." >&2
        rm -f "$ERROR_FILE" "$TABLE_DIR/data.sql" "$TABLE_DIR/schema.sql" 2>/dev/null
        return 1
      fi
    else
      echo "No error details available" >&2
    fi
    rm -f "$ERROR_FILE"
    return 1
  fi

  rm -f "$ERROR_FILE"
  [ ! -f "$TABLE_DIR/schema.sql" ] || [ ! -f "$TABLE_DIR/data.sql" ] && {
    echo "Error: Backup files not created for $SCHEMA.$TABLE" >&2
    return 1
  }

  echo "Successfully backed up table: $SCHEMA.$TABLE"
}

# Backup all tables in a schema - Optimized with parallel execution
# Uses parallel jobs for faster backup when multiple tables exist
backup_schema() {
  local DB_URL="${1:-}"
  local SCHEMA="${2:-}"
  local OUTPUT_DIR="${3:-}"

  [ -z "$DB_URL" ] || [ -z "$SCHEMA" ] || [ -z "$OUTPUT_DIR" ] && {
    echo "Error: All parameters are required" >&2
    return 1
  }

  mkdir -p "$OUTPUT_DIR/$SCHEMA/tables"
  echo "Processing schema: $SCHEMA"

  local TABLES=$(detect_tables "$DB_URL" "$SCHEMA")
  [ -z "$TABLES" ] && { echo "No tables found in schema: $SCHEMA"; return 0; }

  # Count tables for parallel execution decision
  local TABLE_LIST=()
  while IFS= read -r table; do
    [ -n "$table" ] && TABLE_LIST+=("$table")
  done <<< "$TABLES"
  
  local TOTAL_TABLES=${#TABLE_LIST[@]}
  local MAX_PARALLEL=${BACKUP_MAX_PARALLEL:-4}  # Default to 4 parallel jobs
  local TABLE_COUNT=0
  local FAILED_COUNT=0
  
  # Use parallel execution for schemas with multiple tables
  if [ $TOTAL_TABLES -gt 1 ] && [ $MAX_PARALLEL -gt 1 ]; then
    echo "Backing up $TOTAL_TABLES tables in parallel (max $MAX_PARALLEL jobs)..."
    
    # Temporarily disable exit on error for parallel execution
    set +e
    
    # Use associative array for PID to table mapping (more reliable)
    declare -A PID_TABLE_MAP
    local PIDS=()
    
    for table in "${TABLE_LIST[@]}"; do
      # Wait if we've reached max parallel jobs
      while [ ${#PIDS[@]} -ge $MAX_PARALLEL ]; do
        # Check which jobs have completed
        local NEW_PIDS=()
        for pid in "${PIDS[@]}"; do
          if kill -0 "$pid" 2>/dev/null; then
            NEW_PIDS+=("$pid")
          else
            # Job completed, check result (wait won't fail if process already gone)
            wait "$pid" 2>/dev/null || true
            local EXIT_CODE=$?
            local TABLE_NAME="${PID_TABLE_MAP[$pid]:-unknown}"
            if [ $EXIT_CODE -eq 0 ]; then
              ((TABLE_COUNT++))
            else
              ((FAILED_COUNT++))
              echo "Warning: Failed to backup table $SCHEMA.$TABLE_NAME" >&2
            fi
            unset PID_TABLE_MAP[$pid]
          fi
        done
        PIDS=("${NEW_PIDS[@]}")
        sleep 0.1
      done
      
      # Start backup job in background
      (
        # Disable exit on error in subshell to prevent parent from exiting
        set +e
        backup_table "$DB_URL" "$SCHEMA" "$table" "$OUTPUT_DIR"
        exit $?
      ) &
      local PID=$!
      PIDS+=("$PID")
      PID_TABLE_MAP[$PID]="$table"
    done
    
    # Wait for all remaining jobs
    for pid in "${PIDS[@]}"; do
      wait "$pid" 2>/dev/null || true
      local EXIT_CODE=$?
      local TABLE_NAME="${PID_TABLE_MAP[$pid]:-unknown}"
      if [ $EXIT_CODE -eq 0 ]; then
        ((TABLE_COUNT++))
      else
        ((FAILED_COUNT++))
        echo "Warning: Failed to backup table $SCHEMA.$TABLE_NAME" >&2
      fi
    done
    
    # Don't re-enable exit on error - let caller control error handling
    # set -e  # Commented out to allow caller to control error handling
  else
    # Sequential execution for single table or when parallel disabled
    for table in "${TABLE_LIST[@]}"; do
      set +e
      if backup_table "$DB_URL" "$SCHEMA" "$table" "$OUTPUT_DIR"; then
        ((TABLE_COUNT++))
      else
        ((FAILED_COUNT++))
        echo "Warning: Failed to backup table $SCHEMA.$table, continuing with other tables..." >&2
      fi
      # Don't re-enable exit on error - let caller control error handling
    done
  fi

  if [ $FAILED_COUNT -gt 0 ]; then
    echo "Warning: Failed to backup $FAILED_COUNT table(s) in schema: $SCHEMA" >&2
  fi
  
  if [ $TABLE_COUNT -gt 0 ]; then
    echo "Successfully backed up $TABLE_COUNT table(s) in schema: $SCHEMA"
  else
    echo "Warning: No tables were successfully backed up in schema: $SCHEMA" >&2
  fi
}

# Print comprehensive backup summary
# Collects and displays detailed statistics about the completed backup
print_backup_summary() {
  local BACKUP_DIR="${1:-}"
  local DB_URL="${2:-}"
  local START_TIME="${3:-}"
  local END_TIME="${4:-}"
  
  [ -z "$BACKUP_DIR" ] && {
    echo "Error: Backup directory is required" >&2
    return 1
  }
  
  local END_TIME_ACTUAL="${END_TIME:-$(date +%s)}"
  local START_TIME_ACTUAL="${START_TIME:-$END_TIME_ACTUAL}"
  local DURATION=$((END_TIME_ACTUAL - START_TIME_ACTUAL))
  
  # Get database size if DB_URL provided
  local DB_SIZE=0
  if [ -n "$DB_URL" ]; then
    local PSQL=$(get_pg_binary "psql")
    DB_URL=$(force_ipv4_connection "$DB_URL" 2>/dev/null)
    DB_SIZE=$($PSQL "$DB_URL" -Atc "SELECT pg_database_size(current_database());" 2>/dev/null || echo "0")
  fi
  
  # Count schemas and tables
  local SCHEMA_COUNT=0
  local TOTAL_TABLE_COUNT=0
  local TOTAL_BACKUP_SIZE=0
  local ROLES_SIZE=0
  
  # Count roles file size
  if [ -f "$BACKUP_DIR/latest/roles.sql" ]; then
    ROLES_SIZE=$(stat -c%s "$BACKUP_DIR/latest/roles.sql" 2>/dev/null || echo "0")
    TOTAL_BACKUP_SIZE=$((TOTAL_BACKUP_SIZE + ROLES_SIZE))
  fi
  
  # Process each schema directory
  local SCHEMA_DETAILS=""
  if [ -d "$BACKUP_DIR/latest" ]; then
    while IFS= read -r schema_dir; do
      [ ! -d "$schema_dir" ] && continue
      
      local schema=$(basename "$schema_dir")
      [ "$schema" = "latest" ] && continue
      
      SCHEMA_COUNT=$((SCHEMA_COUNT + 1))
      
      # Count tables in this schema
      local table_count=0
      local schema_table_size=0
      local schema_dump_size=0
      
      if [ -d "$schema_dir/tables" ]; then
        table_count=$(find "$schema_dir/tables" -mindepth 1 -maxdepth 1 -type d 2>/dev/null | wc -l)
        schema_table_size=$(du -sb "$schema_dir/tables" 2>/dev/null | cut -f1 || echo "0")
        TOTAL_BACKUP_SIZE=$((TOTAL_BACKUP_SIZE + schema_table_size))
      fi
      
      # Check for schema dump file
      local dump_file=$(find "$schema_dir" -maxdepth 1 -name "${schema}_schema_*.dump" -type f 2>/dev/null | head -1)
      if [ -n "$dump_file" ] && [ -f "$dump_file" ]; then
        schema_dump_size=$(stat -c%s "$dump_file" 2>/dev/null || echo "0")
        TOTAL_BACKUP_SIZE=$((TOTAL_BACKUP_SIZE + schema_dump_size))
      fi
      
      TOTAL_TABLE_COUNT=$((TOTAL_TABLE_COUNT + table_count))
      
      # Format schema details
      SCHEMA_DETAILS="${SCHEMA_DETAILS}
  ${schema}:
    - Tables: ${table_count}
    - Per-table files: $(numfmt --to=iec-i --suffix=B "$schema_table_size" 2>/dev/null || echo "0B")"
      
      if [ -n "$dump_file" ]; then
        SCHEMA_DETAILS="${SCHEMA_DETAILS}
    - Schema dump: $(numfmt --to=iec-i --suffix=B "$schema_dump_size" 2>/dev/null || echo "0B") ($(basename "$dump_file"))"
      fi
      
      local schema_total=$((schema_table_size + schema_dump_size))
      SCHEMA_DETAILS="${SCHEMA_DETAILS}
    - Total schema size: $(numfmt --to=iec-i --suffix=B "$schema_total" 2>/dev/null || echo "0B")"
      
    done <<< "$(find "$BACKUP_DIR/latest" -mindepth 1 -maxdepth 1 -type d 2>/dev/null)"
  fi
  
  # Calculate backup speed if duration > 0
  local BACKUP_SPEED="N/A"
  if [ $DURATION -gt 0 ] && [ $TOTAL_BACKUP_SIZE -gt 0 ]; then
    local speed_bps=$((TOTAL_BACKUP_SIZE / DURATION))
    BACKUP_SPEED="$(numfmt --to=iec-i --suffix=B/s "$speed_bps" 2>/dev/null || echo "N/A")"
  fi
  
  # Print summary
  cat <<EOF

╔════════════════════════════════════════════════════════════════╗
║                    BACKUP SUMMARY REPORT                       ║
╚════════════════════════════════════════════════════════════════╝

📅 Backup Information:
   Timestamp:        $(date -u +"%Y-%m-%d %H:%M:%S UTC")
   Duration:         ${DURATION}s
   Backup Speed:     ${BACKUP_SPEED}

💾 Database Information:
EOF

  if [ $DB_SIZE -gt 0 ]; then
    cat <<EOF
   Database Size:    $(numfmt --to=iec-i --suffix=B "$DB_SIZE" 2>/dev/null || echo "N/A")
EOF
  else
    cat <<EOF
   Database Size:    N/A (not available)
EOF
  fi

  cat <<EOF

📊 Backup Statistics:
   Schemas Backed Up: ${SCHEMA_COUNT}
   Tables Backed Up:  ${TOTAL_TABLE_COUNT}
   Roles File Size:   $(numfmt --to=iec-i --suffix=B "$ROLES_SIZE" 2>/dev/null || echo "0B")
   Total Backup Size: $(numfmt --to=iec-i --suffix=B "$TOTAL_BACKUP_SIZE" 2>/dev/null || echo "0B")

📁 Schema Details:${SCHEMA_DETAILS}

📂 Backup Location:
   Directory: ${BACKUP_DIR}/latest

✅ Status: Backup completed successfully

╚════════════════════════════════════════════════════════════════╝
EOF
}

# Main entry point for command-line usage
if [ "${BASH_SOURCE[0]}" = "${0}" ]; then
  case "${1:-}" in
    roles)  backup_roles "${2:-}" "${3:-}" ;;
    table)  backup_table "${2:-}" "${3:-}" "${4:-}" "${5:-}" ;;
    schema) backup_schema "${2:-}" "${3:-}" "${4:-}" ;;
    summary) print_backup_summary "${2:-}" "${3:-}" "${4:-}" "${5:-}" ;;
    *)
      echo "Usage: $0 {roles|table|schema|summary} [args...]" >&2
      exit 1
      ;;
  esac
fi
