# Supabase Database Backup System - Comprehensive Plan

## 📋 Executive Summary

This document outlines the architecture, requirements, and implementation plan for an enhanced Supabase database backup system using GitHub Actions. The system is **universally compatible** - it works with **any Supabase database account** by simply providing your connection string. It automatically detects all schemas and tables, requiring zero configuration. The system supports **multiple repositories in an organization sharing a single Supabase database**, where any PR, commit, or scheduled event in any repository can trigger a backup of the shared database.

---

## 🎯 System Goals

1. **Automated Backups**: Create reliable, automated backups of a shared Supabase database
2. **Multi-Repo Triggers**: Allow any repository in an organization to trigger backups via commits, PRs, or scheduled events
3. **Schema Flexibility**: Backup ALL schemas including Supabase system schemas (full database backup)
4. **Concurrent Backup Handling**: Prevent duplicate backups when multiple repos trigger simultaneously
5. **Centralized Storage**: Store all backups in a dedicated backup repository with clear organization
6. **Flexible Triggers**: Configurable backup triggers (commits, PRs, scheduled, manual) from any source repo
7. **Secure Storage**: Store backups in version-controlled repositories with proper access controls
8. **Easy Restoration**: Provide clear restoration procedures

---

## 🏗️ Architecture Overview

### Current Architecture

```
┌─────────────────┐
│  Source Repo    │
│  (Any Repo)     │───┐
└─────────────────┘   │
                      │
┌─────────────────┐   │    ┌──────────────────┐
│  Backup Repo    │◄──┼────┤  GitHub Actions   │
│  (Dedicated)    │   │    │  Workflow         │
└─────────────────┘   │    └──────────────────┘
                      │              │
┌─────────────────┐   │              │
│  Supabase DB   │◄──┴──────────────┘
│  (PostgreSQL)  │
└─────────────────┘
```

### Proposed Architecture (Shared Database Model)

```
┌─────────────────────────────────────────────────────────────┐
│                    GitHub Organization                      │
│                                                              │
│  ┌──────────────┐                                           │
│  │ Source Repo 1│──┐                                        │
│  │ (App Repo)   │  │                                        │
│  └──────────────┘  │                                        │
│                    │                                        │
│  ┌──────────────┐  │    ┌──────────────────────────┐     │
│  │ Source Repo 2│──┼───►│   This Repository         │     │
│  │ (App Repo)   │  │    │   (db-backup-actions)    │     │
│  └──────────────┘  │    │                           │     │
│                    │    │   Structure:              │     │
│  ┌──────────────┐  │    │   /backups/               │     │
│  │ Source Repo N│──┘    │     ├── latest/           │     │
│  │ (App Repo)   │       │     │   ├── roles.sql     │     │
│  └──────────────┘       │     │   ├── public/      │     │
│                         │     │   └── custom/       │     │
│  All repos share        │     │     └── archive/     │     │
│  ONE database           │     │         └── timestamp--│     │
│                         │     │           repo--event--sha│     │
│                         │     └──────────────────────┘     │
│                         │              ▲                   │
│                         │              │                   │
│                         │    ┌─────────┴─────────┐        │
│                         │    │  GitHub Actions    │        │
│                         │    │  (Workflow)        │        │
│                         │    └─────────┬─────────┘        │
└─────────────────────────┼──────────────┼──────────────────┘
                          │              │
                          │              ▼
                    ┌─────┴──────────────────┐
                    │   SHARED Supabase DB   │
                    │   (Single Database)    │
                    │   (PostgreSQL)         │
                    └────────────────────────┘

Key Points:
- Multiple source repos (Repo 1, 2, N) all use the SAME database
- Any PR/commit/scheduled event in ANY repo can trigger backup
- Backups stored in THIS repository (db-backup-actions)
- Backup structure shows which repo triggered it with timestamp + prefixes
- All backups contain the same database content
```

---

## 📁 Backup Storage Strategy

### Storage Location: This Repository (db-backup-actions)

Backups are stored **directly in this repository** (`db-backup-actions`) in the `backups/` directory. This keeps everything in one place and makes it easy to manage.

**Repository Structure:**
```
db-backup-actions/
├── .github/
│   └── workflows/
│       └── backup.yaml              # Main backup workflow
├── backups/
│   ├── latest/                      # Latest backups container
│   │   └── latest_2024-01-15T14-30-45Z/          # Current timestamped latest
│   │       ├── roles.sql               # Database roles
│   │       ├── public/                 # Public schema
│   │       │   └── tables/             # Individual table backups
│   │       │       ├── users/
│   │       │       │   ├── schema.sql
│   │       │       │   └── data.sql
│   │       │       └── orders/
│   │       │           ├── schema.sql
│   │       │           └── data.sql
│   │       └── {custom-schema}/        # Custom schemas
│   │           └── tables/
│   │               └── {table-name}/
│   │                   ├── schema.sql
│   │                   └── data.sql
│   └── archive/                     # Historical backups (previous latest moved here)
│       ├── 2024-01-15T14-30-45Z--repo1--push--abc1234/  # Previous latest
│       │   ├── roles.sql
│       │   ├── public/
│       │   │   └── tables/
│       │   └── {custom-schema}/
│       └── 2024-01-15T12-30-00Z--repo2--pr--def5678/
├── Docs/
│   └── system-plan.md
└── README.md
```

