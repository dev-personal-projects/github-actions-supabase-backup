# Timestamp Backup Strategy

## 📋 Overview

This document defines the strategy for implementing timestamped backups to uniquely identify and differentiate between different backup runs. Every backup will have clear timestamp identification via archive folder names, enabling reliable restoration from any specific point in time.

**Current State:**
- `backups/latest/latest_{timestamp}/` - Timestamped latest backups stored inside `latest/` folder
- `backups/archive/` - Has timestamped folders with format: `{timestamp}--{source-repo}--{trigger-event}--{short-sha}/` (previous latest moved here)
- Per-table structure: `{schema}/tables/{table-name}/schema.sql` and `data.sql`
- Automatic archiving: Previous `latest_{timestamp}` automatically moved to archive when new backup starts

**Goal:**
- Every backup should have clear timestamp identification
- Unique way to differentiate different backups using timestamped folder names
- Integrated into GitHub Actions workflow (dual backup structure: schema .dump files + per-table files)
- Maintain backward compatibility where possible

---

## 🎯 Strategy: Single Timestamp Per Backup

### Approach

**Single Timestamp Per Backup (Atomic Backup Point)**
- One timestamp for the entire backup operation
- All schemas share the same backup timestamp
- Schemas are backed up in parallel as part of one atomic backup operation
- One timestamp represents the entire backup point

**Rationale:**
- ✅ Simple and consistent
- ✅ Easy to identify "the backup from X time"
- ✅ Matches current archive structure
- ✅ All schemas backed up together = atomic backup point
- ✅ Easier to restore entire database from a specific time
- ✅ Less complex file structure
- ✅ Aligns with the concept of a "backup" being a snapshot of the entire database at a point in time

### Backup Structure

```
backups/
├── latest/                                    # Latest backups container
│   └── latest_2024-01-15T14-30-45Z/          # Current timestamped latest
│       ├── roles.sql
│       ├── public/
│       │   └── tables/
│       │       ├── users/
│       │       │   ├── schema.sql
│       │       │   └── data.sql
│       │       └── orders/
│       └── auth/
│           └── tables/
└── archive/                                   # Historical backups (previous latest moved here)
    ├── 2024-01-15T14-30-45Z--myorg-repo--push--abc1234/  # Previous latest
    │   ├── roles.sql
    │   ├── public/
    │   │   └── tables/
    │   │       ├── users/
    │   │       │   ├── schema.sql
    │   │       │   └── data.sql
    │   │       └── orders/
    │   └── auth/
    │       └── tables/
    └── 2024-01-15T18-20-10Z--myorg-repo--schedule--def5678/
        ├── roles.sql
        ├── public/
        │   └── tables/
        └── auth/
            └── tables/
```

---

## 🔍 Timestamp Format Standards

### ISO 8601 Format (Primary)

**Format:** `YYYY-MM-DDTHH-MM-SSZ`

**Examples:**
- `2024-01-15T14-30-45Z` - January 15, 2024, 14:30:45 UTC
- `2024-12-31T23-59-59Z` - December 31, 2024, 23:59:59 UTC

**Why This Format:**
- ✅ ISO 8601 standard (widely recognized)
- ✅ Sortable (lexicographic order = chronological order)
- ✅ Human-readable
- ✅ Filesystem-safe (no colons, spaces, or special characters)
- ✅ UTC timezone (consistent across all backups)

**Implementation:**
```bash
TIMESTAMP=$(date -u +"%Y-%m-%dT%H-%M-%SZ")
```

**Important:** Generate timestamp at the **start** of backup operation to ensure accurate backup point identification.

---

## 🎯 Archive Naming Format

### Complete Format

**Format:** `{timestamp}--{source-repo}--{trigger-event}--{short-sha}/`

**Components:**
- `timestamp`: ISO 8601 format (UTC) - `YYYY-MM-DDTHH-MM-SSZ` - Generated at backup start
- `source-repo`: GitHub repository (e.g., `myorg/myapp`) or `standalone`
- `trigger-event`: `push`, `pr`, `schedule`, `manual`, `standalone`
- `short-sha`: First 7 characters of commit SHA or `standalone`

