#!/bin/bash
# Detect user schemas in Supabase database
# Excludes Supabase system schemas automatically

set -euo pipefail

# Input: Database connection string
DB_URL="${1:-}"

if [ -z "$DB_URL" ]; then
  echo "Error: Database URL is required" >&2
  exit 1
fi

# Query to detect user schemas (excluding system schemas)
SCHEMAS=$(psql "$DB_URL" -t -A -c "
  SELECT schema_name 
  FROM information_schema.schemata 
  WHERE schema_name NOT IN (
    'pg_catalog', 'information_schema', 'pg_toast',
    'auth', 'extensions', 'graphql', 'graphql_public',
    'realtime', 'storage', 'vault', 'pgbouncer'
  )
  AND schema_name NOT LIKE 'pg_temp%'
  AND schema_name NOT LIKE 'pg_toast_temp%'
  ORDER BY schema_name;
" 2>/dev/null)

if [ $? -ne 0 ]; then
  echo "Error: Failed to query database for schemas" >&2
  exit 1
fi

# Output schemas (one per line, filter out empty lines)
echo "$SCHEMAS" | grep -v '^$' | while IFS= read -r schema; do
  if [ -n "$schema" ]; then
    echo "$schema"
  fi
done