### Backup Folder Naming Convention

Historical backups use a **prefix-based naming system** to distinguish different backups:

**Format:** `{timestamp}--{source-repo}--{trigger-event}--{short-sha}/`

**Components:**
- **Timestamp**: ISO 8601 format (UTC) - `2024-01-15T00-00-00Z`
- **Source Repo**: Repository that triggered the backup - `org/repo-name`
- **Trigger Event**: Event type - `push`, `pr`, `schedule`, `manual`
- **Short SHA**: First 7 characters of commit SHA - `abc1234`

**Examples:**
```
2024-01-15T00-00-00Z--myorg/myapp--push--abc1234/
2024-01-15T12-30-00Z--myorg/backend--pr--def5678/
2024-01-16T00-00-00Z--myorg/myapp--schedule--ghi9012/
2024-01-16T14-20-00Z--myorg/frontend--manual--jkl3456/
```

**Benefits:**
- ✅ **Clear identification**: Easy to see when, what, and why
- ✅ **Sortable**: Timestamp prefix makes chronological sorting natural
- ✅ **Traceable**: Source repo and commit SHA for full traceability
- ✅ **Unique**: Combination ensures no naming conflicts
- ✅ **Readable**: Human-readable format for easy browsing

### Storage Strategy Details

**Latest Backup:**
- Stored in `backups/latest/latest_{timestamp}/` (timestamped folder inside latest/)
- Automatically archived when new backup starts (moved to `backups/archive/`)
- Provides quick access to most recent backup
- Same per-table structure as archive backups
- Only one timestamped latest folder exists at a time (previous moved to archive)

**Archive Backups:**
- Stored in `backups/archive/`
- Never overwritten (historical record)
- Uses prefix naming convention
- Maintains full backup history with per-table organization

**Pros:**
- ✅ **Single repository**: Everything in one place
- ✅ **No cross-repo access needed**: Simpler setup
- ✅ **Version controlled**: Git history tracks all backups
- ✅ **Easy to browse**: Clear folder structure with per-table organization
- ✅ **Centralized management**: All backups in one location
- ✅ **Clear traceability**: Prefix shows source and trigger
- ✅ **Selective restoration**: Restore individual tables as needed
- ✅ **Better organization**: Each table in its own folder

**Cons:**
- ⚠️ **Repository size**: Will grow over time (consider cleanup policies)
- ⚠️ **Git history**: Large files in git history (consider Git LFS if needed)
- ⚠️ **More files**: Per-table structure creates more files (but better organization)

### Backup Retention Policy (Recommended)

To manage repository size, consider implementing:

1. **Keep latest**: Always keep `backups/latest/latest_{timestamp}/` (most recent timestamped latest)
2. **Archive retention**: Keep last N backups (e.g., 30 days, 100 backups)
3. **Cleanup workflow**: Periodic cleanup of old archive folders
4. **Git LFS**: For very large databases, consider Git LFS for backup files

---

## 🔐 Secrets Management

### Current Approach
- Secrets stored in each repository
- `SUPABASE_DB_URL` as repository secret

### Proposed Approach

#### For Shared Database Model:
- **Repository Secrets** (in each source repo that triggers backups):
  - `SUPABASE_DB_URL`: Connection string for the **shared** Supabase database
  - All repos use the **same** `SUPABASE_DB_URL` since they share one database

- **Repository Secrets** (in backup repository):
  - `GITHUB_TOKEN`: For committing backups (if using reusable workflow)
  - Or use `GITHUB_TOKEN` from source repo with proper permissions

#### Security Considerations:
- Since multiple repos share the same database connection string, ensure:
  - All repos that need to trigger backups have the same `SUPABASE_DB_URL` secret
  - Consider using organization-level secrets for shared resources
  - Use least-privilege database credentials

---

## ⚙️ Repository and Organization Configuration

### Configuration Strategy: No Hardcoding

The system is designed to work across different organizations without hardcoding repository or organization names.

#### Automatic Detection

**Organization Name:**
- ✅ Use `${{ github.repository_owner }}` - automatically detects the organization
- ✅ No hardcoding required - works for any GitHub organization
- ✅ Example: If repo is `myorg/myapp`, `github.repository_owner` = `myorg`

