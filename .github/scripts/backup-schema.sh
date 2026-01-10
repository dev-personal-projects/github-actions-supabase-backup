#!/bin/bash
# Backup all tables in a schema
# Orchestrates table detection and backup for a single schema

set -euo pipefail

# Input parameters
DB_URL="${1:-}"
SCHEMA="${2:-}"
OUTPUT_DIR="${3:-}"
SCRIPTS_DIR="${4:-}"

if [ -z "$DB_URL" ] || [ -z "$SCHEMA" ] || [ -z "$OUTPUT_DIR" ] || [ -z "$SCRIPTS_DIR" ]; then
  echo "Error: All parameters are required" >&2
  echo "Usage: $0 <db_url> <schema> <output_dir> <scripts_dir>" >&2
  exit 1
fi

# Create schema directory
SCHEMA_DIR="$OUTPUT_DIR/$SCHEMA/tables"
mkdir -p "$SCHEMA_DIR"

echo "Processing schema: $SCHEMA"

# Detect tables in the schema
TABLES=$("$SCRIPTS_DIR/detect-tables.sh" "$DB_URL" "$SCHEMA")

if [ -z "$TABLES" ]; then
  echo "No tables found in schema: $SCHEMA"
  exit 0
fi

# Backup each table
TABLE_COUNT=0
while IFS= read -r table; do
  if [ -n "$table" ]; then
    echo "Backing up table: $SCHEMA.$table"
    if "$SCRIPTS_DIR/backup-table.sh" "$DB_URL" "$SCHEMA" "$table" "$OUTPUT_DIR"; then
      ((TABLE_COUNT++))
    else
      echo "Warning: Failed to backup table $SCHEMA.$table" >&2
    fi
  fi
done <<< "$TABLES"

echo "Successfully backed up $TABLE_COUNT table(s) in schema: $SCHEMA"
