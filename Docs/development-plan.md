# Development Plan - Supabase Database Backup System

## 📋 Overview

This document outlines the development plan for implementing the Supabase database backup system using GitHub Actions. The system will support automatic schema detection, per-table backups, multi-repo triggers, and centralized storage in this repository.

**Target Features:**
- Universal compatibility with any Supabase database account
- Automatic schema and table detection
- Per-table backup organization
- Multi-repo support with concurrency control
- Support for `main` and `dev` branches
- Timestamped archive backups with clear naming
- Centralized storage in this repository

---

## 🎯 Development Phases

### Phase 1: Core Backup Workflow (Foundation)
**Goal:** Implement basic backup functionality with automatic schema detection

**Tasks:**
1. ✅ Update workflow to support schema filtering
2. ✅ Implement automatic schema detection (query information_schema)
3. ✅ Implement automatic table detection per schema
4. ✅ Create per-table backup structure (schema.sql + data.sql per table)
5. ✅ Implement full database backup (include ALL Supabase schemas)
6. ✅ Test with sample Supabase database

**Deliverables:**
- Working workflow that detects and backs up all user schemas
- Per-table backup files organized by schema
- Roles backup file

**Estimated Time:** 2-3 days

---

### Phase 2: Storage Organization & Archive System
**Goal:** Implement latest + archive structure with timestamped folders

**Tasks:**
1. ✅ Automatically create `backups/latest/` directory structure (if not exists)
2. ✅ Automatically create `backups/archive/` directory structure (if not exists)
3. ✅ Implement timestamped folder naming: `{timestamp}--{repo}--{event}--{sha}/`
4. ✅ Implement archive creation logic (move latest to archive before new backup)
5. ✅ Create directory structure dynamically based on detected schemas/tables
6. ✅ Implement folder cleanup/retention policy (optional)
7. ✅ Test archive creation and naming

**Deliverables:**
- Directories created automatically during backup workflow
- Latest backup always in `backups/latest/`
- Historical backups in `backups/archive/` with proper naming
- Archive folder naming convention working correctly
- No manual directory setup required

**Estimated Time:** 1-2 days

---

### Phase 3: Multi-Repo Support & Concurrency Control
**Goal:** Enable multiple repos to trigger backups with proper concurrency handling

**Tasks:**
1. ✅ Add concurrency group configuration
2. ✅ Implement source repo detection (`github.repository`)
3. ✅ Implement trigger event detection (`github.event_name`)
4. ✅ Implement commit SHA capture (`github.sha`)
5. ✅ Update archive naming to include source repo info
6. ✅ Test concurrent triggers from multiple repos
7. ✅ Verify concurrency control prevents duplicates

**Deliverables:**
- Concurrency control working (only one backup at a time)
- Archive folders include source repo information
- Multiple repos can trigger backups without conflicts

**Estimated Time:** 1-2 days

---

### Phase 4: Branch Support & Trigger Configuration
**Goal:** Support both `main` and `dev` branches, configure all trigger types

**Tasks:**
1. ✅ Update workflow triggers to support `main` and `dev` branches
2. ✅ Implement scheduled backup trigger (cron)
3. ✅ Implement manual dispatch trigger
4. ✅ Implement push trigger for both branches
5. ✅ Add `BACKUP_ENABLED` toggle functionality
6. ✅ Test all trigger types

**Deliverables:**
- Workflow triggers on push to `main` or `dev`
- Scheduled backups working (when configured)
- Manual dispatch working
- Toggle functionality working

**Estimated Time:** 1 day

---

### Phase 5: Error Handling & Validation
**Goal:** Robust error handling and validation

**Tasks:**
1. ✅ Add connection string validation
2. ✅ Add schema detection error handling
3. ✅ Add backup failure handling
4. ✅ Add file write error handling
5. ✅ Add meaningful error messages
6. ✅ Implement retry logic for transient failures
7. ✅ Add workflow failure notifications (optional)