**Repository Names:**
- ✅ Use `${{ github.repository }}` - automatically detects the source repository
- ✅ Format: `{org}/{repo}` (e.g., `myorg/myapp`)

**Backup Repository:**
- ✅ Default: `${{ github.repository_owner }}/supabase-backups`
- ✅ Configurable via workflow input: `backup_repo`
- ✅ Can be overridden per organization if needed

### Configuration Options

#### Option 1: Default Configuration (Recommended)
```yaml
# Automatically uses: {org}/supabase-backups
uses: ${{ github.repository_owner }}/supabase-backups/.github/workflows/backup-reusable.yaml@main
with:
  backup_repo: ${{ github.repository_owner }}/supabase-backups  # Optional, defaults to this
```

#### Option 2: Custom Backup Repository
```yaml
# Use a custom backup repository name
uses: ${{ github.repository_owner }}/db-backups/.github/workflows/backup-reusable.yaml@main
with:
  backup_repo: ${{ github.repository_owner }}/db-backups  # Custom name
```

#### Option 3: Repository Variable (Organization-Level)
```yaml
# Use organization variable for flexibility
uses: ${{ vars.BACKUP_WORKFLOW_REPO }}/.github/workflows/backup-reusable.yaml@main
with:
  backup_repo: ${{ vars.BACKUP_REPO }}  # Set at organization level
```

### Benefits of Dynamic Configuration

1. **Reusable**: Same workflow template works for any organization
2. **No Maintenance**: No need to update workflows when organization changes
3. **Flexible**: Can be customized per organization if needed
4. **Scalable**: Easy to deploy across multiple organizations
5. **Type-Safe**: GitHub Actions validates the expressions at runtime

### Implementation in Reusable Workflow

```yaml
# .github/workflows/backup-reusable.yaml
on:
  workflow_call:
    inputs:
      backup_repo:
        required: false
        type: string
        default: ${{ github.repository }}  # Defaults to current repo (backup repo)
        description: Repository where backups are stored
      # ... other inputs
```

**Note**: The `backup_repo` input defaults to the repository where the reusable workflow is located, which is typically the backup repository itself.

#### Security Considerations:
- ✅ **Secrets should NOT be in this backup-action repository**
- ✅ Secrets should be stored in the repository that uses the workflow
- ✅ Use GitHub Secrets (encrypted at rest)
- ✅ Use least-privilege access tokens
- ✅ Consider using GitHub Environments for additional protection

---

## 🗂️ Schema Backup Strategy

### Universal Compatibility

**This system works with ANY Supabase database account.** Simply provide your Supabase connection string, and the system will automatically:

- ✅ **Detect ALL schemas** (public + custom schemas + ALL Supabase system schemas)
- ✅ **Detect all tables** within each schema
- ✅ **Backup EVERYTHING** - complete database backup with no exclusions
- ✅ **Include Supabase system schemas** (auth, storage, realtime, vault, extensions, etc.)

**No configuration needed** - the system performs a complete full backup of the entire database.

### How It Works

1. **Connection**: You provide your Supabase PostgreSQL connection string via `SUPABASE_DB_URL` secret
2. **Detection**: System queries the database to discover ALL schemas and tables
3. **Backup**: Creates per-table backups for ALL schemas and tables (complete database backup)

### Schemas Included in Backup (FULL BACKUP)

The system performs a **complete full backup** and includes:

- **`public` schema** - Primary application schema
  - All tables in the public schema are backed up individually
  - Number of tables varies by database (automatically detected)

- **Supabase System Schemas** - ALL included in backup:
  - `auth` - Authentication system (users, sessions, etc.)
  - `storage` - Storage system (files, buckets, etc.)
  - `realtime` - Realtime system
  - `vault` - Secrets management
  - `extensions` - PostgreSQL extensions metadata
  - `graphql` - GraphQL system
  - `graphql_public` - GraphQL public API
  - `pgbouncer` - Connection pooling metadata
  - `cron` - Scheduled jobs
  - `pg_cron` - PostgreSQL cron extension
  - `pgagent` - PostgreSQL agent
  - Any other Supabase-managed schemas

- **Custom schemas** - All user-created schemas
  - Any custom schemas you've created (e.g., `lh_billing`, `custom_app`, `analytics`, etc.)
  - All tables within custom schemas are backed up individually
  - System adapts to your database structure automatically

### Schemas Excluded (PostgreSQL System Only)

Only PostgreSQL internal system schemas are excluded (cannot be backed up):
- `pg_catalog` - PostgreSQL system catalog (internal)
- `information_schema` - PostgreSQL information schema (internal)
- `pg_toast` - PostgreSQL toast tables (internal)
- `pg_temp_*` - Temporary schemas (session-specific)
- `pg_toast_temp_*` - Temporary toast schemas (session-specific)

**Example:** If your database has:
- `public` schema with 20 tables
- `auth` schema with 15 tables
- `storage` schema with 8 tables
- `analytics` schema with 5 tables
- `billing` schema with 8 tables

