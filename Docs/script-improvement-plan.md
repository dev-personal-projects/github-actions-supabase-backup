# Standalone Backup Script Improvement Plan

## 📋 Overview

This document outlines the plan for modernizing and improving the backup system. The dual backup structure has been implemented and integrated into `.github/workflows/backup.yaml`.

**Status**: ✅ **IMPLEMENTED** - Dual backup structure integrated into `.github/workflows/backup.yaml`

The workflow now creates both:
- Schema-level `.dump` files (custom format) for fast full schema restoration
- Per-table SQL files (`schema.sql` + `data.sql`) for selective restoration

The workflow now creates both:
- Schema-level `.dump` files (custom format) for fast full schema restoration
- Per-table SQL files (`schema.sql` + `data.sql`) for selective restoration

---

## 🎯 Goals

1. **PostgreSQL Version Alignment**: Ensure script uses PostgreSQL 17 client tools matching the database version
2. **Backup Completeness**: Ensure ALL schemas and tables are properly backed up (full database backup including ALL Supabase system schemas)
3. **Code Quality**: Align script with existing codebase patterns and best practices
4. **Enhanced Features**: Add timestamp-based naming and comprehensive backup summary
5. **Maintainability**: Improve code structure, naming, and documentation

---

## 📊 Current State Analysis

### Implementation Characteristics
- **Location**: `.github/workflows/backup.yaml` + `.github/scripts/backup.sh`
- **Purpose**: Full logical backup utility for Supabase databases with dual backup structure
- **Dependencies**: PostgreSQL client tools (latest version auto-detected)
- **Output Format**: Schema-level `.dump` files + per-table SQL files (dual structure)
- **Environments**: Works with any Supabase database via connection string

### Current Issues
1. ❌ PostgreSQL version not explicitly aligned with database (uses system default)
2. ❌ Creates single full database dump instead of per-schema dumps
3. ❌ Doesn't create schema-level .dump files in schema folders
4. ❌ Doesn't integrate with existing per-table backup structure
5. ❌ No timestamp in backup file names
6. ❌ Limited backup summary information
7. ❌ Doesn't use common.sh utilities consistently
8. ❌ Auth schema backup not explicitly handled
9. ❌ Code structure doesn't match backup.sh/detect.sh patterns

---

## 🔧 Improvement Requirements

### 1. PostgreSQL Version Alignment

**Requirement**: Script must use PostgreSQL 17 client tools to match database version.

**Implementation**:
- Use `get_pg_binary()` from `common.sh` to locate PostgreSQL 17 binaries
- Verify pg_dump version matches database version
- Add version check in prerequisites validation
- Document PostgreSQL 17 requirement

**Code Changes**:
```bash
# Replace direct pg_dump calls with:
local PG_DUMP=$(get_pg_binary "pg_dump")
local PG_DUMPALL=$(get_pg_binary "pg_dumpall")
local PSQL=$(get_pg_binary "psql")

# Add version verification:
verify_pg_version() {
  local pg_version=$($PG_DUMP --version | grep -oE '[0-9]+\.[0-9]+' | head -1)
  log_info "PostgreSQL client version: $pg_version"
  # Verify it's PostgreSQL 17.x
}
```

---

### 2. Dual Backup Structure: Schema .dump Files + Per-Table Files

**Requirement**: Each schema folder should contain BOTH a complete schema `.dump` file AND the existing per-table structure.

**Backup Structure**:
```
backups/latest/
├── database_full_20241215_143045.dump        # Full database dump (all schemas)
├── roles.sql
├── public/
│   ├── public_schema_20241215_143045.dump    # Full schema dump (all tables)
│   └── tables/                                # Per-table backups (existing structure)
│       ├── users/
│       │   ├── schema.sql
│       │   └── data.sql
│       └── orders/
│           ├── schema.sql
│           └── data.sql
├── auth/
│   ├── auth_schema_20241215_143045.dump     # Full auth schema dump
│   └── tables/                                # Per-table backups
│       ├── users/
│       │   ├── schema.sql
│       │   └── data.sql
│       └── ...
└── {custom-schema}/
    ├── {schema}_schema_20241215_143045.dump  # Full schema dump
    └── tables/                                # Per-table backups
        └── ...
```

**Benefits of Dual Approach**:
- ✅ **Fast Full Schema Restoration**: Use `.dump` file to restore entire schema quickly
- ✅ **Selective Table Restoration**: Use per-table files for granular restoration
- ✅ **Flexibility**: Choose restoration method based on need
- ✅ **Backup Completeness**: Both formats ensure complete backup coverage