**Deliverables:**
- Graceful error handling throughout workflow
- Clear error messages in logs
- Workflow fails gracefully with helpful messages

**Estimated Time:** 1-2 days

---

### Phase 6: Testing & Validation
**Goal:** Comprehensive testing of all features

**Tasks:**
1. ✅ Test with different Supabase database structures
2. ✅ Test with databases having custom schemas
3. ✅ Test with databases having only public schema
4. ✅ Test concurrent triggers from multiple repos
5. ✅ Test all trigger types (push, manual, scheduled)
6. ✅ Test branch support (main and dev)
7. ✅ Test backup restoration process
8. ✅ Test archive creation and naming
9. ✅ Test error scenarios (invalid connection, missing permissions)
10. ✅ Performance testing with large databases

**Deliverables:**
- Test results document
- All test scenarios passing
- Known issues documented

**Estimated Time:** 2-3 days

---

### Phase 7: Documentation & Examples
**Goal:** Complete documentation and usage examples

**Tasks:**
1. ✅ Update README with implementation details
2. ✅ Create restoration guide
3. ✅ Create troubleshooting guide
4. ✅ Add workflow usage examples
5. ✅ Document all configuration options
6. ✅ Add inline code comments
7. ✅ Create example workflows for source repos

**Deliverables:**
- Complete documentation
- Usage examples
- Troubleshooting guide

**Estimated Time:** 1-2 days

---

## 📝 Implementation Details

### Workflow Structure

```yaml
name: supabase-backup

on:
  push:
    branches: [main, dev]
  workflow_dispatch:
  schedule:
    - cron: "0 0 * * *"  # Only in one repo

jobs:
  backup:
    runs-on: ubuntu-latest
    concurrency:
      group: shared-db-backup
      cancel-in-progress: false
    steps:
      - Check if backups enabled
      - Checkout repository
      - Setup Supabase CLI
      - Create directory structure automatically (backups/latest/, backups/archive/)
      - Detect schemas (SQL query)
      - For each schema:
        - Create schema directory structure automatically
        - Detect tables (SQL query)
        - For each table:
          - Create table directory automatically
          - Backup schema (structure)
          - Backup data
      - Backup roles
      - Create archive folder with timestamp
      - Move latest to archive
      - Commit backups
```

### Key Implementation Components

#### 1. Schema Detection Script
```bash
# Query to detect user schemas
SCHEMAS=$(psql "$DB_URL" -t -c "
  SELECT schema_name 
  FROM information_schema.schemata 
  WHERE schema_name NOT IN (
    'pg_catalog', 'information_schema', 'pg_toast',
    'auth', 'extensions', 'graphql', 'graphql_public',
    'realtime', 'storage', 'vault', 'pgbouncer'
  )
  AND schema_name NOT LIKE 'pg_temp%'
  AND schema_name NOT LIKE 'pg_toast_temp%';
")
```

#### 2. Table Detection Script
```bash
# Query to detect tables in a schema
TABLES=$(psql "$DB_URL" -t -c "
  SELECT table_name 
  FROM information_schema.tables 
  WHERE table_schema = '$SCHEMA'
  AND table_type = 'BASE TABLE'
  ORDER BY table_name;
")
```

#### 3. Per-Table Backup
```bash
# Backup table structure
supabase db dump --db-url "$DB_URL" \
  --schema "$SCHEMA" \
  --file "backups/latest/$SCHEMA/tables/$TABLE/schema.sql" \
  --data-only=false

# Backup table data
supabase db dump --db-url "$DB_URL" \
  --schema "$SCHEMA" \
  --file "backups/latest/$SCHEMA/tables/$TABLE/data.sql" \
  --data-only \
  --use-copy
```

#### 4. Directory Creation
```bash
# Create directory structure automatically
mkdir -p backups/latest
mkdir -p backups/archive

# Create schema directories as they are detected
mkdir -p "backups/latest/$SCHEMA/tables"
```

