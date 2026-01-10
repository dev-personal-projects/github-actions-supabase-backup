#!/bin/bash
# Backup database roles and permissions
# Creates roles.sql file

set -euo pipefail

# Input parameters
DB_URL="${1:-}"
OUTPUT_FILE="${2:-}"

if [ -z "$DB_URL" ] || [ -z "$OUTPUT_FILE" ]; then
  echo "Error: Database URL and output file are required" >&2
  echo "Usage: $0 <db_url> <output_file>" >&2
  exit 1
fi

# Create output directory if it doesn't exist
OUTPUT_DIR=$(dirname "$OUTPUT_FILE")
mkdir -p "$OUTPUT_DIR"

# Backup roles
echo "Backing up database roles..."
if ! supabase db dump \
  --db-url "$DB_URL" \
  --file "$OUTPUT_FILE" \
  --role-only 2>/dev/null; then
  
  echo "Error: Failed to backup roles" >&2
  exit 1
fi

# Verify file was created
if [ ! -f "$OUTPUT_FILE" ]; then
  echo "Error: Roles backup file not created" >&2
  exit 1
fi

echo "Successfully backed up roles to $OUTPUT_FILE"
