#!/bin/bash
# Backup database roles and permissions
# Creates roles.sql file

set -euo pipefail

# Input parameters
DB_URL="${1:-}"
OUTPUT_FILE="${2:-}"

if [ -z "$DB_URL" ] || [ -z "$OUTPUT_FILE" ]; then
  echo "Error: Database URL and output file are required" >&2
  echo "Usage: $0 <db_url> <output_file>" >&2
  exit 1
fi

# Source common functions
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/common.sh"

# Force IPv4 and ensure SSL
DB_URL=$(force_ipv4_connection "$DB_URL")

# Create output directory if it doesn't exist
OUTPUT_DIR=$(dirname "$OUTPUT_FILE")
mkdir -p "$OUTPUT_DIR"

# Backup roles using pg_dumpall directly (more reliable than supabase CLI for pooler connections)
echo "Backing up database roles..."
# Use pg_dumpall with --roles-only flag
if ! pg_dumpall "$DB_URL" \
  --roles-only \
  --no-password \
  > "$OUTPUT_FILE" 2>&1; then
  
  echo "Error: Failed to backup roles" >&2
  # Show error but mask sensitive connection string details
  cat "$OUTPUT_FILE" | sed 's/postgresql:\/\/[^@]*@/postgresql:\/\/***@/g' >&2
  exit 1
fi

# Verify file was created
if [ ! -f "$OUTPUT_FILE" ]; then
  echo "Error: Roles backup file not created" >&2
  exit 1
fi

echo "Successfully backed up roles to $OUTPUT_FILE"