The system will automatically detect and backup all 56 tables across 5 schemas (complete backup).

### Automatic Schema Detection Strategy

The system uses dynamic detection to work with any Supabase database:

1. **Query ALL available schemas (full backup):**
   ```sql
   SELECT schema_name 
   FROM information_schema.schemata 
   WHERE schema_name NOT IN (
     'pg_catalog', 'information_schema', 'pg_toast'
   )
   AND schema_name NOT LIKE 'pg_temp%'
   AND schema_name NOT LIKE 'pg_toast_temp%'
   ORDER BY schema_name;
   ```
   
   **Note**: Only PostgreSQL internal system schemas are excluded. ALL Supabase schemas (auth, storage, realtime, vault, extensions, etc.) are included.

2. **Query tables for each detected schema:**
   ```sql
   SELECT table_name 
   FROM information_schema.tables 
   WHERE table_schema = '{schema_name}'
   AND table_type = 'BASE TABLE'
   ORDER BY table_name;
   ```

3. **Backup each table individually:**
   - Create schema-specific folders: `{schema}/tables/`
   - Create table-specific folders: `{schema}/tables/{table_name}/`
   - Each table gets its own `schema.sql` (structure) and `data.sql` (data)
   - Works with any number of schemas and tables

**Key Features:**
- ✅ **Zero configuration** - Works with any Supabase database structure
- ✅ **Automatic detection** - Discovers ALL schemas and tables dynamically
- ✅ **Full backup** - Includes ALL Supabase system schemas (auth, storage, realtime, etc.)
- ✅ **Scalable** - Handles databases with any number of schemas/tables
- ✅ **Future-proof** - Automatically includes new schemas/tables when added
- ✅ **Complete coverage** - No Supabase schemas excluded

---

## ⚙️ Workflow Trigger Strategy

### Recommended Trigger Strategy (Shared Database)

Since multiple repos can trigger backups of the same database, we use concurrency control to handle concurrent triggers efficiently.

**Trigger Configuration - ANY of these from ANY repo can trigger backup:**

- ✅ **Scheduled backups** (daily/weekly) - from one designated repo only
  - Can be configured in any repo, but recommended to set in only one to avoid duplicates
  - When triggered, creates a backup of the shared database
  
- ✅ **Manual dispatch** (on-demand) - from any repo
  - Can be triggered from any repository that has the workflow configured
  - Useful for on-demand backups before deployments or changes
  
- ✅ **Push to main or dev branch** - from any repo (with concurrency control)
  - Any push to `main` or `dev` branch in any repository triggers backup
  - Works for both `main` and `dev` branches
  - Concurrency control ensures only one backup runs at a time

- ❌ **No PR backups** (too frequent, can cause noise)

**Key Points:**
- **Any repository** with the workflow can trigger backups using any of the above methods
- **Any branch** (`main` or `dev`) push can trigger a backup
- **Concurrency control** ensures only one backup runs at a time, even if multiple repos trigger simultaneously

**Concurrency Handling:**
- Use GitHub Actions `concurrency` groups to prevent simultaneous backups
- Only one backup runs at a time, others are queued
- Prevents duplicate backups when multiple repos trigger simultaneously

**Implementation:**
```yaml
concurrency:
  group: shared-db-backup
  cancel-in-progress: false  # Queue instead of cancel
```

**Benefits:**
- Prevents backup spam from multiple repos
- Reduces GitHub Actions usage
- More predictable backup schedule
- Handles concurrent triggers gracefully
- Efficient resource usage
- Flexible - any repo can trigger from any supported method

---

## 📝 Backup File Organization

### Storage Location: This Repository

All backups are stored in this repository (`db-backup-actions`) in the `backups/` directory.

### Folder Structure (Per-Table Organization)

Each table is backed up individually for better organization and easier restoration:

```
backups/
├── latest/                          # Latest backups container
│   ├── latest → latest_2024-01-15T14-30-45Z/  # Symlink to most recent
│   └── latest_2024-01-15T14-30-45Z/          # Current timestamped latest
│       ├── roles.sql                    # All roles (single file)
│       ├── public/                      # Public schema
│       │   └── tables/                  # Individual table backups
│       │       ├── users/
│       │       │   ├── schema.sql       # Table structure (CREATE TABLE, indexes, constraints)
│       │       │   └── data.sql         # Table data (INSERT statements)
│       │       ├── orders/
│       │       │   ├── schema.sql
│       │       │   └── data.sql
│       │       └── products/
│       │           ├── schema.sql
│       │           └── data.sql
│       ├── {custom-schema-1}/           # Custom schema 1
│       │   └── tables/
│       │       ├── table1/
│       │       │   ├── schema.sql
│       │       │   └── data.sql
│       │       └── table2/
│       │           ├── schema.sql
│       │           └── data.sql
│       └── {custom-schema-2}/            # Custom schema 2
│           └── tables/
│               └── ...
└── archive/                         # Historical backups (previous latest moved here)
    ├── 2024-01-15T14-30-45Z--org-repo1--push--abc1234/  # Previous latest
    │   ├── roles.sql
    │   ├── public/
    │   │   └── tables/
    │   │       ├── users/
    │   │       ├── orders/
    │   │       └── products/
    │   └── {custom-schema}/
    │       └── tables/
    ├── 2024-01-15T12-30-00Z--org/repo2--pr--def5678/
    └── 2024-01-16T00-00-00Z--org/repo1--schedule--ghi9012/
```

