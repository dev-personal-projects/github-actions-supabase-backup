#!/bin/bash
# Database detection functions

# Don't use set -euo pipefail at the top level when sourced
# It will cause the script to exit if any command fails, even during sourcing
if [ "${BASH_SOURCE[0]}" = "${0}" ]; then
  set -euo pipefail
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/common.sh"

# Detect all schemas for full database backup
# Includes ALL Supabase system schemas (auth, storage, realtime, vault, etc.)
# Only excludes PostgreSQL internal system schemas (pg_catalog, information_schema, pg_toast, pg_temp*)
detect_schemas() {
  local DB_URL="${1:-}"
  
  [ -z "$DB_URL" ] && { echo "Error: Database URL is required" >&2; exit 1; }

  # Force IPv4 and ensure SSL (capture resolution messages separately)
  local RESOLUTION_MSG=$(mktemp)
  DB_URL=$(force_ipv4_connection "$DB_URL" "$RESOLUTION_MSG")
  # Output resolution messages to stderr if any
  if [ -s "$RESOLUTION_MSG" ]; then
    cat "$RESOLUTION_MSG" >&2
  fi
  rm -f "$RESOLUTION_MSG"

  # Test connection
  local PSQL=$(get_pg_binary "psql")
  
  # Verify psql binary exists
  if [ ! -f "$PSQL" ] && ! command -v "$PSQL" >/dev/null 2>&1; then
    echo "Error: PostgreSQL client not found at: $PSQL" >&2
    echo "Attempted to find: $(get_pg_binary psql)" >&2
    exit 1
  fi
  
  local ERROR_FILE=$(mktemp)
  # Test connection - capture error but also show it immediately
  if ! $PSQL "$DB_URL" -c "SELECT 1;" >/dev/null 2> "$ERROR_FILE"; then
    echo "Error: Failed to connect to database" >&2
    echo "Using psql: $PSQL" >&2
    echo "Database URL (masked): $(echo "$DB_URL" | sed 's/postgresql:\/\/[^@]*@/postgresql:\/\/***@/g')" >&2
    if [ -s "$ERROR_FILE" ]; then
      echo "psql error output:" >&2
      cat "$ERROR_FILE" | sed 's/postgresql:\/\/[^@]*@/postgresql:\/\/***@/g' >&2
    else
      echo "No error details available (empty error file)" >&2
    fi
    rm -f "$ERROR_FILE"
    exit 1
  fi
  rm -f "$ERROR_FILE"

  # Query all schemas for full backup
  # Only exclude PostgreSQL internal system schemas
  # Include ALL Supabase system schemas (auth, storage, realtime, vault, etc.)
  local QUERY_OUTPUT=$(mktemp)
  local QUERY_ERROR=$(mktemp)
  
  if ! $PSQL "$DB_URL" -t -A -c "
    SELECT schema_name 
    FROM information_schema.schemata 
    WHERE schema_name NOT IN (
      'pg_catalog', 'information_schema', 'pg_toast'
    )
    AND schema_name NOT LIKE 'pg_temp%'
    AND schema_name NOT LIKE 'pg_toast_temp%'
    ORDER BY schema_name;
  " > "$QUERY_OUTPUT" 2> "$QUERY_ERROR"; then
    echo "Error: Failed to query schemas" >&2
    echo "Using psql: $PSQL" >&2
    if [ -s "$QUERY_ERROR" ]; then
      echo "psql error output:" >&2
      cat "$QUERY_ERROR" | sed 's/postgresql:\/\/[^@]*@/postgresql:\/\/***@/g' >&2
    else
      echo "No error details available (empty error file)" >&2
    fi
    rm -f "$QUERY_OUTPUT" "$QUERY_ERROR"
    exit 1
  fi
  
  # Output schemas (filter out empty lines)
  grep -v '^$' "$QUERY_OUTPUT" | while read -r schema; do
    [ -n "$schema" ] && echo "$schema"
  done
  
  rm -f "$QUERY_OUTPUT" "$QUERY_ERROR"
}

# Detect tables in a specific schema
# Uses connection semaphore if available to coordinate with backup operations
detect_tables() {
  local DB_URL="${1:-}"
  local SCHEMA="${2:-}"

  [ -z "$DB_URL" ] || [ -z "$SCHEMA" ] && { 
    echo "Error: Database URL and schema name are required" >&2
    exit 1
  }

  DB_URL=$(force_ipv4_connection "$DB_URL" 2>/dev/null)

  # Acquire connection slot if semaphore is available (for coordination with backups)
  # This prevents connection limit issues when multiple schemas detect tables in parallel
  local SLOT_FILE=""
  if [ -n "${GLOBAL_SEMAPHORE_DIR:-}" ] && [ -d "$GLOBAL_SEMAPHORE_DIR" ]; then
    # Use shorter timeout for table detection (30 seconds - detection queries are fast)
    export DETECTION_TIMEOUT=30
    SLOT_FILE=$(acquire_connection_slot 2>/dev/null || echo "")
    unset DETECTION_TIMEOUT
    if [ -z "$SLOT_FILE" ]; then
      # If semaphore acquisition fails, retry with exponential backoff (max 5s total)
      local retry=0
      local max_retries=3
      local delay=0.5
      while [ $retry -lt $max_retries ]; do
        sleep $delay
        export DETECTION_TIMEOUT=30
        SLOT_FILE=$(acquire_connection_slot 2>/dev/null || echo "")
        unset DETECTION_TIMEOUT
        [ -n "$SLOT_FILE" ] && break
        delay=$((delay * 2))
        ((retry++))
      done
    fi
  fi

  local PSQL=$(get_pg_binary "psql")
  local QUERY_OUTPUT=$(mktemp)
  local QUERY_ERROR=$(mktemp)
  local EXIT_CODE=0
  
  if ! $PSQL "$DB_URL" -t -A -c "
    SELECT table_name 
    FROM information_schema.tables 
    WHERE table_schema = '$SCHEMA'
    AND table_type = 'BASE TABLE'
    ORDER BY table_name;
  " > "$QUERY_OUTPUT" 2> "$QUERY_ERROR"; then
    echo "Error: Failed to query tables in schema '$SCHEMA'" >&2
    [ -s "$QUERY_ERROR" ] && cat "$QUERY_ERROR" | sed 's/postgresql:\/\/[^@]*@/postgresql:\/\/***@/g' >&2
    EXIT_CODE=1
  else
    # Output tables (filter out empty lines)
    grep -v '^$' "$QUERY_OUTPUT" | while read -r table; do
      [ -n "$table" ] && echo "$table"
    done
  fi
  
  # Release connection slot if we acquired one (release immediately after query)
  [ -n "$SLOT_FILE" ] && release_connection_slot "$SLOT_FILE" 2>/dev/null || true
  
  rm -f "$QUERY_OUTPUT" "$QUERY_ERROR"
  [ $EXIT_CODE -ne 0 ] && exit $EXIT_CODE
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