#### 5. Archive Naming
```bash
# Generate archive folder name
TIMESTAMP=$(date -u +"%Y-%m-%dT%H-%M-%SZ")
SOURCE_REPO=$(echo "${{ github.repository }}" | tr '/' '-')
TRIGGER_EVENT="${{ github.event_name }}"
SHORT_SHA=$(echo "${{ github.sha }}" | cut -c1-7)
ARCHIVE_NAME="${TIMESTAMP}--${SOURCE_REPO}--${TRIGGER_EVENT}--${SHORT_SHA}"

# Create archive directory
mkdir -p "backups/archive/$ARCHIVE_NAME"
```

---

## 🧪 Testing Strategy

### Unit Tests (Scripts)
- [ ] Schema detection query returns correct schemas
- [ ] Table detection query returns correct tables
- [ ] All Supabase schemas are included in backup (full backup)
- [ ] Archive naming format is correct
- [ ] Timestamp format is ISO 8601 compliant

### Integration Tests (Workflow)
- [ ] Workflow runs successfully with valid connection string
- [ ] All schemas are detected and backed up
- [ ] All tables are detected and backed up
- [ ] Per-table structure is created correctly
- [ ] Archive folder is created with correct name
- [ ] Latest backup is updated correctly

### Multi-Repo Tests
- [ ] Multiple repos can trigger backups
- [ ] Concurrency control prevents simultaneous backups
- [ ] Archive folders include correct source repo info
- [ ] No conflicts when multiple repos trigger

### Trigger Tests
- [ ] Push to main branch triggers backup
- [ ] Push to dev branch triggers backup
- [ ] Manual dispatch triggers backup
- [ ] Scheduled backup runs (when configured)
- [ ] BACKUP_ENABLED=false skips backup

### Error Handling Tests
- [ ] Invalid connection string fails gracefully
- [ ] Missing permissions fails gracefully
- [ ] Database connection timeout handled
- [ ] Empty database handled (no schemas/tables)
- [ ] Large database handled (performance)

### Restoration Tests
- [ ] Can restore from latest backup
- [ ] Can restore from archive backup
- [ ] Can restore individual tables
- [ ] Can restore entire schema
- [ ] Can restore all schemas

---

## 📅 Development Timeline

### Week 1: Foundation
- **Days 1-3:** Phase 1 - Core Backup Workflow
- **Days 4-5:** Phase 2 - Storage Organization

### Week 2: Multi-Repo & Features
- **Days 1-2:** Phase 3 - Multi-Repo Support
- **Day 3:** Phase 4 - Branch Support & Triggers
- **Days 4-5:** Phase 5 - Error Handling

### Week 3: Testing & Documentation
- **Days 1-3:** Phase 6 - Testing & Validation
- **Days 4-5:** Phase 7 - Documentation

**Total Estimated Time:** 2-3 weeks

---

## 🔧 Technical Requirements

### Dependencies
- Supabase CLI (latest version)
- PostgreSQL 17 client tools (must match database version)
- GitHub Actions
- Bash scripting
- Git
- Azure CLI (for standalone script using Azure Key Vault)

### Environment Variables
- `SUPABASE_DB_URL` - Database connection string (secret)
- `BACKUP_ENABLED` - Toggle backup on/off (variable)

### Permissions Required
- `contents: write` - To commit backups to repository
- Database read access - To query schemas and backup data

---

## ✅ Success Criteria

### Functional Requirements
- ✅ Automatically detects all user schemas
- ✅ Automatically detects all tables per schema
- ✅ Creates per-table backup files (schema.sql + data.sql)
- ✅ Includes ALL Supabase system schemas (full backup)
- ✅ Supports both main and dev branches
- ✅ Supports multiple trigger types
- ✅ Handles concurrent triggers with concurrency control
- ✅ Creates timestamped archive backups
- ✅ Stores backups in this repository

### Non-Functional Requirements
- ✅ Works with any Supabase database account
- ✅ Zero configuration needed (automatic detection)
- ✅ Graceful error handling
- ✅ Clear error messages
- ✅ Efficient resource usage
- ✅ Scalable to any database size

