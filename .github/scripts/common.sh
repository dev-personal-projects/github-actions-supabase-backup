#!/bin/bash
# Common functions for database connection handling

# Get PostgreSQL 17 binary path or fallback to system default
get_pg_binary() {
  local binary="$1"
  # Check multiple possible locations for PostgreSQL 17
  if [ -f "/usr/lib/postgresql/17/bin/$binary" ]; then
    echo "/usr/lib/postgresql/17/bin/$binary"
  elif [ -f "/usr/bin/$binary" ]; then
    # Fallback to system default (should be PostgreSQL 17 after installation)
    echo "/usr/bin/$binary"
  elif command -v "$binary" >/dev/null 2>&1; then
    # Use whatever is in PATH
    command -v "$binary"
  else
    echo "$binary"  # Last resort - let the shell find it
  fi
}

# Force IPv4 resolution for database connection strings
force_ipv4_connection() {
  local DB_URL="$1"
  local RESOLUTION_OUTPUT="${2:-/dev/stderr}"  # Optional: redirect resolution messages
  
  # Extract components from connection string
  if [[ "$DB_URL" =~ postgresql://([^:]+):([^@]+)@([^:/]+):([0-9]+)/([^?]*)(.*) ]]; then
    local USER="${BASH_REMATCH[1]}"
    local PASS="${BASH_REMATCH[2]}"
    local HOST="${BASH_REMATCH[3]}"
    local PORT="${BASH_REMATCH[4]}"
    local DB="${BASH_REMATCH[5]}"
    local PARAMS="${BASH_REMATCH[6]}"
    
    # Try to resolve to IPv4 address
    local IPV4=$(getent ahostsv4 "$HOST" 2>/dev/null | awk '{print $1; exit}' || \
                 dig +short A "$HOST" 2>/dev/null | grep -E '^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$' | head -1 || \
                 host -t A "$HOST" 2>/dev/null | grep -oE '([0-9]{1,3}\.){3}[0-9]{1,3}' | head -1)
    
    if [ -n "$IPV4" ]; then
      echo "Resolved $HOST to IPv4: $IPV4" > "$RESOLUTION_OUTPUT"
      DB_URL="postgresql://${USER}:${PASS}@${IPV4}:${PORT}/${DB}${PARAMS}"
    fi
  fi
  
  # Ensure SSL mode is set
  if [[ "$DB_URL" != *"sslmode"* ]]; then
    if [[ "$DB_URL" == *"?"* ]]; then
      DB_URL="${DB_URL}&sslmode=require"
    else
      DB_URL="${DB_URL}?sslmode=require"
    fi
  fi
  
  echo "$DB_URL"
}

# URL decode a string
url_decode() {
  local encoded="$1"
  encoded="${encoded//%40/@}"
  encoded="${encoded//%3A/:}"
  encoded="${encoded//%2F//}"
  encoded="${encoded//%23/#}"
  encoded="${encoded//%20/ }"
  encoded="${encoded//%25/%}"
  echo "$encoded"
}
