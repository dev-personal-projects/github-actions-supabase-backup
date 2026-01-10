#!/bin/bash
# Database detection functions
# Detects schemas and tables in Supabase database

set -euo pipefail

# Source common functions
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/common.sh"

# Detect user schemas (excludes Supabase system schemas)
detect_schemas() {
  local DB_URL="${1:-}"
  
  if [ -z "$DB_URL" ]; then
    echo "Error: Database URL is required" >&2
    exit 1
  fi

  # Force IPv4 and ensure SSL
  DB_URL=$(force_ipv4_connection "$DB_URL")

  # Test connection first
  local CONNECTION_TEST=$(psql "$DB_URL" -c "SELECT 1;" 2>&1)
  local CONNECTION_EXIT=$?

  if [ $CONNECTION_EXIT -ne 0 ]; then
    echo "Error: Failed to connect to database" >&2
    echo "Exit code: $CONNECTION_EXIT" >&2
    echo "Connection test output:" >&2
    echo "$CONNECTION_TEST" | sed 's/postgresql:\/\/[^@]*@/postgresql:\/\/***@/g' >&2
    echo "" >&2
    echo "Troubleshooting:" >&2
    echo "1. Verify the connection string is correct" >&2
    echo "2. Special characters in password must be URL-encoded:" >&2
    echo "   - @ becomes %40" >&2
    echo "   - : becomes %3A" >&2
    echo "   - / becomes %2F" >&2
    echo "   - # becomes %23" >&2
    exit 1
  fi

  # Query to detect user schemas (excluding system schemas)
  local SCHEMAS=$(psql "$DB_URL" -t -A -c "
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

  local EXIT_CODE=$?
  if [ $EXIT_CODE -ne 0 ]; then
    echo "Error: Failed to query database for schemas" >&2
    echo "Exit code: $EXIT_CODE" >&2
    echo "$SCHEMAS" | sed 's/postgresql:\/\/[^@]*@/postgresql:\/\/***@/g' >&2
    exit 1
  fi

  # Output schemas (one per line, filter out empty lines)
  echo "$SCHEMAS" | grep -v '^$' | while IFS= read -r schema; do
    if [ -n "$schema" ]; then
      echo "$schema"
    fi
  done
}

# Detect tables in a specific schema
detect_tables() {
  local DB_URL="${1:-}"
  local SCHEMA="${2:-}"

  if [ -z "$DB_URL" ] || [ -z "$SCHEMA" ]; then
    echo "Error: Database URL and schema name are required" >&2
    exit 1
  fi

  # Force IPv4 and ensure SSL
  DB_URL=$(force_ipv4_connection "$DB_URL")

  # Query to detect tables in the schema
  local TABLES=$(psql "$DB_URL" -t -A -c "
    SELECT table_name 
    FROM information_schema.tables 
    WHERE table_schema = '$SCHEMA'
    AND table_type = 'BASE TABLE'
    ORDER BY table_name;
  " 2>&1)

  local EXIT_CODE=$?
  if [ $EXIT_CODE -ne 0 ]; then
    echo "Error: Failed to query database for tables in schema '$SCHEMA'" >&2
    echo "Exit code: $EXIT_CODE" >&2
    echo "$TABLES" | sed 's/postgresql:\/\/[^@]*@/postgresql:\/\/***@/g' >&2
    exit 1
  fi

  # Output tables (one per line, filter out empty lines)
  echo "$TABLES" | grep -v '^$' | while IFS= read -r table; do
    if [ -n "$table" ]; then
      echo "$table"
    fi
  done
}

# Main entry point for command-line usage
if [ "${BASH_SOURCE[0]}" = "${0}" ]; then
  case "${1:-}" in
    schemas)
      detect_schemas "${2:-}"
      ;;
    tables)
      detect_tables "${2:-}" "${3:-}"
      ;;
    *)
      echo "Usage: $0 {schemas|tables} [args...]" >&2
      echo "  schemas <db_url>          - Detect user schemas" >&2
      echo "  tables <db_url> <schema>  - Detect tables in schema" >&2
      exit 1
      ;;
  esac
fi
