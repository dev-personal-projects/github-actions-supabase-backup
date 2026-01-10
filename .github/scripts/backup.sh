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

# Backup a single table (schema and data)
backup_table() {
  local DB_URL="${1:-}"
  local SCHEMA="${2:-}"
  local TABLE="${3:-}"
  local OUTPUT_DIR="${4:-}"

  [ -z "$DB_URL" ] || [ -z "$SCHEMA" ] || [ -z "$TABLE" ] || [ -z "$OUTPUT_DIR" ] && {
    echo "Error: All parameters are required" >&2
    exit 1
  }

  DB_URL=$(force_ipv4_connection "$DB_URL" 2>/dev/null)
  local TABLE_DIR="$OUTPUT_DIR/$SCHEMA/tables/$TABLE"
  mkdir -p "$TABLE_DIR"

  local PG_DUMP=$(get_pg_binary "pg_dump")
  local ERROR_FILE=$(mktemp)

  # Backup schema
  echo "Backing up structure for table: $SCHEMA.$TABLE"
  if ! $PG_DUMP "$DB_URL" --schema="$SCHEMA" --table="$TABLE" \
    --schema-only --no-owner --no-privileges --no-tablespaces \
    > "$TABLE_DIR/schema.sql" 2> "$ERROR_FILE"; then
    echo "Error: Failed to backup schema for $SCHEMA.$TABLE" >&2
    [ -s "$ERROR_FILE" ] && cat "$ERROR_FILE" | sed 's/postgresql:\/\/[^@]*@/postgresql:\/\/***@/g' >&2
    rm -f "$ERROR_FILE"
    exit 1
  fi

  # Backup data
  echo "Backing up data for table: $SCHEMA.$TABLE"
  if ! $PG_DUMP "$DB_URL" --schema="$SCHEMA" --table="$TABLE" \
    --data-only --no-owner --no-privileges --no-tablespaces \
    > "$TABLE_DIR/data.sql" 2> "$ERROR_FILE"; then
    echo "Error: Failed to backup data for $SCHEMA.$TABLE" >&2
    [ -s "$ERROR_FILE" ] && cat "$ERROR_FILE" | sed 's/postgresql:\/\/[^@]*@/postgresql:\/\/***@/g' >&2
    rm -f "$ERROR_FILE"
    exit 1
  fi

  rm -f "$ERROR_FILE"
  [ ! -f "$TABLE_DIR/schema.sql" ] || [ ! -f "$TABLE_DIR/data.sql" ] && {
    echo "Error: Backup files not created for $SCHEMA.$TABLE" >&2
    exit 1
  }

  echo "Successfully backed up table: $SCHEMA.$TABLE"
}

# Backup all tables in a schema
backup_schema() {
  local DB_URL="${1:-}"
  local SCHEMA="${2:-}"
  local OUTPUT_DIR="${3:-}"

  [ -z "$DB_URL" ] || [ -z "$SCHEMA" ] || [ -z "$OUTPUT_DIR" ] && {
    echo "Error: All parameters are required" >&2
    exit 1
  }

  mkdir -p "$OUTPUT_DIR/$SCHEMA/tables"
  echo "Processing schema: $SCHEMA"

  local TABLES=$(detect_tables "$DB_URL" "$SCHEMA")
  [ -z "$TABLES" ] && { echo "No tables found in schema: $SCHEMA"; return 0; }

  local TABLE_COUNT=0
  while IFS= read -r table; do
    [ -n "$table" ] && backup_table "$DB_URL" "$SCHEMA" "$table" "$OUTPUT_DIR" && ((TABLE_COUNT++)) || {
      echo "Warning: Failed to backup table $SCHEMA.$table" >&2
    }
  done <<< "$TABLES"

  echo "Successfully backed up $TABLE_COUNT table(s) in schema: $SCHEMA"
}

# Main entry point for command-line usage
if [ "${BASH_SOURCE[0]}" = "${0}" ]; then
  case "${1:-}" in
    roles)  backup_roles "${2:-}" "${3:-}" ;;
    table)  backup_table "${2:-}" "${3:-}" "${4:-}" "${5:-}" ;;
    schema) backup_schema "${2:-}" "${3:-}" "${4:-}" ;;
    *)
      echo "Usage: $0 {roles|table|schema} [args...]" >&2
      exit 1
      ;;
  esac
fi
