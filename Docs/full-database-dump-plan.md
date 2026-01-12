# Full Database Dump Implementation Plan

## 📋 Overview

This document outlines the plan for implementing a full database `.dump` file at the root of each backup directory. This will provide a single, complete backup of the entire database (all schemas, all tables, all data) in PostgreSQL custom format, in addition to the existing per-schema and per-table backup structure.

## 🎯 Goals

1. **Complete Database Backup**: Create a single `.dump` file containing the entire database
2. **Root-Level Placement**: Store the dump file at the root of each backup directory (alongside `roles.sql`)
3. **PostgreSQL Custom Format**: Use `pg_dump` custom format (`.dump`) for compression and efficiency
4. **Complement Existing Structure**: Add this as a third backup method alongside:
   - Schema-level `.dump` files (per schema)
   - Per-table SQL files (schema.sql + data.sql)
5. **Fast Full Restoration**: Enable quick restoration of entire database from a single file

## 📁 Proposed Backup Structure

### Current Structure
```
backups/
├── latest/
│   └── latest_2026-01-12T08-33-27Z/
│       ├── roles.sql
│       ├── public/
│       │   ├── public_schema_2026-01-12T08-33-27Z.dump
│       │   └── tables/
│       │       ├── users/
│       │       │   ├── schema.sql
│       │       │   └── data.sql
│       │       └── orders/
│       │           ├── schema.sql
│       │           └── data.sql
│       └── lh_billing/
│           ├── lh_billing_schema_2026-01-12T08-33-27Z.dump
│           └── tables/
│               └── invoices/
│                   ├── schema.sql
│                   └── data.sql
└── archive/
    └── 2026-01-12T08-10-19Z--repo--push--abc1234/
        └── [same structure]
```

### Proposed Structure (After Implementation)
```
backups/
├── latest/
│   └── latest_2026-01-12T08-33-27Z/
│       ├── database_full_2026-01-12T08-33-27Z.dump  ← NEW: Full database dump
│       ├── roles.sql
│       ├── public/
│       │   ├── public_schema_2026-01-12T08-33-27Z.dump
│       │   └── tables/
│       │       └── [per-table files]
│       └── [other schemas...]
└── archive/
    └── 2026-01-12T08-10-19Z--repo--push--abc1234/
        ├── database_full_2026-01-12T08-10-19Z.dump  ← NEW: Full database dump
        └── [same structure]
```

## 🔧 Technical Specifications

### File Naming Convention
- **Format**: `database_full_{timestamp}.dump`
- **Example**: `database_full_2026-01-12T08-33-27Z.dump`
- **Location**: Root of backup directory (same level as `roles.sql`)
- **Timestamp**: Uses same ISO 8601 UTC format as other backups (`YYYY-MM-DDTHH-MM-SSZ`)

### PostgreSQL Dump Command
```bash
pg_dump "$DB_URL" \
  --format=custom \
  --file="database_full_${TIMESTAMP}.dump" \
  --no-owner \
  --no-privileges \
  --blobs \
  --verbose
```

### Key Flags Explanation
- `--format=custom`: PostgreSQL custom format (compressed, binary)
- `--no-owner`: Don't include ownership commands (prevents permission issues)
- `--no-privileges`: Don't include privilege commands (prevents permission issues)
- `--blobs`: Include large objects (BLOBs)
- `--verbose`: Provide progress output

### What's Included in Full Dump
- ✅ **All schemas** (public, auth, storage, custom schemas, etc.)
- ✅ **All tables** (structure and data)
- ✅ **All indexes** (primary keys, foreign keys, unique constraints, etc.)
- ✅ **All sequences** (auto-increment sequences)
- ✅ **All functions** (stored procedures, functions)
- ✅ **All triggers** (database triggers)
- ✅ **All views** (database views)
- ✅ **All types** (custom types, enums)
- ✅ **All extensions** (PostgreSQL extensions metadata)
- ✅ **Large objects** (BLOBs)
- ❌ **Roles** (handled separately via `roles.sql` - already backed up)
- ❌ **Database-level settings** (handled by Supabase)