### Quality Requirements
- ✅ All tests passing
- ✅ Documentation complete
- ✅ Code is maintainable
- ✅ Follows best practices
- ✅ No hardcoded values

---

## 🚀 Deployment Steps

### 1. Initial Setup
1. Update workflow file with implementation
2. Directories (`backups/latest/` and `backups/archive/`) will be created automatically on first backup
3. Optionally add `.gitkeep` to `backups/` directory to maintain it in git (directories created automatically during backup)

### 2. Testing
1. Test with development Supabase database
2. Verify all features working
3. Test with multiple repos
4. Test all trigger types

### 3. Production Deployment
1. Add `SUPABASE_DB_URL` secret to source repositories
2. Add `BACKUP_ENABLED` variable (set to `true`)
3. Configure workflow in source repositories
4. Test manual trigger first
5. Enable scheduled backups (in one repo only)

### 4. Monitoring
1. Monitor first few backups
2. Verify archive creation
3. Check backup file sizes
4. Verify restoration process

---

## 📚 Additional Considerations

### Phase 8: Standalone Backup Script Improvements
**Goal:** Modernize and align the standalone backup script (`0_backup_supabase_lighthouse_db.sh`) with current codebase patterns

**Tasks:**
1. [ ] Update PostgreSQL version detection to match database version (PostgreSQL 17)
2. [ ] Ensure pg_dump version matches database version for compatibility
3. [ ] Implement dual backup structure: schema .dump files + per-table files
4. [ ] Create schema-level .dump files in each schema folder (with timestamp)
5. [ ] Integrate with existing backup.sh for per-table structure (maintain existing structure)
6. [ ] Add timestamp-based naming for schema .dump files
7. [ ] Add support for backing up ALL Supabase system schemas (auth, storage, realtime, vault, etc.) in both formats
8. [ ] Implement comprehensive backup summary section (showing both formats)
9. [ ] Align script with existing backup.sh and detect.sh patterns
10. [ ] Use common.sh utilities for consistency
11. [ ] Add proper error handling and validation
12. [ ] Test with actual Supabase database

**Deliverables:**
- Modernized backup script aligned with codebase patterns
- PostgreSQL 17 compatibility verified
- Dual backup structure: schema .dump files + per-table files
- Timestamp-based naming for schema .dump files
- Auth schema backup support (both formats)
- Comprehensive backup summary output (both formats)
- Integration with existing backup.sh for per-table structure
- Consistent code style and error handling

**Estimated Time:** 2-3 days

**Key Requirements:**
- **PostgreSQL Version Alignment**: Script must use PostgreSQL 17 client tools (matching workflow setup)
- **Dual Backup Structure**: Each schema folder contains:
  - Schema-level .dump file: `{schema}/{schema}_schema_{timestamp}.dump` (complete schema backup)
  - Per-table files: `{schema}/tables/{table-name}/schema.sql` and `data.sql` (existing structure)
- **Backup Completeness**: Ensure all schemas and tables are backed up in both formats (including auth schema)
- **Naming Convention**: Use timestamp-based naming for .dump files: `{schema}_schema_{YYYYMMDD_HHMMSS}.dump`
- **Integration**: Use existing backup.sh functions for per-table structure to maintain consistency
- **Backup Summary**: Include detailed summary with:
  - Backup timestamp
  - Environment (prod/dev)
  - Database size
  - Number of schemas backed up
  - For each schema: .dump file size and per-table files info
  - Total backup size (both formats)
  - Number of tables backed up
  - Duration
  - Status (success/failure)
- **Code Quality**: Follow existing patterns from backup.sh, detect.sh, and common.sh

### Future Enhancements (Post-MVP)
- [ ] Backup retention policy automation
- [ ] Backup verification (checksums)
- [ ] Notification on backup failure
- [ ] Backup size monitoring
- [ ] Automated restoration scripts
- [ ] Backup compression
- [ ] Git LFS for large backups
- [ ] Multi-database support (different connection strings)

