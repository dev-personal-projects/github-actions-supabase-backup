#!/bin/bash
# Create directory structure for backups
# Creates base directories and schema/table directories as needed

set -euo pipefail

# Input: Base backup directory (default: backups)
BACKUP_BASE="${1:-backups}"

# Create base directories
mkdir -p "$BACKUP_BASE/latest"
mkdir -p "$BACKUP_BASE/archive"

echo "Created directory structure: $BACKUP_BASE/latest and $BACKUP_BASE/archive"
