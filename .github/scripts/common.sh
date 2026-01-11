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

# Global connection semaphore for coordinating database connections across all schemas
# Uses file-based locking to limit total concurrent connections
GLOBAL_SEMAPHORE_DIR="${GLOBAL_SEMAPHORE_DIR:-/tmp/backup_semaphore_$$}"
GLOBAL_MAX_CONNECTIONS="${GLOBAL_MAX_CONNECTIONS:-20}"  # Total concurrent connections across all schemas

# Initialize global semaphore
init_global_semaphore() {
  mkdir -p "$GLOBAL_SEMAPHORE_DIR"
  # Create semaphore slots directory (slots are created on-demand)
  touch "$GLOBAL_SEMAPHORE_DIR/.initialized"
}

# Acquire a connection slot (blocking)
# Uses atomic file operations to coordinate across processes
acquire_connection_slot() {
  local max_wait=300  # Maximum wait time in seconds (5 minutes)
  local waited=0
  local slot_num=0
  
  while [ $waited -lt $max_wait ]; do
    # Try each slot
    slot_num=0
    while [ $slot_num -lt $GLOBAL_MAX_CONNECTIONS ]; do
      local slot_file="$GLOBAL_SEMAPHORE_DIR/slot_${slot_num}"
      local lock_file="$slot_file.lock"
      
      # First, check if lock file exists and if the process is still alive
      if [ -f "$lock_file" ]; then
        local lock_pid=$(cat "$lock_file" 2>/dev/null || echo "")
        if [ -n "$lock_pid" ] && kill -0 "$lock_pid" 2>/dev/null; then
          # Process is alive, slot is taken - try next slot
          ((slot_num++))
          continue
        fi
        # Process is dead, clean up stale lock
        rm -f "$lock_file" 2>/dev/null
      fi
      
      # Try to acquire the slot atomically
      # set -C in subshell: creates file only if it doesn't exist (atomic operation)
      # Redirect stderr to /dev/null to suppress "cannot overwrite" messages
      # This is expected behavior when slot is taken
      if (set -C; echo $$ > "$lock_file") 2>/dev/null; then
        # Successfully acquired lock - slot is ours
        echo "$slot_file"
        return 0
      fi
      
      # If we get here, another process grabbed the slot between our check and create
      # This is normal - just try the next slot
      ((slot_num++))
    done
    
    # No slot available, wait a bit before retrying all slots
    sleep 0.1
    waited=$((waited + 1))
  done
  
  echo "Error: Timeout waiting for connection slot after ${max_wait}s" >&2
  return 1
}

# Release a connection slot
release_connection_slot() {
  local slot_file="${1:-}"
  [ -z "$slot_file" ] && return 1
  # Remove lock file to free the slot
  rm -f "$slot_file.lock" 2>/dev/null
}

# Cleanup semaphore directory
cleanup_global_semaphore() {
  [ -d "$GLOBAL_SEMAPHORE_DIR" ] && rm -rf "$GLOBAL_SEMAPHORE_DIR" 2>/dev/null
}