**Examples:**
```
2024-01-15T14-30-45Z--myorg/myapp--push--abc1234/
2024-01-15T18-20-10Z--myorg/myapp--schedule--def5678/
2024-01-16T00-00-00Z--myorg/myapp--manual--ghi9012/
2024-01-15T14-30-45Z--standalone--standalone--standalone/
```

### Uniqueness Guarantees

1. **Timestamp** - Precise to the second (very unlikely two backups at exact same second)
2. **Source Repo** - Different repos = different backups
3. **Trigger Event** - Different events = different backups
4. **Commit SHA** - Different commits = different backups

### Edge Cases Handling

1. **Same Second, Same Repo, Same Event, Same Commit:**
   - Very rare (would require manual trigger or rapid commits)
   - Solution: Timestamp precision to the second usually sufficient
   - If needed, can append sequence number: `{timestamp}--{repo}--{event}--{sha}--2/`

2. **Missing Information:**
   - All information is available from GitHub Actions context
   - No missing information scenarios in workflow

3. **Duplicate Prevention:**
   - Check if archive directory already exists
   - If exists, append sequence number: `{timestamp}--{repo}--{event}--{sha}--2/`

---

## 📊 Backup Identification Methods

### Method 1: By Timestamp (Primary)

**Use Case:** "I want the backup from January 15, 2024 at 14:30"

**Command Example:**
```bash
# Find backups from specific date
ls -d backups/archive/2024-01-15T*--*

# Find backup with exact timestamp
ls -d backups/archive/2024-01-15T14-30-45Z--*

# List all backups sorted by timestamp
ls -d backups/archive/*/ | sort
```

### Method 2: By Commit SHA (Traceability)

**Use Case:** "I want the backup from commit abc1234"

**Command Example:**
```bash
# Find backups from specific commit
ls -d backups/archive/*--*--*--abc1234*

# Find all backups for a specific commit
ls -d backups/archive/*--*--*--abc1234* | sort
```

### Method 3: By Source Repository (Multi-Repo)

**Use Case:** "I want backups triggered by myorg/myapp"

**Command Example:**
```bash
# Find backups from specific repo
ls -d backups/archive/*--myorg/myapp--*

# List all backups for a repo, sorted by timestamp
ls -d backups/archive/*--myorg/myapp--* | sort
```

### Method 4: By Trigger Event

**Use Case:** "I want all scheduled backups"

**Command Example:**
```bash
# Find scheduled backups
ls -d backups/archive/*--*--schedule--*

# List scheduled backups sorted by timestamp
ls -d backups/archive/*--*--schedule--* | sort
```

### Method 5: By Date Range

**Use Case:** "I want backups from the last 7 days"

**Command Example:**
```bash
# Find backups from last 7 days (using find with mtime)
find backups/archive -type d -mtime -7 -name "*--*"

# Or using timestamp in folder name (if within same month)
ls -d backups/archive/2024-01-{08..15}T*--* 2>/dev/null
```

---

## 🔄 Implementation Plan

### Phase 1: Timestamp Generation

**Goal:** Standardize timestamp generation and usage.

**Tasks:**
1. Generate timestamp at start of backup operation (not end)
2. Standardize timestamp format (ISO 8601 UTC)
3. Pass timestamp through all backup steps
4. Use timestamp in archive folder naming

**Implementation:**
```bash
# Generate timestamp at start
BACKUP_TIMESTAMP=$(date -u +"%Y-%m-%dT%H-%M-%SZ")

# Use in archive naming
ARCHIVE_NAME="${BACKUP_TIMESTAMP}--${GITHUB_REPOSITORY}--${GITHUB_EVENT_NAME}--${GITHUB_SHA:0:7}/"
```

---

### Phase 2: Archive Naming Enhancement

**Goal:** Ensure archive naming is comprehensive and unique.

**Current Format:** `{timestamp}--{source-repo}--{trigger-event}--{short-sha}/`

**Enhancements:**
1. Ensure timestamp is always in ISO 8601 format (UTC): `YYYY-MM-DDTHH-MM-SSZ`
2. Ensure all components are present (timestamp, repo, event, sha)
3. Add validation to prevent duplicate archive names
4. Handle edge cases (empty repo name, missing SHA, etc.)