### What's Excluded
- **Roles**: Already backed up separately in `roles.sql` (using `pg_dumpall --roles-only`)
- **System schemas**: `pg_catalog`, `information_schema`, `pg_toast` (PostgreSQL internal, cannot be dumped)
- **Database-level configuration**: Handled by Supabase platform

## 📊 Backup Strategy: Three-Tier Approach

### Tier 1: Full Database Dump (NEW)
- **Purpose**: Complete database restoration from single file
- **Format**: PostgreSQL custom format (`.dump`)
- **Location**: Root of backup directory
- **Use Case**: 
  - Disaster recovery
  - Complete database migration
  - Full database restoration to new environment
  - Quick backup verification

### Tier 2: Schema-Level Dumps (EXISTING)
- **Purpose**: Fast schema-level restoration
- **Format**: PostgreSQL custom format (`.dump`)
- **Location**: `{schema}/{schema}_schema_{timestamp}.dump`
- **Use Case**:
  - Restore entire schema quickly
  - Schema-level migrations
  - Selective schema restoration

### Tier 3: Per-Table Files (EXISTING)
- **Purpose**: Granular table-level restoration
- **Format**: Plain SQL files
- **Location**: `{schema}/tables/{table-name}/schema.sql` and `data.sql`
- **Use Case**:
  - Restore individual tables
  - Selective data restoration
  - Human-readable SQL review
  - Version control friendly

## 🚀 Implementation Plan

### Phase 1: Function Development
1. **Create `backup_full_database()` function** in `.github/scripts/backup.sh`
   - Parameters: `DB_URL`, `TIMESTAMP`, `OUTPUT_DIR`
   - Uses `pg_dump` with custom format
   - Handles connection slot acquisition (for concurrency control)
   - Implements retry logic for connection limit errors
   - Error handling and cleanup

### Phase 2: Workflow Integration
1. **Add full database backup step** in `.github/workflows/backup.yaml`
   - Execute after roles backup, before schema backups
   - Use same timestamp as other backups
   - Run in parallel with schema dumps (if desired) or sequentially
   - Include in error handling and summary reporting

### Phase 3: Connection Management
1. **Connection slot handling**
   - Full database dump requires single connection
   - Coordinate with existing connection semaphore system
   - Ensure no conflicts with parallel schema/table backups

### Phase 4: Summary Reporting
1. **Update `print_backup_summary()` function**
   - Include full database dump file size
   - Show full database dump in summary output
   - Display file location and timestamp

## ⚙️ Implementation Details

### Function Signature
```bash
backup_full_database() {
  local DB_URL="${1:-}"
  local TIMESTAMP="${2:-}"
  local OUTPUT_DIR="${3:-}"
  
  # Returns: 0 on success, 1 on failure
}
```

### Execution Order in Workflow
1. Generate backup timestamp
2. Create backup directory structure
3. **Backup roles** (`roles.sql`)
4. **Backup full database** (`database_full_{timestamp}.dump`) ← NEW
5. Backup schemas (schema-level dumps + per-table files) in parallel

### Error Handling
- **Connection failures**: Retry with exponential backoff (3 attempts)
- **Connection limit errors**: Wait and retry
- **Disk space issues**: Fail gracefully with clear error message
- **Partial dumps**: Clean up incomplete files on failure

### Performance Considerations
- **File size**: Full database dump will be largest file (compressed, but still significant)
- **Execution time**: May take longer than schema dumps (depends on database size)
- **Connection usage**: Uses one connection slot (coordinate with semaphore)
- **Parallel execution**: Can run in parallel with schema dumps (different connections)

## 📝 File Size Estimation

### Typical Sizes (Approximate)
- **Full database dump**: Largest file (compressed custom format)
  - Example: 100MB database → ~20-30MB dump file (compressed)
- **Schema-level dumps**: Medium size (one per schema)
  - Example: 10 schemas × 2-5MB each = 20-50MB total
- **Per-table files**: Smallest individual files, but many files
  - Example: 100 tables × 50KB average = 5MB total

### Storage Impact
- **Additional storage**: One full database dump per backup
- **Compression**: Custom format is compressed, reducing size
- **Trade-off**: Storage cost vs. restoration speed

