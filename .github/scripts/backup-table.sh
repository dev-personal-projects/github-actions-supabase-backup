#!/bin/bash
# Backup a single table (schema and data)
# Creates schema.sql and data.sql files for the table

set -euo pipefail

# Input parameters
DB_URL="${1:-}"
SCHEMA="${2:-}"
TABLE="${3:-}"
OUTPUT_DIR="${4:-}"

if [ -z "$DB_URL" ] || [ -z "$SCHEMA" ] || [ -z "$TABLE" ] || [ -z "$OUTPUT_DIR" ]; then
  echo "Error: All parameters are required" >&2
  echo "Usage: $0 <db_url> <schema> <table> <output_dir>" >&2
  exit 1
fi

# Create table directory
TABLE_DIR="$OUTPUT_DIR/$SCHEMA/tables/$TABLE"
mkdir -p "$TABLE_DIR"

# Backup table structure (schema only, no data)
echo "Backing up structure for table: $SCHEMA.$TABLE"
pg_dump "$DB_URL" \
  --schema="$SCHEMA" \
  --table="$SCHEMA.$TABLE" \
  --schema-only \
  --no-owner \
  --no-privileges \
  --no-tablespaces \
  > "$TABLE_DIR/schema.sql" 2>&1 || {
  echo "Error: Failed to backup schema for $SCHEMA.$TABLE" >&2
  exit 1
}

# Backup table data only
# Use COPY format for better performance with large tables
echo "Backing up data for table: $SCHEMA.$TABLE"
pg_dump "$DB_URL" \
  --schema="$SCHEMA" \
  --table="$SCHEMA.$TABLE" \
  --data-only \
  --no-owner \
  --no-privileges \
  --no-tablespaces \
  > "$TABLE_DIR/data.sql" 2>&1 || {
  echo "Error: Failed to backup data for $SCHEMA.$TABLE" >&2
  exit 1
}

# Verify files were created
if [ ! -f "$TABLE_DIR/schema.sql" ] || [ ! -f "$TABLE_DIR/data.sql" ]; then
  echo "Error: Backup files not created for $SCHEMA.$TABLE" >&2
  exit 1
fi

echo "Successfully backed up table: $SCHEMA.$TABLE"