**Implementation**:
- For each schema detected:
  1. Create schema directory: `backups/latest/{schema}/`
  2. Create full schema dump: `{schema}_schema_{timestamp}.dump` (contains all tables in schema)
  3. Create per-table backups: `tables/{table-name}/schema.sql` and `data.sql` (existing structure)
- Use timestamp format: `YYYYMMDD_HHMMSS` (e.g., `20241215_143045`)
- Both backup methods run for each schema

**Code Changes**:
```bash
# For each schema, create both:
# 1. Full schema dump
backup_schema_dump() {
  local conn_uri="$1"
  local schema="$2"
  local timestamp="$3"
  local output_dir="$4"
  local PG_DUMP=$(get_pg_binary "pg_dump")
  
  local dump_file="${output_dir}/${schema}/${schema}_schema_${timestamp}.dump"
  mkdir -p "${output_dir}/${schema}"
  
  $PG_DUMP "$conn_uri" \
    --schema="$schema" \
    --format=custom \
    --file="$dump_file" \
    --no-owner \
    --no-privileges \
    --blobs \
    --verbose
}

# 2. Per-table backups (existing backup.sh functions)
backup_schema_tables() {
  local conn_uri="$1"
  local schema="$2"
  local output_dir="$3"
  # Use existing backup.sh::backup_schema function
  source .github/scripts/backup.sh
  backup_schema "$conn_uri" "$schema" "$output_dir"
}
```

---

### 3. Comprehensive Backup Summary

**Requirement**: Display detailed backup summary after completion.

**Summary Should Include**:
- **Backup Metadata**:
  - Timestamp (when backup was created)
  - Environment (prod/dev)
  - Database name
  - Project reference (if available)
  
- **Database Statistics**:
  - Database size (human-readable format)
  - Number of schemas backed up
  - Number of tables backed up
  - List of schemas backed up
  
- **Backup File Information**:
  - For each schema:
    - Schema .dump file path and size
    - Number of tables backed up (per-table files)
    - Total size of per-table files
  - Total backup size (all schemas combined)
  - Backup formats (custom .dump + plain SQL)
  
- **Performance Metrics**:
  - Backup duration (total and per schema)
  - Backup speed (MB/s if applicable)
  
- **Status**:
  - Success/Failure status for each schema
  - Any warnings or errors
  - Connection details (masked)

**Implementation**:
```bash
print_backup_summary() {
  local env_name="$1"
  local backup_dir="$2"
  local start_time="$3"
  local end_time="$4"
  local db_size="$5"
  local schemas="$6"  # Space-separated list of schemas
  
  local duration=$((end_time - start_time))
  local total_dump_size=0
  local total_table_size=0
  local schema_count=$(echo "$schemas" | wc -w)
  local table_count=0
  
  cat <<EOF

========================================
  BACKUP SUMMARY - ${env_name^^}
========================================
Timestamp:        $(date -d "@$start_time" +"%Y-%m-%d %H:%M:%S UTC")
Environment:      ${env_name}
Database:         ${database}
Database Size:    $(numfmt --to=iec-i --suffix=B "$db_size")
Schemas Backed Up: ${schema_count}
Duration:         ${duration}s

Schema Details:
EOF
  
  # For each schema, show both .dump and per-table info
  for schema in $schemas; do
    local schema_dir="${backup_dir}/${schema}"
    local dump_file="${schema_dir}/${schema}_schema_*.dump"
    local dump_size=0
    local table_files_size=0
    local table_count_schema=0
    
    if [ -f "$dump_file" ]; then
      dump_size=$(stat -c%s "$dump_file" 2>/dev/null || echo "0")
      total_dump_size=$((total_dump_size + dump_size))
    fi
    
    if [ -d "${schema_dir}/tables" ]; then
      table_count_schema=$(find "${schema_dir}/tables" -mindepth 1 -maxdepth 1 -type d | wc -l)
      table_count=$((table_count + table_count_schema))
      table_files_size=$(du -sb "${schema_dir}/tables" 2>/dev/null | cut -f1 || echo "0")
      total_table_size=$((total_table_size + table_files_size))
    fi
    
    cat <<EOF
  ${schema}:
    - Schema dump: $(numfmt --to=iec-i --suffix=B "$dump_size")
    - Tables: ${table_count_schema} (per-table files: $(numfmt --to=iec-i --suffix=B "$table_files_size"))
EOF
  done
  
  cat <<EOF

Total Backup Size:
  - Schema dumps:  $(numfmt --to=iec-i --suffix=B "$total_dump_size")
  - Per-table files: $(numfmt --to=iec-i --suffix=B "$total_table_size")
  - Total:         $(numfmt --to=iec-i --suffix=B $((total_dump_size + total_table_size)))

Tables Backed Up:  ${table_count}
Status:           ✅ SUCCESS
========================================
EOF
}
```

