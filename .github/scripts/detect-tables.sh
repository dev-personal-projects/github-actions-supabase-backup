#!/bin/bash
# Detect tables in a specific schema
# Returns table names, one per line

set -euo pipefail

# Input: Database connection string and schema name
DB_URL="${1:-}"
SCHEMA="${2:-}"

if [ -z "$DB_URL" ] || [ -z "$SCHEMA" ]; then
  echo "Error: Database URL and schema name are required" >&2
  echo "Usage: $0 <db_url> <schema_name>" >&2
  exit 1
fi

# Query to detect tables in the schema
TABLES=$(psql "$DB_URL" -t -A -c "
  SELECT table_name 
  FROM information_schema.tables 
  WHERE table_schema = '$SCHEMA'
  AND table_type = 'BASE TABLE'
  ORDER BY table_name;
" 2>/dev/null)

if [ $? -ne 0 ]; then
  echo "Error: Failed to query database for tables in schema '$SCHEMA'" >&2
  exit 1
fi

# Output tables (one per line, filter out empty lines)
echo "$TABLES" | grep -v '^$' | while IFS= read -r table; do
  if [ -n "$table" ]; then
    echo "$table"
  fi
done