**Example:**
```
2024-01-15T14-30-45Z--myorg/myapp--push--abc1234/
2024-01-15T18-20-10Z--myorg/myapp--schedule--def5678/
2024-01-16T00-00-00Z--myorg/myapp--manual--ghi9012/
```

---

### Phase 3: Dual Backup Structure Integration

**Goal:** Ensure workflow creates both schema-level .dump files and per-table files with timestamps.

**Tasks:**
1. Add `backup_schema_dump()` function to backup.sh
2. Update workflow to create schema .dump files before per-table backups
3. Use same timestamp format for both backup types

**Script Changes:**
```bash
# Generate timestamp at start
BACKUP_TIMESTAMP=$(date -u +"%Y-%m-%dT%H-%M-%SZ")

# Create archive with timestamp
ARCHIVE_NAME="${BACKUP_TIMESTAMP}--standalone--standalone--standalone/"
mkdir -p "backups/archive/$ARCHIVE_NAME"

# Perform backup into archive directory
# ... backup operations ...
```

---

### Phase 4: Workflow Integration

**Goal:** Integrate timestamp generation into GitHub Actions workflow.

**Enhancements:**
1. Generate timestamp at start of backup (not end)
2. Use timestamp in archive folder naming
3. Pass timestamp through workflow steps

**Workflow Steps:**
```yaml
- name: Generate backup timestamp
  run: |
    echo "BACKUP_TIMESTAMP=$(date -u +'%Y-%m-%dT%H-%M-%SZ')" >> $GITHUB_ENV

- name: Backup schemas and tables
  # Use ${{ env.BACKUP_TIMESTAMP }} in backup process

- name: Create archive
  run: |
    # Create archive with timestamped name
    ARCHIVE_NAME="${BACKUP_TIMESTAMP}--${GITHUB_REPOSITORY}--${GITHUB_EVENT_NAME}--${GITHUB_SHA:0:7}/"
    mkdir -p "backups/archive/$ARCHIVE_NAME"
    # Copy or move backup files to archive
```

---

## 📋 Implementation Checklist

### Phase 1: Timestamp Generation
- [ ] Standardize timestamp format (ISO 8601 UTC)
- [ ] Ensure timestamp is generated at backup start (not end)
- [ ] Test timestamp generation and parsing
- [ ] Validate timestamp format in archive folder names

### Phase 2: Archive Naming
- [ ] Ensure archive naming includes all components (timestamp, repo, event, sha)
- [ ] Add duplicate detection and handling
- [ ] Test archive naming with various scenarios (workflow, standalone, missing info)
- [ ] Update documentation with naming format

### Phase 3: Dual Backup Structure
- [x] Add `backup_schema_dump()` function to backup.sh
- [x] Update workflow to create schema .dump files
- [x] Test dual backup structure in workflow

### Phase 4: Workflow Integration
- [ ] Add timestamp generation step to workflow
- [ ] Test workflow with timestamp in archive naming
- [ ] Verify archive folder names are correct

### Phase 5: Documentation
- [ ] Update `system-plan.md` with timestamp strategy
- [ ] Update `README.md` with timestamp information
- [ ] Create restoration guide referencing timestamps
- [ ] Document archive folder naming format

---

## 🎯 Key Decisions

1. ✅ **Single timestamp per backup** (not per schema) - atomic backup point
2. ✅ **ISO 8601 timestamp format** (UTC) - `YYYY-MM-DDTHH-MM-SSZ`
3. ✅ **Timestamp in folder name** - clear identification without metadata files
4. ✅ **Generate timestamp at start** - before backup operations begin
5. ✅ **Simple archive naming** - `{timestamp}--{repo}--{event}--{sha}/` (no run-id)

**Rationale:**
- Schemas are backed up as part of one atomic operation
- One timestamp represents the entire backup point
- Timestamp visible in folder name - easy to identify backups
- Simple, clean, and maintainable
- Integrated into workflow with dual backup structure

---

## 📚 References

- Current backup structure: `Docs/system-plan.md`
- Development plan: `Docs/development-plan.md`
- Full backup policy: `Docs/full-backup-policy.md`
- Backup performance: `Docs/backup-performance-optimization.md`

---

**Document Status:** Implementation Guide  
**Last Updated:** 2024-01-15  
**Next Step:** Implementation Phase 1