### Naming Convention for Archive Backups

**Format:** `{timestamp}--{source-repo}--{trigger-event}--{short-sha}/`

**Components Explained:**

1. **Timestamp** (`2024-01-15T00-00-00Z`)
   - ISO 8601 format in UTC
   - Format: `YYYY-MM-DDTHH-MM-SSZ`
   - Example: `2024-01-15T14-30-45Z`

2. **Source Repo** (`org/repo-name`)
   - Full repository name (org/repo)
   - Shows which repository triggered the backup
   - Example: `myorg/myapp`

3. **Trigger Event** (`push`, `pr`, `schedule`, `manual`)
   - Type of event that triggered the backup
   - Values: `push`, `pr`, `schedule`, `manual`
   - Example: `push`

4. **Short SHA** (`abc1234`)
   - First 7 characters of the commit SHA
   - Links backup to specific commit
   - Example: `abc1234`

**Complete Example:**
```
2024-01-15T14-30-45Z--myorg/myapp--push--abc1234/
```

This backup was:
- Created on: January 15, 2024 at 14:30:45 UTC
- Triggered by: `myorg/myapp` repository
- Event type: Push to branch
- Commit: `abc1234...`

### Per-Table Backup Structure

Each table within a schema is backed up individually:

**Table Folder Structure:**
```
{schema}/tables/{table-name}/
├── schema.sql    # Contains: CREATE TABLE, indexes, constraints, triggers
└── data.sql      # Contains: INSERT statements with table data
```

**Benefits of Per-Table Backups:**
- ✅ **Selective Restoration**: Restore individual tables without affecting others
- ✅ **Better Organization**: Clear structure for each table
- ✅ **Easier Maintenance**: Update or restore specific tables independently
- ✅ **Reduced Risk**: Smaller files reduce risk of corruption affecting entire schema
- ✅ **Parallel Processing**: Can restore multiple tables in parallel if needed
- ✅ **Clear Dependencies**: Easy to see table relationships and restore order

### Dual Backup Structure

**Note**: The backup workflow creates a **dual backup structure** that includes both:

1. **Schema-Level .dump Files** (for fast full schema restoration):
   - Location: `{schema}/{schema}_schema_{timestamp}.dump`
   - Format: PostgreSQL custom format (compressed)
   - Contains: Complete schema backup (all tables, indexes, constraints, etc.)
   - Created by: Workflow (using `backup_schema_dump()` function)

2. **Per-Table Files** (for selective table restoration):
   - Location: `{schema}/tables/{table-name}/schema.sql` and `data.sql`
   - Format: Plain SQL files
   - Contains: Individual table structure and data
   - Created by: Workflow (using `backup_schema()` function)

**Complete Structure (Workflow):**
```
backups/latest/
├── roles.sql
├── public/
│   ├── public_schema_20241215_143045.dump    # Full schema dump
│   └── tables/                                # Per-table backups
│       ├── users/
│       │   ├── schema.sql
│       │   └── data.sql
│       └── orders/
│           ├── schema.sql
│           └── data.sql
└── auth/
    ├── auth_schema_20241215_143045.dump     # Full auth schema dump
    └── tables/                                # Per-table backups
        └── ...
```

**Benefits of Dual Structure:**
- ✅ **Fast Full Schema Restoration**: Use .dump file for quick entire schema restore
- ✅ **Selective Table Restoration**: Use per-table files for granular restoration
- ✅ **Flexibility**: Choose restoration method based on need
- ✅ **Backup Completeness**: Both formats ensure complete backup coverage
- ✅ **Consistency**: Per-table structure matches workflow backups

### Benefits of This Structure

1. **Latest Always Available**: `backups/latest/latest_{timestamp}/` always has the most recent timestamped backup
2. **Full History**: `backups/archive/` maintains complete backup history
3. **Clear Identification**: Prefix shows when, what, and why
4. **Chronological Sorting**: Timestamp prefix enables natural sorting
5. **Traceability**: Source repo and commit SHA for full audit trail
6. **No Conflicts**: Unique naming prevents folder conflicts
7. **Human Readable**: Easy to browse and understand
8. **Per-Table Organization**: Individual table backups for selective restoration
9. **Better Maintainability**: Update or restore specific tables independently

