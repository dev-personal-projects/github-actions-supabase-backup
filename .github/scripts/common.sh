#!/bin/bash
# Common functions for database connection handling

# Get latest PostgreSQL binary path or fallback to system default
# Detects the highest versioned PostgreSQL installation available
get_pg_binary() {
  local binary="$1"
  
  # First, try to find the latest PostgreSQL version in standard locations
  # Look for /usr/lib/postgresql/*/bin/$binary and pick the highest version
  local latest_version=""
  local latest_path=""
  
  # Find all PostgreSQL versions in /usr/lib/postgresql/
  if [ -d "/usr/lib/postgresql" ]; then
    for pg_dir in /usr/lib/postgresql/*/bin/"$binary"; do
      if [ -f "$pg_dir" ]; then
        # Extract version number from path (e.g., /usr/lib/postgresql/17/bin/pg_dump -> 17)
        local version=$(echo "$pg_dir" | sed -n 's|/usr/lib/postgresql/\([0-9.]*\)/bin/.*|\1|p')
        # Compare versions (simple numeric comparison for major versions)
        local major_version=$(echo "$version" | cut -d. -f1)
        if [ -z "$latest_version" ] || [ "$major_version" -gt "$(echo "$latest_version" | cut -d. -f1)" ] 2>/dev/null || \
           ([ "$major_version" -eq "$(echo "$latest_version" | cut -d. -f1)" ] 2>/dev/null && [ "$version" \> "$latest_version" ] 2>/dev/null); then
          latest_version="$version"
          latest_path="$pg_dir"
        fi
      fi
    done
  fi
  
  # If we found a versioned binary, use it
  if [ -n "$latest_path" ] && [ -f "$latest_path" ]; then
    echo "$latest_path"
    return 0
  fi
  
  # Fallback to system default locations
  if [ -f "/usr/bin/$binary" ]; then
    echo "/usr/bin/$binary"
    return 0
  fi
  
  # Use whatever is in PATH
  if command -v "$binary" >/dev/null 2>&1; then
    command -v "$binary"
    return 0
  fi
  
  # Last resort - let the shell find it
  echo "$binary"
}

# Force IPv4 resolution for database connection strings
force_ipv4_connection() {
  local DB_URL="$1"
  local RESOLUTION_OUTPUT="${2:-/dev/stderr}"  # Optional: redirect resolution messages
  
  # Normalize connection string first (ensure password is URL-encoded)
  DB_URL=$(normalize_connection_string "$DB_URL")
  
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

# URL encode a string (handles special characters in passwords)
url_encode() {
  local raw="$1"
  # Encode special characters that break PostgreSQL connection strings
  # Don't encode % if it's already part of an encoded sequence (like %40)
  # We'll encode % only if it's standalone (not followed by hex digits)
  raw="${raw//@/%40}"
  raw="${raw//:/%3A}"
  raw="${raw//\//%2F}"
  raw="${raw//#/%23}"
  raw="${raw// /%20}"
  # Only encode standalone % (not part of %XX pattern)
  # This regex matches % not followed by two hex digits
  raw=$(echo "$raw" | sed 's/%\([^0-9A-Fa-f]\|$\)/%25\1/g' | sed 's/%\([0-9A-Fa-f]\)\?\([^0-9A-Fa-f]\)/%25\2/g' || echo "$raw")
  # Simpler approach: only encode % if it's not followed by two hex chars
  # Use a more reliable method - replace % only if not part of %XX
  local result=""
  local i=0
  while [ $i -lt ${#raw} ]; do
    local char="${raw:$i:1}"
    if [ "$char" = "%" ]; then
      # Check if followed by two hex digits
      if [ $((i + 2)) -lt ${#raw} ] && [[ "${raw:$((i+1)):2}" =~ ^[0-9A-Fa-f]{2}$ ]]; then
        # It's part of an encoded sequence, keep it
        result="${result}%"
        ((i++))
        result="${result}${raw:$i:2}"
        ((i+=2))
      else
        # Standalone %, encode it
        result="${result}%25"
        ((i++))
      fi
    else
      result="${result}${char}"
      ((i++))
    fi
  done
  echo "$result"
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

# Normalize connection string - ensures password is properly URL-encoded
normalize_connection_string() {
  local DB_URL="$1"
  
  # Remove protocol prefix
  local REST="${DB_URL#postgresql://}"
  
  # Try to find the pattern :port/ which indicates where host:port/db starts
  # This helps us identify where the password ends (before the @ before host)
  if [[ "$REST" =~ :([0-9]+)/(.+) ]]; then
    local PORT="${BASH_REMATCH[1]}"
    local DB_AND_PARAMS="${BASH_REMATCH[2]}"
    
    # Extract DB and params
    local DB="${DB_AND_PARAMS%%\?*}"
    local PARAMS="${DB_AND_PARAMS#*\?}"
    [ "$PARAMS" = "$DB_AND_PARAMS" ] && PARAMS=""
    
    # Find everything before :port/ - this is user:password@host
    local BEFORE_PORT="${REST%:*${PORT}/*}"
    
    # Find the @ that separates credentials from host
    # The host part should be after the last @ before :port/
    # Use parameter expansion to find the last @
    local CREDS_AND_HOST="${BEFORE_PORT}"
    
    # Try to extract using pattern matching
    # Pattern: user:password@host where password might contain @
    # We know host ends with :port, so find @ followed by something ending with :port
    if [[ "$CREDS_AND_HOST" =~ ^([^:]+):(.+)@(.+)$ ]]; then
      local USER="${BASH_REMATCH[1]}"
      local PASS="${BASH_REMATCH[2]}"
      local HOST="${BASH_REMATCH[3]}"
      
      # If password contains special chars and isn't encoded, encode it
      if [[ "$PASS" =~ [@:/#\ ] ]] && [[ "$PASS" != *"%"* ]]; then
        PASS=$(url_encode "$PASS")
      fi
      
      # Reconstruct connection string
      if [ -n "$PARAMS" ]; then
        DB_URL="postgresql://${USER}:${PASS}@${HOST}:${PORT}/${DB}?${PARAMS}"
      else
        DB_URL="postgresql://${USER}:${PASS}@${HOST}:${PORT}/${DB}"
      fi
    elif [[ "$DB_URL" =~ postgresql://([^:]+):([^@]+)@([^:/]+):([0-9]+)/([^?]*)(.*) ]]; then
      # Standard parsing worked (password doesn't contain @)
      local USER="${BASH_REMATCH[1]}"
      local PASS="${BASH_REMATCH[2]}"
      local HOST="${BASH_REMATCH[3]}"
      local PORT="${BASH_REMATCH[4]}"
      local DB="${BASH_REMATCH[5]}"
      local PARAMS="${BASH_REMATCH[6]}"
      
      # Check if password needs encoding
      if [[ "$PASS" =~ [@:/#\ ] ]] && [[ "$PASS" != *"%"* ]]; then
        PASS=$(url_encode "$PASS")
        if [ -n "$PARAMS" ]; then
          DB_URL="postgresql://${USER}:${PASS}@${HOST}:${PORT}/${DB}?${PARAMS}"
        else
          DB_URL="postgresql://${USER}:${PASS}@${HOST}:${PORT}/${DB}"
        fi
      fi
    fi
  fi
  
  echo "$DB_URL"
}

# Global connection semaphore for coordinating database connections across all schemas
# Uses file-based locking to limit total concurrent connections
GLOBAL_SEMAPHORE_DIR="${GLOBAL_SEMAPHORE_DIR:-/tmp/backup_semaphore_$$}"
GLOBAL_MAX_CONNECTIONS="${GLOBAL_MAX_CONNECTIONS:-10}"  # Total concurrent connections across all schemas

# Initialize global semaphore
init_global_semaphore() {
  mkdir -p "$GLOBAL_SEMAPHORE_DIR"
  # Create semaphore slots directory (slots are created on-demand)
  touch "$GLOBAL_SEMAPHORE_DIR/.initialized"
}

# Acquire a connection slot (blocking)
# Uses atomic file operations to coordinate across processes
acquire_connection_slot() {
  # Allow shorter timeout for table detection (faster queries)
  # Use shorter timeout if DETECTION_TIMEOUT is set, otherwise default to 5 minutes
  local max_wait=${DETECTION_TIMEOUT:-300}  # Default: 5 minutes, can be overridden for faster operations
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
