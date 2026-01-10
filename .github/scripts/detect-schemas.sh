#!/bin/bash
# Detect user schemas in Supabase database
# Excludes Supabase system schemas automatically

set -uo pipefail  # Don't exit on error immediately, we'll handle it

# Input: Database connection string
DB_URL="${1:-}"

if [ -z "$DB_URL" ]; then
  echo "Error: Database URL is required" >&2
  exit 1
fi

# Query to detect user schemas (excluding system schemas)
# First test connection with better error reporting
# Supabase requires SSL connections - add ?sslmode=require if not present
if [[ "$DB_URL" != *"sslmode"* ]]; then
  if [[ "$DB_URL" == *"?"* ]]; then
    DB_URL="${DB_URL}&sslmode=require"
  else
    DB_URL="${DB_URL}?sslmode=require"
  fi
fi

CONNECTION_TEST=$(psql "$DB_URL" -c "SELECT 1;" 2>&1)
CONNECTION_EXIT=$?

if [ $CONNECTION_EXIT -ne 0 ]; then
  echo "Error: Failed to connect to database" >&2
  echo "Exit code: $CONNECTION_EXIT" >&2
  echo "Connection test output:" >&2
  # Mask password in error output
  echo "$CONNECTION_TEST" | sed 's/postgresql:\/\/[^@]*@/postgresql:\/\/***@/g' >&2
  echo "" >&2
  echo "Troubleshooting:" >&2
  echo "1. Verify the connection string is correct" >&2
  echo "2. Special characters in password must be URL-encoded:" >&2
  echo "   - @ becomes %40" >&2
  echo "   - : becomes %3A" >&2
  echo "   - / becomes %2F" >&2
  echo "   - # becomes %23" >&2
  echo "3. Example: password 'pass@word' should be 'pass%40word'" >&2
  exit 1
fi

# Use the same DB_URL (with SSL) for the schema query
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
" 2>&1)

EXIT_CODE=$?
if [ $EXIT_CODE -ne 0 ]; then
  echo "Error: Failed to query database for schemas" >&2
  echo "Exit code: $EXIT_CODE" >&2
  # Show error but mask sensitive connection string details
  echo "$SCHEMAS" | sed 's/postgresql:\/\/[^@]*@/postgresql:\/\/***@/g' >&2
  exit 1
fi

# Output schemas (one per line, filter out empty lines)
echo "$SCHEMAS" | grep -v '^$' | while IFS= read -r schema; do
  if [ -n "$schema" ]; then
    echo "$schema"
  fi
done