---

## 🔄 Multi-Repo Support Architecture (Shared Database)

### Repository Structure Options

#### Option A: Reusable Workflow in Backup Repository (Recommended)

**Backup Repository Structure:**
```
{org}/supabase-backups/
├── .github/
│   └── workflows/
│       └── backup-reusable.yaml     # Reusable workflow
└── README.md
```

**Source Repository Usage (in each repo that shares the DB):**
```yaml
# In source repo .github/workflows/backup.yaml
name: Backup Shared Database

on:
  push:
    branches: [main, dev]
  pull_request:
    branches: [main, dev]
    types: [closed]  # Only on merge
  workflow_dispatch:
  schedule:
    - cron: "0 0 * * *"  # Only set in ONE repo to avoid duplicates

jobs:
  backup:
    uses: ${{ github.repository_owner }}/supabase-backups/.github/workflows/backup-reusable.yaml@main
    concurrency:
      group: shared-db-backup
      cancel-in-progress: false  # Queue instead of cancel
    secrets:
      SUPABASE_DB_URL: ${{ secrets.SUPABASE_DB_URL }}  # Same URL for all repos
    with:
      source_repo: ${{ github.repository }}
      source_ref: ${{ github.ref }}
      source_sha: ${{ github.sha }}
      trigger_event: ${{ github.event_name }}
      backup_repo: ${{ github.repository_owner }}/supabase-backups
```

#### Option B: Reusable Workflow in This Repository (Template Approach)

**This Repository Structure:**
```
{org}/db-backup-actions/  # This repo
├── .github/
│   └── workflows/
│       └── backup-reusable.yaml     # Reusable workflow template
└── README.md
```

**Source Repository Usage:**
```yaml
# In source repo .github/workflows/backup.yaml
name: Backup Shared Database

on:
  push:
    branches: [main, dev]
  pull_request:
    branches: [main, dev]
    types: [closed]
  workflow_dispatch:
  schedule:
    - cron: "0 0 * * *"  # Only set in ONE repo

jobs:
  backup:
    uses: ${{ github.repository_owner }}/db-backup-actions/.github/workflows/backup-reusable.yaml@main
    concurrency:
      group: shared-db-backup
      cancel-in-progress: false
    secrets:
      SUPABASE_DB_URL: ${{ secrets.SUPABASE_DB_URL }}
    with:
      source_repo: ${{ github.repository }}
      backup_repo: ${{ github.repository_owner }}/supabase-backups  # Configurable
      backup_repo_branch: main  # Configurable
```

### Configuration Strategy

**Key Configuration Points:**

1. **Organization Name**: Use `${{ github.repository_owner }}` to automatically detect the organization
   - ✅ **Recommended**: Automatically uses the organization of the triggering repo
   - ✅ **No hardcoding**: Works across different organizations
   - ✅ **Flexible**: Each organization can use the same workflow template

2. **Backup Repository Name**: Should be configurable via workflow input
   - Default: `${{ github.repository_owner }}/supabase-backups`
   - Can be overridden: `${{ inputs.backup_repo }}` or `${{ vars.BACKUP_REPO }}`
   - Allows customization per organization

3. **Reusable Workflow Location**: Two options
   - **Option A**: In backup repository (simpler, self-contained)
   - **Option B**: In this template repository (centralized, reusable across orgs)

**Recommended: Option A with `${{ github.repository_owner }}`**

**Reusable Workflow (in backup repo):**
```yaml
# .github/workflows/backup-reusable.yaml
name: Backup Shared Database

on:
  workflow_call:
    inputs:
      source_repo:
        required: true
        type: string
        description: Repository that triggered the backup
      source_ref:
        required: true
        type: string
        description: Git ref that triggered the backup
      source_sha:
        required: true
        type: string
        description: Commit SHA that triggered the backup
      trigger_event:
        required: true
        type: string
        description: Event that triggered the backup (push, pull_request, etc.)
      backup_repo:
        required: false
        type: string
        default: ${{ github.repository }}
        description: Repository where backups are stored (defaults to current repo)
    secrets:
      SUPABASE_DB_URL:
        required: true
        description: Supabase database connection string

jobs:
  backup:
    runs-on: ubuntu-latest
    permissions:
      contents: write
    env:
      BACKUP_REPO: ${{ inputs.backup_repo || github.repository }}
      SOURCE_REPO: ${{ inputs.source_repo }}
      TRIGGER_EVENT: ${{ inputs.trigger_event }}
    # ... backup steps ...
```

**Note**: The `backup_repo` input defaults to the current repository (where the reusable workflow is located), but can be overridden if needed.

