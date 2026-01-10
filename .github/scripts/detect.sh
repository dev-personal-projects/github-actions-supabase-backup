#!/bin/bash
# Database detection functions

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/common.sh"

# Detect user schemas (excludes Supabase system schemas)
detect_schemas() {
  local DB_URL="${1:-}"
  
  [ -z "$DB_URL" ] && { echo "Error: Database URL is required" >&2; exit 1; }

  DB_URL=$(force_ipv4_connection "$DB_URL" 2>/dev/null)

  # Test connection
  local ERROR_FILE=$(mktemp)
  if ! psql "$DB_URL" -c "SELECT 1;" >/dev/null 2> "$ERROR_FILE"; then
    echo "Error: Failed to connect to database" >&2
    cat "$ERROR_FILE" | sed 's/postgresql:\/\/[^@]*@/postgresql:\/\/***@/g' >&2
    rm -f "$ERROR_FILE"
    exit 1
  fi
  rm -f "$ERROR_FILE"

  # Query schemas
  psql "$DB_URL" -t -A -c "
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
  " 2>&1 | grep -v '^$' | while read -r schema; do
    [ -n "$schema" ] && echo "$schema"
  done
}

# Detect tables in a specific schema
detect_tables() {
  local DB_URL="${1:-}"
  local SCHEMA="${2:-}"

  [ -z "$DB_URL" ] || [ -z "$SCHEMA" ] && { 
    echo "Error: Database URL and schema name are required" >&2
    exit 1
  }

  DB_URL=$(force_ipv4_connection "$DB_URL" 2>/dev/null)

  psql "$DB_URL" -t -A -c "
    SELECT table_name 
    FROM information_schema.tables 
    WHERE table_schema = '$SCHEMA'
    AND table_type = 'BASE TABLE'
    ORDER BY table_name;
  " 2>&1 | grep -v '^$' | while read -r table; do
    [ -n "$table" ] && echo "$table"
  done
}

# Main entry point for command-line usage
if [ "${BASH_SOURCE[0]}" = "${0}" ]; then
  case "${1:-}" in
    schemas) detect_schemas "${2:-}" ;;
    tables)  detect_tables "${2:-}" "${3:-}" ;;
    *)
      echo "Usage: $0 {schemas|tables} [args...]" >&2
      exit 1
      ;;
  esac
fi