### Maintenance
- Keep Supabase CLI updated
- Monitor GitHub Actions usage
- Review backup sizes periodically
- Clean up old archives if needed
- Update documentation as needed

---

## 🔍 Risk Mitigation

### Identified Risks
1. **Large database backups** - May exceed GitHub Actions timeout
   - Mitigation: Monitor backup times, consider compression
   
2. **Repository size growth** - Backups increase repo size
   - Mitigation: Implement retention policy, consider Git LFS
   
3. **Concurrent backup conflicts** - Multiple repos triggering
   - Mitigation: Concurrency control already implemented
   
4. **Connection string exposure** - Secrets in logs
   - Mitigation: Use GitHub Secrets, mask in logs
   
5. **Database schema changes** - New schemas/tables not detected
   - Mitigation: Automatic detection handles this

---

## 📝 Notes

- All implementation should follow the architecture defined in `system-plan.md`
- Code should be well-commented and maintainable
- Error messages should be clear and actionable
- Documentation should be updated as features are implemented
- Test thoroughly before production deployment
- **PostgreSQL Version**: All scripts must use PostgreSQL 17 client tools to match database version
- **Standalone Script**: The `0_backup_supabase_lighthouse_db.sh` script should be modernized to align with current codebase patterns

---

## 🔧 Standalone Backup Script Requirements

### Current State
The `0_backup_supabase_lighthouse_db.sh` script is a standalone utility that:
- Uses Azure Key Vault for connection strings
- Creates single full database backup in custom format
- Supports prod/dev/both environments
- Uses interactive prompts
- Does NOT create per-schema .dump files or integrate with per-table structure

### Target State
The improved script should:
1. **PostgreSQL Version Alignment**
   - Use PostgreSQL 17 client tools (via `get_pg_binary()` from common.sh)
   - Verify pg_dump version matches database version
   - Ensure compatibility with Supabase PostgreSQL 17 databases

2. **Dual Backup Structure**
   - For each schema, create BOTH:
     - Schema-level .dump file: `{schema}/{schema}_schema_{timestamp}.dump` (complete schema backup)
     - Per-table files: Use existing backup.sh to create `tables/{table-name}/schema.sql` and `data.sql`
   - Maintain existing per-table structure from workflow backups
   - Provide both fast full-schema restoration (.dump) and selective table restoration (per-table files)

3. **Backup Completeness**
   - Back up all user schemas (including auth schema)
   - Include ALL schemas (only exclude PostgreSQL internal: pg_catalog, information_schema, pg_toast, pg_temp*)
   - Include auth schema in both formats (.dump + per-table)
   - Use proper pg_dump flags to ensure complete backups

4. **Timestamp-Based Naming**
   - Format for .dump files: `{schema}_schema_{YYYYMMDD_HHMMSS}.dump`
   - Include timestamp in schema .dump file names
   - Per-table files use existing naming (no timestamp needed)

5. **Backup Summary Section**
   - Display comprehensive summary after backup completion:
     - Backup metadata (timestamp, environment, database name)
     - Database statistics (size, schema count, table count)
     - For each schema: .dump file size and per-table files summary
     - Total backup size (both formats combined)
     - Duration and status
     - Connection details (masked)

6. **Code Quality Improvements**
   - Use common.sh utilities (get_pg_binary, force_ipv4_connection, etc.)
   - Integrate with backup.sh for per-table structure
   - Use detect.sh for schema/table detection
   - Follow existing code patterns from backup.sh and detect.sh
   - Consistent error handling and logging
   - Proper function organization and naming
   - Clear separation of concerns

7. **Schema Backup Strategy**
   - Back up auth schema (Supabase authentication tables) in both formats
   - Include all user-created schemas in both formats
   - Properly handle schema-qualified table names
   - Use existing backup.sh::backup_schema() for per-table structure

---

**Document Version:** 1.1  
**Last Updated:** 2024-12-XX  
**Status:** Active Development - Phase 8 Added