**Pros:**
- Single source of truth for backup logic
- Easy to update all repos at once
- Centralized backup storage
- Consistent backup format
- Concurrency control prevents duplicate backups
- All repos use same workflow, same database

**Cons:**
- Requires reusable workflow setup
- Cross-repo permissions needed
- Need to coordinate scheduled backups (only one repo should schedule)

### Approach 2: Direct Workflow in Each Repo (Simpler)

**Each Source Repository:**
```yaml
# In each source repo .github/workflows/backup.yaml
name: Backup Shared Database

on:
  push:
    branches: [main, dev]
  pull_request:
    branches: [main, dev]
  workflow_dispatch:
  schedule:
    - cron: "0 0 * * *"  # Only in ONE repo

jobs:
  backup:
    runs-on: ubuntu-latest
    concurrency:
      group: shared-db-backup
      cancel-in-progress: false
    steps:
      - name: Checkout backup repo
        uses: actions/checkout@v3
        with:
          repository: org/supabase-backups
          token: ${{ secrets.GITHUB_TOKEN }}
          path: backup-repo
      # ... backup steps ...
```

**Pros:**
- Simpler setup (no reusable workflow)
- Each repo manages its own workflow
- Still uses concurrency control

**Cons:**
- Backup logic duplicated across repos
- Harder to update all repos at once
- Each repo needs access to backup repo

### Recommendation: **Option A - Reusable Workflow in Backup Repository**

**Key Implementation Notes:**
1. **Organization Detection**: Use `${{ github.repository_owner }}` - automatically detects organization
2. **Backup Repository**: Default to `${{ github.repository_owner }}/supabase-backups` (configurable)
3. **Concurrency Group**: All repos use same concurrency group (`shared-db-backup`)
4. **Scheduled Backups**: Only ONE repo should have scheduled trigger to avoid duplicates
5. **Same Database URL**: All repos use the same `SUPABASE_DB_URL` secret
6. **Traceability**: Archive folder includes source repo name for tracking
7. **No Hardcoding**: Organization and repository names are dynamic, making the workflow reusable across organizations

---

## 🧪 Test Scenarios

### Unit Test Scenarios

#### 1. Schema Detection
- ✅ **Test**: Detect public schema
- ✅ **Test**: Detect custom schemas
- ✅ **Test**: Include ALL Supabase system schemas (full backup)
- ✅ **Test**: Handle empty database (no custom schemas)
- ✅ **Test**: Handle database with multiple custom schemas

#### 2. Backup Execution
- ✅ **Test**: Backup public schema successfully
- ✅ **Test**: Backup custom schema successfully
- ✅ **Test**: Backup roles successfully
- ✅ **Test**: Handle missing schema gracefully
- ✅ **Test**: Handle database connection failure
- ✅ **Test**: Handle insufficient permissions

#### 3. File Organization
- ✅ **Test**: Create correct directory structure
- ✅ **Test**: Overwrite latest backup correctly
- ✅ **Test**: Archive old backups correctly
- ✅ **Test**: Handle special characters in schema names
- ✅ **Test**: Handle long schema/table names

### Integration Test Scenarios

#### 4. Workflow Triggers
- ✅ **Test**: Scheduled backup runs successfully
- ✅ **Test**: Manual dispatch works
- ✅ **Test**: Backup disabled via BACKUP_ENABLED=false
- ✅ **Test**: Backup skipped when BACKUP_ENABLED not set
- ✅ **Test**: Workflow fails gracefully on errors

#### 5. Multi-Repo Scenarios (Shared Database)
- ✅ **Test**: Backup from repo1 triggers backup of shared DB
- ✅ **Test**: Backup from repo2 triggers backup of shared DB (same DB)
- ✅ **Test**: Multiple repos trigger simultaneously (concurrency handling)
- ✅ **Test**: Concurrency group prevents duplicate backups
- ✅ **Test**: Queued backups execute after current backup completes
- ✅ **Test**: Handle missing source repo permissions
- ✅ **Test**: Scheduled backup from one repo doesn't conflict with manual from another

#### 6. Security Scenarios
- ✅ **Test**: Secrets not exposed in logs
- ✅ **Test**: Backup repo access control
- ✅ **Test**: Invalid DB URL handled securely
- ✅ **Test**: Expired credentials handled gracefully

### End-to-End Test Scenarios

#### 7. Backup and Restore
- ✅ **Test**: Full backup (roles + all schemas with per-table structure)
- ✅ **Test**: Restore from backup successfully (full database)
- ✅ **Test**: Restore specific table only
- ✅ **Test**: Restore specific schema only
- ✅ **Test**: Restore fails on invalid backup file
- ✅ **Test**: Restore with missing dependencies
- ✅ **Test**: Per-table backup structure is correct
- ✅ **Test**: Table schema and data files are valid SQL

