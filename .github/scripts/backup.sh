#!/bin/bash
# Database backup functions
# Handles backup of roles, schemas, and tables

set -euo pipefail

# Source common functions
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/common.sh"
source "$SCRIPT_DIR/detect.sh"

# Backup database roles
backup_roles() {
  local DB_URL="${1:-}"
  local OUTPUT_FILE="${2:-}"

  if [ -z "$DB_URL" ] || [ -z "$OUTPUT_FILE" ]; then
    echo "Error: Database URL and output file are required" >&2
    exit 1
  fi

  # Force IPv4 and ensure SSL
  DB_URL=$(force_ipv4_connection "$DB_URL")

  # Create output directory if it doesn't exist
  local OUTPUT_DIR=$(dirname "$OUTPUT_FILE")
  mkdir -p "$OUTPUT_DIR"

  echo "Backing up database roles..."
  if ! pg_dumpall "$DB_URL" \
    --roles-only \
    --no-password \
    > "$OUTPUT_FILE" 2>&1; then
    
    echo "Error: Failed to backup roles" >&2
    cat "$OUTPUT_FILE" | sed 's/postgresql:\/\/[^@]*@/postgresql:\/\/***@/g' >&2
    exit 1
  fi

  if [ ! -f "$OUTPUT_FILE" ]; then
    echo "Error: Roles backup file not created" >&2
    exit 1
  fi

  echo "Successfully backed up roles to $OUTPUT_FILE"
}

# Backup a single table (schema and data)
backup_table() {
  local DB_URL="${1:-}"
  local SCHEMA="${2:-}"
  local TABLE="${3:-}"
  local OUTPUT_DIR="${4:-}"

  if [ -z "$DB_URL" ] || [ -z "$SCHEMA" ] || [ -z "$TABLE" ] || [ -z "$OUTPUT_DIR" ]; then
    echo "Error: All parameters are required" >&2
    exit 1
  fi

  # Force IPv4 and ensure SSL
  DB_URL=$(force_ipv4_connection "$DB_URL")

  # Create table directory
  local TABLE_DIR="$OUTPUT_DIR/$SCHEMA/tables/$TABLE"
  mkdir -p "$TABLE_DIR"

  # Backup table structure (schema only)
  echo "Backing up structure for table: $SCHEMA.$TABLE"
  if ! pg_dump "$DB_URL" \
    --schema="$SCHEMA" \
    --table="$SCHEMA.$TABLE" \
    --schema-only \
    --no-owner \
    --no-privileges \
    --no-tablespaces \
    > "$TABLE_DIR/schema.sql" 2>&1; then
    echo "Error: Failed to backup schema for $SCHEMA.$TABLE" >&2
    exit 1
  fi

  # Backup table data only
  echo "Backing up data for table: $SCHEMA.$TABLE"
  if ! pg_dump "$DB_URL" \
    --schema="$SCHEMA" \
    --table="$SCHEMA.$TABLE" \
    --data-only \
    --no-owner \
    --no-privileges \
    --no-tablespaces \
    > "$TABLE_DIR/data.sql" 2>&1; then
    echo "Error: Failed to backup data for $SCHEMA.$TABLE" >&2
    exit 1
  fi

  # Verify files were created
  if [ ! -f "$TABLE_DIR/schema.sql" ] || [ ! -f "$TABLE_DIR/data.sql" ]; then
    echo "Error: Backup files not created for $SCHEMA.$TABLE" >&2
    exit 1
  fi

  echo "Successfully backed up table: $SCHEMA.$TABLE"
}

# Backup all tables in a schema
backup_schema() {
  local DB_URL="${1:-}"
  local SCHEMA="${2:-}"
  local OUTPUT_DIR="${3:-}"

  if [ -z "$DB_URL" ] || [ -z "$SCHEMA" ] || [ -z "$OUTPUT_DIR" ]; then
    echo "Error: All parameters are required" >&2
    exit 1
  fi

  # Create schema directory
  local SCHEMA_DIR="$OUTPUT_DIR/$SCHEMA/tables"
  mkdir -p "$SCHEMA_DIR"

  echo "Processing schema: $SCHEMA"

  # Detect tables in the schema
  local TABLES=$(detect_tables "$DB_URL" "$SCHEMA")

  if [ -z "$TABLES" ]; then
    echo "No tables found in schema: $SCHEMA"
    return 0
  fi

  # Backup each table
  local TABLE_COUNT=0
  while IFS= read -r table; do
    if [ -n "$table" ]; then
      if backup_table "$DB_URL" "$SCHEMA" "$table" "$OUTPUT_DIR"; then
        ((TABLE_COUNT++))
      else
        echo "Warning: Failed to backup table $SCHEMA.$table" >&2
      fi
    fi
  done <<< "$TABLES"

  echo "Successfully backed up $TABLE_COUNT table(s) in schema: $SCHEMA"
}

# Main entry point for command-line usage
if [ "${BASH_SOURCE[0]}" = "${0}" ]; then
  case "${1:-}" in
    roles)
      backup_roles "${2:-}" "${3:-}"
      ;;
    table)
      backup_table "${2:-}" "${3:-}" "${4:-}" "${5:-}"
      ;;
    schema)
      backup_schema "${2:-}" "${3:-}" "${4:-}"
      ;;
    *)
      echo "Usage: $0 {roles|table|schema} [args...]" >&2
      echo "  roles <db_url> <output_file>              - Backup database roles" >&2
      echo "  table <db_url> <schema> <table> <output>  - Backup a single table" >&2
      echo "  schema <db_url> <schema> <output>        - Backup all tables in schema" >&2
      exit 1
      ;;
  esac
fi