## 🔄 Restoration Workflow

### Full Database Restoration (Using New Dump)
```bash
# Restore entire database from full dump
pg_restore \
  --dbname="$TARGET_DB_URL" \
  --clean \
  --if-exists \
  --verbose \
  database_full_2026-01-12T08-33-27Z.dump

# Then restore roles separately
psql "$TARGET_DB_URL" < roles.sql
```

### Selective Restoration Options
1. **Full database**: Use `database_full_{timestamp}.dump`
2. **Single schema**: Use `{schema}/{schema}_schema_{timestamp}.dump`
3. **Single table**: Use `{schema}/tables/{table}/schema.sql` and `data.sql`

## ✅ Benefits

1. **Complete Backup**: Single file contains entire database
2. **Fast Restoration**: Restore entire database quickly from one file
3. **Disaster Recovery**: Ideal for complete database recovery scenarios
4. **Migration Support**: Easy to migrate entire database to new environment
5. **Backup Verification**: Single file to verify backup completeness
6. **Flexibility**: Three-tier approach provides multiple restoration options

## ⚠️ Considerations

1. **File Size**: Full database dump will be largest file in backup
2. **Execution Time**: May take longer than other backup operations
3. **Connection Usage**: Requires dedicated database connection
4. **Storage Cost**: Additional storage per backup (compressed, but still significant)
5. **Redundancy**: Some redundancy with schema-level dumps (acceptable trade-off)

## 🔍 Testing Strategy

### Unit Testing
- Test `backup_full_database()` function with mock database
- Verify file creation and format
- Test error handling scenarios

### Integration Testing
- Test full workflow with real database
- Verify dump file can be restored
- Test parallel execution with schema backups
- Verify connection slot management

### Validation Testing
- Restore full database dump to test database
- Verify data integrity
- Compare restored database with original
- Test restoration with different PostgreSQL versions

## 📚 Documentation Updates

### Files to Update
1. **README.md**: Add full database dump to backup structure documentation
2. **Docs/system-plan.md**: Update backup strategy section
3. **Docs/timestamp-backup-strategy.md**: Include full database dump in structure
4. **Restoration Guide**: Add full database restoration instructions

### Documentation Sections
- Backup structure diagram (include full database dump)
- Restoration procedures (full database restoration)
- File naming conventions
- Storage requirements

## 🎯 Success Criteria

1. ✅ Full database dump file created at root of each backup
2. ✅ File uses correct naming convention (`database_full_{timestamp}.dump`)
3. ✅ Dump file is valid PostgreSQL custom format
4. ✅ Dump file can be restored successfully
5. ✅ Works in parallel with existing backup operations
6. ✅ Included in backup summary report
7. ✅ Error handling works correctly
8. ✅ Documentation updated

## 📅 Implementation Timeline

### Estimated Time: 2-3 hours

1. **Function Development** (30-45 minutes)
   - Write `backup_full_database()` function
   - Add error handling and retry logic
   - Test function independently

2. **Workflow Integration** (30-45 minutes)
   - Add step to workflow
   - Integrate with connection management
   - Test in workflow context

3. **Summary Reporting** (15-30 minutes)
   - Update `print_backup_summary()` function
   - Test summary output

4. **Testing & Validation** (30-45 minutes)
   - Test full workflow
   - Verify dump file restoration
   - Test error scenarios

5. **Documentation** (15-30 minutes)
   - Update README and Docs
   - Add restoration instructions

## 🔗 Related Files

- `.github/scripts/backup.sh`: Function implementation
- `.github/workflows/backup.yaml`: Workflow integration
- `Docs/system-plan.md`: System architecture
- `Docs/timestamp-backup-strategy.md`: Backup structure
- `README.md`: User-facing documentation

## 📌 Notes

- Full database dump complements existing backup structure (does not replace)
- Three-tier approach provides maximum flexibility
- Custom format provides compression and efficiency
- Roles are handled separately (already backed up in `roles.sql`)
- System schemas are excluded (PostgreSQL internal, cannot be dumped)