#### 8. Edge Cases
- ✅ **Test**: Database with no tables
- ✅ **Test**: Database with very large tables
- ✅ **Test**: Database with special characters in data
- ✅ **Test**: Concurrent backup attempts
- ✅ **Test**: Backup during active database operations

#### 9. Performance Scenarios
- ✅ **Test**: Backup time for small database (< 1MB)
- ✅ **Test**: Backup time for medium database (100MB)
- ✅ **Test**: Backup time for large database (1GB+)
- ✅ **Test**: GitHub Actions timeout handling
- ✅ **Test**: Memory usage during backup

### Manual Test Checklist

#### Pre-Deployment
- [ ] Verify Supabase CLI version compatibility
- [ ] Test database connection
- [ ] Verify schema detection query
- [ ] Test backup file generation
- [ ] Verify file structure

#### Post-Deployment
- [ ] Run manual backup via workflow_dispatch
- [ ] Verify files created in correct location
- [ ] Verify backup files are valid SQL
- [ ] Test restore procedure
- [ ] Verify scheduled backup runs
- [ ] Check GitHub Actions logs for errors

---

## 📋 Implementation Checklist

### Phase 1: Core Enhancements
- [ ] Update workflow to support schema filtering
- [ ] Implement schema detection logic
- [ ] Add support for custom schemas
- [ ] Update backup file organization
- [ ] Add timestamping/archiving strategy
- [ ] Update documentation

### Phase 2: Multi-Repo Support
- [ ] Create reusable workflow
- [ ] Set up dedicated backup repository
- [ ] Configure cross-repo permissions
- [ ] Update source repo workflows
- [ ] Test multi-repo backup flow

### Phase 3: Advanced Features
- [ ] Add backup retention policy
- [ ] Add backup verification step
- [ ] Add notification on backup failure
- [ ] Add backup size monitoring
- [ ] Add restore automation script

### Phase 4: Testing & Documentation
- [ ] Complete all test scenarios
- [ ] Update README with new features
- [ ] Create restoration guide
- [ ] Create troubleshooting guide
- [ ] Add examples for common use cases

---

## 🔍 Technical Decisions

### Decision 1: Backup Frequency
**Decision**: Scheduled backups only (daily) + manual dispatch
**Rationale**: Prevents backup spam, reduces costs, predictable schedule

### Decision 2: Schema Backup Strategy
**Decision**: Backup ALL schemas including Supabase system schemas (full database backup)
**Rationale**: Complete database backup ensures nothing is lost, including Supabase-managed data (auth users, storage files metadata, realtime subscriptions, etc.)

### Decision 3: Storage Location
**Decision**: Dedicated backup repository
**Rationale**: Centralized management, better for organizations, single source of truth for shared database backups

### Decision 6: Concurrency Control
**Decision**: Use GitHub Actions concurrency groups to prevent simultaneous backups
**Rationale**: Multiple repos can trigger backups of the same database; concurrency control ensures only one backup runs at a time, preventing duplicate work and potential conflicts

### Decision 4: File Organization
**Decision**: Latest + Archive structure
**Rationale**: Easy access to latest, maintains history

### Decision 5: Secrets Management
**Decision**: Same `SUPABASE_DB_URL` secret in all source repos (since they share one database)
**Rationale**: All repos access the same shared database, so they use the same connection string. Consider organization-level secrets for shared resources.

---

## 📚 References

- [Supabase CLI Documentation](https://supabase.com/docs/reference/cli)
- [GitHub Actions Reusable Workflows](https://docs.github.com/en/actions/using-workflows/reusing-workflows)
- [PostgreSQL pg_dump Documentation](https://www.postgresql.org/docs/current/app-pgdump.html)
- [GitHub Secrets Documentation](https://docs.github.com/en/actions/security-guides/encrypted-secrets)

---

## 🚀 Next Steps

1. Review and approve this plan
2. Set up dedicated backup repository (`supabase-backups`)
3. Create reusable workflow in backup repository
4. Add backup workflow to each source repository that shares the database
5. Configure concurrency groups to prevent duplicate backups
6. Set scheduled backup in ONE designated repo only
7. Implement Phase 1 enhancements (schema filtering, etc.)
8. Test with development database
9. Deploy to production
10. Monitor and iterate

## 📌 Important Notes for Shared Database Model

1. **Single Database, Multiple Repos**: All source repos share the same Supabase database
2. **Concurrency Control**: Critical to prevent multiple simultaneous backups
3. **Scheduled Backups**: Only configure in ONE repo to avoid duplicate scheduled backups
4. **Same Secrets**: All repos use the same `SUPABASE_DB_URL` since they share the database
5. **Traceability**: Backup archive includes source repo name to track which repo triggered each backup
6. **Backup Content**: All backups contain the same database content regardless of triggering repo

---

**Document Version**: 1.0  
**Last Updated**: 2024-01-XX  
**Author**: System Planning Team
