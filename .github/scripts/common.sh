#!/bin/bash
# Common functions for database connection handling

# Force IPv4 resolution for database connection strings
# This helps avoid IPv6 connectivity issues on GitHub Actions runners
force_ipv4_connection() {
  local DB_URL="$1"
  
  # Extract hostname from connection string (format: postgresql://user:pass@host:port/db?params)
  if [[ "$DB_URL" =~ postgresql://([^:]+):([^@]+)@([^:/]+):([0-9]+)/([^?]+)(.*) ]]; then
    local USER="${BASH_REMATCH[1]}"
    local PASS="${BASH_REMATCH[2]}"
    local HOST="${BASH_REMATCH[3]}"
    local PORT="${BASH_REMATCH[4]}"
    local DB="${BASH_REMATCH[5]}"
    local PARAMS="${BASH_REMATCH[6]}"
    
    # Try to resolve to IPv4 address
    local IPV4=$(getent ahostsv4 "$HOST" 2>/dev/null | awk '{print $1; exit}')
    if [ -n "$IPV4" ]; then
      echo "Resolved $HOST to IPv4: $IPV4" >&2
      # Reconstruct connection string with IP address
      DB_URL="postgresql://${USER}:${PASS}@${IPV4}:${PORT}/${DB}${PARAMS}"
    else
      echo "Warning: Could not resolve $HOST to IPv4, using hostname" >&2
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