---

### 4. Auth Schema Backup Support

**Requirement**: Back up Supabase auth schema with proper filtering.

**Current Behavior**: Auth schema may be excluded or not explicitly handled.

**Target Behavior**:
- Include ALL Supabase schemas in backups (auth, storage, realtime, vault, extensions, etc.)
- Back up ALL tables in each schema (complete backup)
- No exclusions for Supabase system schemas
- Document all schemas and tables backed up

**Implementation**:
- Query auth schema tables explicitly
- Filter out system/internal auth tables
- Use schema-qualified table names: `auth.table_name`
- Add auth schema to backup list if not already included

**Code Changes**:
```bash
# Detect auth schema tables
detect_auth_tables() {
  local DB_URL="$1"
  local PSQL=$(get_pg_binary "psql")
  
  $PSQL "$DB_URL" -t -A -c "
    SELECT table_name 
    FROM information_schema.tables 
    WHERE table_schema = 'auth'
    AND table_type = 'BASE TABLE'
    AND table_name NOT LIKE '%_%'  -- Filter system tables
    ORDER BY table_name;
  "
}

# Include auth schema in backup
backup_auth_schema() {
  local conn_uri="$1"
  local outfile="$2"
  # Use pg_dump with schema filter for auth
  $PG_DUMP "$conn_uri" \
    --schema=auth \
    --format=custom \
    --file="$outfile" \
    --no-owner \
    --no-privileges \
    --blobs \
    --verbose
}
```

---

### 5. Code Quality Improvements

**Requirement**: Align script with existing codebase patterns.

**Improvements**:
1. **Use common.sh utilities**:
   - `get_pg_binary()` for PostgreSQL tool paths
   - `force_ipv4_connection()` for connection string handling
   - `url_decode()` for password decoding
   - Consistent error handling patterns

2. **Follow backup.sh patterns**:
   - Similar function organization
   - Consistent error handling
   - Similar logging approach
   - Use `set -euo pipefail` appropriately

3. **Improve naming**:
   - Rename script to match conventions (e.g., `backup_full_dump.sh`)
   - Use consistent variable naming
   - Clear function names

4. **Better structure**:
   - Separate functions for different concerns
   - Clear separation of validation, backup, and summary
   - Consistent code style

**Code Structure**:
```bash
#!/bin/bash
# Script header with purpose and usage

set -euo pipefail

# Source common utilities
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/common.sh"

# Constants
readonly PROD_PROJECT_REF="..."
readonly DEV_PROJECT_REF="..."

# Helper functions
verify_prerequisites() { ... }
fetch_connection_string() { ... }
backup_database() { ... }
print_backup_summary() { ... }

# Main function
main() { ... }

main "$@"
```

---

## 📝 Implementation Checklist

### Phase 1: Prerequisites & Setup
- [ ] Update script to use `get_pg_binary()` from common.sh
- [ ] Add PostgreSQL 17 version verification
- [ ] Update prerequisites check to verify PostgreSQL 17
- [ ] Test PostgreSQL 17 binary detection

### Phase 2: Backup Improvements
- [ ] Implement dual backup structure (schema .dump + per-table files)
- [ ] Add timestamp to schema .dump file names
- [ ] Integrate with existing backup.sh for per-table backups
- [ ] Implement full database backup (ALL Supabase schemas in both formats)
- [ ] Ensure ALL schemas are backed up (public + ALL Supabase system schemas + custom schemas)
- [ ] Test backup completeness for both formats

### Phase 3: Summary & Reporting
- [ ] Implement comprehensive backup summary function
- [ ] Add database statistics collection
- [ ] Add performance metrics (duration, speed)
- [ ] Format summary output nicely
- [ ] Test summary display

### Phase 4: Code Quality
- [ ] Refactor to use common.sh utilities
- [ ] Align code structure with backup.sh patterns
- [ ] Improve function organization
- [ ] Add inline documentation
- [ ] Update script naming if needed
- [ ] Test all functionality

### Phase 5: Testing & Validation
- [ ] Test with prod environment
- [ ] Test with dev environment
- [ ] Test with both environments
- [ ] Verify backup file completeness
- [ ] Verify summary accuracy
- [ ] Test error handling

---

## 🔍 Technical Details

### PostgreSQL Version Compatibility

**Database Version**: PostgreSQL 17 (Supabase)
**Client Tools Required**: PostgreSQL 17 client tools
**Verification**: Check pg_dump version matches database version

### Backup Format

**Dual Format Approach**:

1. **Schema-Level .dump Files** (Custom format):
   - Format: Custom format (`.dump` files)
   - Location: `{schema}/{schema}_schema_{timestamp}.dump`
   - Contains: Complete schema backup (all tables, indexes, constraints, etc.)
   - Advantages:
     - Compressed by default
     - Can restore selectively (entire schema or specific tables)
     - Includes metadata
     - Faster than plain SQL
   - Flags Used:
     - `--schema={schema}`: Backup specific schema only
     - `--format=custom`: Custom format
     - `--no-owner`: Don't output commands to set ownership
     - `--no-privileges`: Don't output commands to set privileges
     - `--blobs`: Include large objects
     - `--verbose`: Verbose output

2. **Per-Table Files** (Plain SQL):
   - Format: Plain SQL files
   - Location: `{schema}/tables/{table-name}/schema.sql` and `data.sql`
   - Contains: Individual table structure and data
   - Advantages:
     - Human-readable SQL
     - Easy to edit or review
     - Selective restoration at table level
     - Version control friendly
   - Uses existing `backup.sh` functions for consistency

### Schema Backup Strategy

**FULL DATABASE BACKUP - All Schemas Included**:

**Included Schemas** (Complete Backup):
- `public` - Primary application schema
- `auth` - Supabase authentication (users, sessions, etc.)
- `storage` - Supabase storage (files, buckets, etc.)
- `realtime` - Supabase realtime system
- `vault` - Supabase secrets management
- `extensions` - PostgreSQL extensions metadata
- `graphql` - Supabase GraphQL system
- `graphql_public` - Supabase GraphQL public API
- `pgbouncer` - Connection pooling metadata
- `cron` - Scheduled jobs
- `pg_cron` - PostgreSQL cron extension
- `pgagent` - PostgreSQL agent
- All custom user schemas (e.g., `lh_billing`, `analytics`, etc.)
- Any other Supabase-managed schemas

**Excluded Schemas** (PostgreSQL Internal Only):
- `pg_catalog` - PostgreSQL system catalog (internal, cannot be backed up)
- `information_schema` - PostgreSQL information schema (internal, cannot be backed up)
- `pg_toast` - PostgreSQL toast tables (internal, cannot be backed up)
- `pg_temp_*` - Temporary schemas (session-specific, cannot be backed up)
- `pg_toast_temp_*` - Temporary toast schemas (session-specific, cannot be backed up)

**Note**: Only PostgreSQL internal system schemas are excluded. ALL Supabase schemas are included for complete backup coverage.

---

## 📚 Documentation Updates

### Script Documentation
- [ ] Update script header with purpose and usage
- [ ] Document PostgreSQL 17 requirement
- [ ] Document backup format and structure
- [ ] Document auth schema backup behavior
- [ ] Add examples in script comments

### README Updates
- [ ] Document standalone script usage
- [ ] Explain when to use standalone vs workflow
- [ ] Document PostgreSQL version requirements
- [ ] Add troubleshooting section

### Development Plan
- [ ] Update development-plan.md with Phase 8 details
- [ ] Mark tasks as complete when done

---

## ✅ Success Criteria

### Functional Requirements
- ✅ Script uses PostgreSQL 17 client tools
- ✅ Each schema folder contains both .dump file and per-table files
- ✅ Schema .dump files include timestamps
- ✅ ALL Supabase system schemas backed up (auth, storage, realtime, vault, etc.) in both formats
- ✅ Comprehensive backup summary displayed
- ✅ ALL schemas backed up (both formats) - full database backup
- ✅ Works with prod/dev/both environments
- ✅ Integrates with existing backup.sh for per-table structure
- ✅ No Supabase schema exclusions (only PostgreSQL internal schemas excluded)

### Code Quality Requirements
- ✅ Uses common.sh utilities
- ✅ Follows backup.sh patterns
- ✅ Consistent error handling
- ✅ Well-documented code
- ✅ Clear function organization

### Testing Requirements
- ✅ Tested with prod environment
- ✅ Tested with dev environment
- ✅ Backup files verified complete
- ✅ Summary information verified accurate
- ✅ Error handling tested

---

## 🚀 Next Steps

1. Review and approve this plan
2. Implement Phase 1 (Prerequisites & Setup)
3. Implement Phase 2 (Backup Improvements)
4. Implement Phase 3 (Summary & Reporting)
5. Implement Phase 4 (Code Quality)
6. Implement Phase 5 (Testing & Validation)
7. Update documentation
8. Deploy and monitor

---

**Document Version:** 1.0  
**Last Updated:** 2024-12-XX  
**Status:** Planning Phase
