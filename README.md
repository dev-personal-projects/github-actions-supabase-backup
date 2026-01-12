# Supabase Database Backup with GitHub Actions

This repository provides a seamless way to automate backups of **any Supabase database** using GitHub Actions. Simply provide your Supabase connection string, and the system automatically detects and backs up all your schemas and tables. It supports **multiple repositories in an organization sharing a single Supabase database**, where any PR, commit, or scheduled event in any repository can trigger a backup of the shared database.

---

## Features

- **Multi-Repo Support:** Multiple repositories can trigger backups of a shared Supabase database
- **Flexible Triggers:** Backups can be triggered by commits, PRs, scheduled events, or manual dispatch from any repository
- **Concurrency Control:** Prevents duplicate backups when multiple repos trigger simultaneously
- **Automatic Daily Backups:** Scheduled backups run daily at a configurable time in UTC (configure in one repo only)
- **Automatic Schema Detection:** Works with any Supabase database - automatically detects all schemas and tables
- **Per-Table Backups:** Each table is backed up individually for selective restoration
- **Full Database Backup:** Backs up ALL schemas including Supabase system schemas (auth, storage, realtime, etc.)
- **Universal Compatibility:** Works with any Supabase account - just provide your connection string
- **Flexible Workflow Control:** Enable or disable backups with a simple environment variable
- **Centralized Storage:** All backups stored in a dedicated backup repository
- **Easy Database Restoration:** Clear steps to restore your database from backups

---

## Getting Started

### Architecture Overview

This system is designed for organizations where **multiple repositories share a single Supabase database**. Any repository can trigger a backup, but all backups contain the same database content.

```
┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│  Repo 1     │     │  Repo 2     │     │  Repo N     │
│  (App)      │     │  (App)      │     │  (App)      │
└──────┬──────┘     └──────┬──────┘     └──────┬──────┘
       │                   │                   │
       └───────────────────┼───────────────────┘
                           │
                           ▼
              ┌────────────────────┐
              │  Shared Supabase DB │
              └──────────┬─────────┘
                         │
                         ▼
              ┌────────────────────┐
              │  This Repository   │
              │ (db-backup-actions)│
              │   /backups/         │
              └────────────────────┘
```

### 1. **Setup Repository Variables**

#### In Each Source Repository (that shares the database):

Go to your repository settings and navigate to **Actions > Secrets and variables > Secrets**. Add:

- **Secrets:**
  - `SUPABASE_DB_URL`: Your Supabase PostgreSQL connection string.  
    Format: `postgresql://<USER>:<PASSWORD>@<HOST>:5432/postgres`
    - Get this from your Supabase project settings: **Settings > Database > Connection string**
    - Use the "Connection pooling" or "Direct connection" string
    - ⚠️ **Note**: All repos that share the database use the **same** `SUPABASE_DB_URL`
    - ✅ **Works with any Supabase account** - just provide your connection string

- **Variables:**
  - `BACKUP_ENABLED`: Set to `true` to enable backups or `false` to disable them.

#### In Backup Repository (if using reusable workflow):

- **Secrets:**
  - `GITHUB_TOKEN`: For committing backups (or use default `GITHUB_TOKEN` with proper permissions)

---

### 2. **How the Workflow Works**

#### Workflow Triggers

The GitHub Actions workflow can be triggered from **any repository** that shares the database using **any of these methods**:

- ✅ **Scheduled backups** (daily/weekly) - runs on both dev and main branches
  - Uses `scheduled-backup-trigger.yaml` to trigger backups on both branches
  - Configured to run daily at 08:16 UTC (configurable in the trigger workflow)
  - Note: GitHub Actions scheduled workflows only run on the default branch by default, so we use a trigger workflow to run on both branches
  
- ✅ **Manual dispatch** (on-demand) - from any repo
  - Trigger from GitHub Actions UI in any repository with the workflow
  
- ✅ **Push to main or dev branch** - from any repo
  - Any push to `main` or `dev` branch in any repository triggers backup
  - Both `main` and `dev` branches are supported

**Important:** ANY of these triggers from ANY repo will run the backup workflow. The system uses concurrency control to ensure only one backup runs at a time, even if multiple repos trigger simultaneously.

#### Concurrency Control

The workflow uses GitHub Actions concurrency groups to ensure only **one backup runs at a time**, even when multiple repos trigger simultaneously. This prevents duplicate backups and ensures efficient resource usage.

#### Backup Process

The workflow performs the following steps:

1. **Checks if backups are enabled** using the `BACKUP_ENABLED` variable.
2. **Connects to your Supabase database** using the provided `SUPABASE_DB_URL` connection string.
3. **Automatically detects all schemas** (public + any custom schemas, excluding Supabase system schemas).
4. **Automatically detects all tables** within each detected schema.
5. **Creates backup files**:
   - `database_full_{timestamp}.dump`: Complete database dump in PostgreSQL custom format (all schemas, tables, data).
   - `roles.sql`: Contains all database roles and permissions.
   - `{schema}/{schema}_schema_{timestamp}.dump`: Schema-level dump files (one per schema).
   - `{schema}/tables/{table-name}/schema.sql`: Table structure for each table.
   - `{schema}/tables/{table-name}/data.sql`: Table data for each table.
6. **Stores backups** in this repository:
   - Latest backup in `backups/latest/`
   - Historical backups in `backups/archive/{timestamp}--{source-repo}--{event}--{sha}/`
7. **Commits the backups** to this repository.

**Key Point:** The system automatically adapts to your database structure - no need to configure which schemas or tables to backup!

#### Backup Storage Structure

Backups are stored **in this repository** in the `backups/` directory. Each table is backed up individually for better organization:

```
backups/
├── latest/                      # Latest backups container
│   └── latest_2026-01-11T20-07-50Z/           # Current timestamped latest
│       ├── database_full_2026-01-11T20-07-50Z.dump  # Full database dump (all schemas)
│       ├── roles.sql               # All database roles
│       ├── public/                 # Public schema
│       │   ├── public_schema_2026-01-11T20-07-50Z.dump  # Schema-level dump
│       │   └── tables/             # Individual table backups
│       │       ├── users/
│       │       │   ├── schema.sql  # Table structure
│       │       │   └── data.sql    # Table data
│       │       ├── orders/
│       │       │   ├── schema.sql
│       │       │   └── data.sql
│       │       └── products/
│       │           ├── schema.sql
│       │           └── data.sql
│       └── {custom-schema}/         # Custom schemas
│           ├── {schema}_schema_2026-01-11T20-07-50Z.dump  # Schema-level dump
│           └── tables/
│               └── {table-name}/
│                   ├── schema.sql
│                   └── data.sql
└── archive/                     # Historical backups (previous latest moved here)
    ├── 2026-01-11T20-00-43Z--org-repo1--push--abc1234/  # Previous latest
    │   ├── database_full_2026-01-11T20-00-43Z.dump  # Full database dump
    │   ├── roles.sql
    │   ├── public/
    │   │   ├── public_schema_2026-01-11T20-00-43Z.dump
    │   │   └── tables/
    │   │       ├── users/
    │   │       ├── orders/
    │   │       └── products/
    │   └── {custom-schema}/
    │       └── tables/
    ├── 2024-01-15T12-30-00Z--org-repo2--pr--def5678/
    └── 2024-01-16T00-00-00Z--org-repo1--schedule--ghi9012/
```

**Per-Table Organization Benefits:**
- ✅ **Selective Restoration**: Restore individual tables without affecting others
- ✅ **Better Organization**: Clear structure for each table
- ✅ **Easier Maintenance**: Update or restore specific tables independently
- ✅ **Reduced Risk**: Smaller files reduce risk of corruption
- ✅ **Clear Dependencies**: Easy to see table relationships

#### Backup Naming Convention

Archive backups use a **prefix-based naming system** to distinguish different backups:

**Format:** `{timestamp}--{source-repo}--{trigger-event}--{short-sha}/`

**Example:** `2024-01-15T14-30-45Z--myorg/myapp--push--abc1234/`

**Components:**
- **Timestamp**: ISO 8601 format (UTC) - `2024-01-15T14-30-45Z`
- **Source Repo**: Repository that triggered backup - `myorg/myapp`
- **Trigger Event**: Event type - `push`, `pr`, `schedule`, `manual`
- **Short SHA**: First 7 characters of commit SHA - `abc1234`

This naming convention provides:
- ✅ **Clear identification**: See when, what, and why at a glance
- ✅ **Chronological sorting**: Timestamp prefix enables natural sorting
- ✅ **Full traceability**: Source repo and commit SHA for audit trail
- ✅ **Unique naming**: No folder conflicts
- ✅ **Human readable**: Easy to browse and understand

---

### 3. **Restoring Your Database**

To restore your database from a backup:

### Option 1: Full Database Restoration (Fastest)

Restore the entire database from the full database dump:

```bash
# Find the latest backup
LATEST_BACKUP=$(find backups/latest -maxdepth 1 -type d -name "latest_*" | sort -r | head -1)

# Restore full database from dump file
pg_restore \
  --db-url "<SUPABASE_DB_URL>" \
  --clean \
  --if-exists \
  --verbose \
  "$LATEST_BACKUP/database_full_*.dump"

# Restore roles separately
supabase db execute --db-url "<SUPABASE_DB_URL>" -f "$LATEST_BACKUP/roles.sql"
```

### Option 2: Selective Restoration (Per-Table)

Restore individual tables or schemas:

1. Install the [Supabase CLI](https://supabase.com/docs/guides/cli).
2. Navigate to this repository and locate your backup files:
   - **Latest backup**: `backups/latest/latest_{timestamp}/` or use symlink `backups/latest/latest/`
   - **Historical backup**: `backups/archive/{timestamp}--{repo}--{event}--{sha}/`
3. Run the following commands in order:

```bash
# Find the most recent latest backup
LATEST_BACKUP=$(find backups/latest -maxdepth 1 -type d -name "latest_*" | sort -r | head -1)
[ -z "$LATEST_BACKUP" ] && LATEST_BACKUP="backups/latest/latest"  # Fallback to symlink

# Restore roles
supabase db execute --db-url "<SUPABASE_DB_URL>" -f "$LATEST_BACKUP/roles.sql"

# Restore all tables in public schema
for table_dir in "$LATEST_BACKUP/public/tables"/*/; do
  table_name=$(basename "$table_dir")
  echo "Restoring table: $table_name"
  supabase db execute --db-url "<SUPABASE_DB_URL>" -f "$table_dir/schema.sql"
  supabase db execute --db-url "<SUPABASE_DB_URL>" -f "$table_dir/data.sql"
done

# Restore custom schemas (if any)
for schema_dir in "$LATEST_BACKUP"/{custom-schema}/tables/*/; do
  table_name=$(basename "$schema_dir")
  echo "Restoring table: $table_name"
  supabase db execute --db-url "<SUPABASE_DB_URL>" -f "$schema_dir/schema.sql"
  supabase db execute --db-url "<SUPABASE_DB_URL>" -f "$schema_dir/data.sql"
done
```

#### Selective Table Restoration

To restore a specific table only:

```bash
# Restore a single table (e.g., users table in public schema)
LATEST_BACKUP=$(find backups/latest -maxdepth 1 -type d -name "latest_*" | sort -r | head -1)
[ -z "$LATEST_BACKUP" ] && LATEST_BACKUP="backups/latest/latest"  # Fallback to symlink

supabase db execute --db-url "<SUPABASE_DB_URL>" -f "$LATEST_BACKUP/public/tables/users/schema.sql"
supabase db execute --db-url "<SUPABASE_DB_URL>" -f "$LATEST_BACKUP/public/tables/users/data.sql"
```

### Option 3: Schema-Level Restoration

Restore an entire schema from a schema-level dump:

```bash
LATEST_BACKUP=$(find backups/latest -maxdepth 1 -type d -name "latest_*" | sort -r | head -1)

# Restore a specific schema (e.g., public schema)
pg_restore \
  --db-url "<SUPABASE_DB_URL>" \
  --schema=public \
  --clean \
  --if-exists \
  --verbose \
  "$LATEST_BACKUP/public/public_schema_*.dump"
```

**Three-Tier Backup Strategy:**
- **Tier 1**: Full database dump (`database_full_{timestamp}.dump`) - Fastest complete restoration
- **Tier 2**: Schema-level dumps (`{schema}_schema_{timestamp}.dump`) - Fast schema restoration
- **Tier 3**: Per-table files (`schema.sql` + `data.sql`) - Granular table restoration

This allows you to restore the entire database, specific schemas, or individual tables as needed.

### 4. **Workflow Toggle**

Use the `BACKUP_ENABLED` variable to control whether backups are executed:

- Set to `true` to enable backups.
- Set to `false` to skip backups without editing the workflow file.

### 5. **Multi-Repo Setup**

#### For Organizations with Shared Database:

1. **Use this repository** (`db-backup-actions`) to store all backups
   - Backups are stored in the `backups/` directory
   - No need for a separate backup repository
   - All backups are version-controlled in this repo

2. **Add the backup workflow to each source repository** that shares the database
   - Each source repo triggers backups to this repository
   - The workflow automatically detects organization using `${{ github.repository_owner }}`
   - No need to hardcode repository names - they're auto-detected

3. **Configure scheduled backups in ONE repo only** to avoid duplicate scheduled backups

4. **Use the same `SUPABASE_DB_URL` secret** in all repos (since they share the database)

5. **The workflow automatically handles concurrency** - only one backup runs at a time

6. **Backups are organized with clear prefixes**:
   - Latest backup: `backups/latest/` (always available)
   - Historical backups: `backups/archive/{timestamp}--{repo}--{event}--{sha}/`

#### Configuration Variables

The workflow uses dynamic values - no hardcoding required:

- **Organization**: `${{ github.repository_owner }}` - automatically detected
- **Backup Repository**: Defaults to `${{ github.repository_owner }}/supabase-backups`
- **Source Repository**: `${{ github.repository }}` - automatically detected
- **All values are configurable** via workflow inputs if needed

#### Example: Adding Backup to a Source Repository

```yaml
# .github/workflows/backup.yaml in each source repo
name: Backup Shared Database

on:
  push:
    branches: [main, dev]  # Supports both main and dev branches
  workflow_dispatch:        # Manual trigger from any repo
  # schedule: Only add this in ONE repo to avoid duplicates!
  #   - cron: "0 0 * * *"  # Daily at midnight

jobs:
  backup:
    # Uses ${{ github.repository_owner }} to automatically detect organization
    # Backups are stored in db-backup-actions repository
    uses: ${{ github.repository_owner }}/db-backup-actions/.github/workflows/backup.yaml@main
    concurrency:
      group: shared-db-backup
      cancel-in-progress: false
    secrets:
      SUPABASE_DB_URL: ${{ secrets.SUPABASE_DB_URL }}
    with:
      source_repo: ${{ github.repository }}
      source_ref: ${{ github.ref }}
      source_sha: ${{ github.sha }}
      trigger_event: ${{ github.event_name }}
```

**Note:** 
- Any push to `main` or `dev` branch in this repo will trigger a backup
- Manual dispatch can be triggered from any repo with this workflow
- Scheduled backups should only be configured in ONE repo to avoid duplicates
- All triggers use concurrency control to prevent simultaneous backups

**Configuration Notes:**
- **Organization**: Automatically detected using `${{ github.repository_owner }}` - no hardcoding needed
- **Backup Storage**: All backups stored in `db-backup-actions` repository's `backups/` directory
- **Works Across Organizations**: Same workflow template works for any GitHub organization
- **Naming**: Backups use prefix format: `{timestamp}--{repo}--{event}--{sha}/`

## Requirements

- **Any Supabase project** with a PostgreSQL database
  - Works with any Supabase account (free, pro, enterprise)
  - Works with any database structure (any number of schemas/tables)
  - Just provide your Supabase connection string
- Supabase CLI installed for manual restoration
- A GitHub organization with multiple repositories sharing the same database (optional - can also work with single repo)
- This repository (`db-backup-actions`) to store backups
- GitHub Actions enabled in all repositories
- Proper permissions for workflows to commit to this repository

### Getting Your Supabase Connection String

1. Go to your Supabase project dashboard
2. Navigate to **Settings > Database**
3. Find the **Connection string** section
4. Copy either:
   - **Connection pooling** (recommended for production)
   - **Direct connection** (for backups, either works)
5. Format: `postgresql://postgres.[PROJECT-REF]:[PASSWORD]@aws-0-[REGION].pooler.supabase.com:6543/postgres`
   - Or: `postgresql://postgres:[PASSWORD]@db.[PROJECT-REF].supabase.co:5432/postgres`

The system will automatically detect and backup all your schemas and tables - no additional configuration needed!

## Important Notes

### Shared Database Model

- **Multiple repos, one database**: All source repositories share the same Supabase database
- **Same secrets**: All repos use the same `SUPABASE_DB_URL` secret
- **Concurrency control**: The workflow ensures only one backup runs at a time
- **Scheduled backups**: Configure scheduled backups in **ONE repo only** to avoid duplicates
- **Backup content**: All backups contain the same database content, regardless of which repo triggered it
- **Traceability**: Archive backups include the source repo name for tracking

### Configuration Philosophy

- **No Hardcoding**: Organization and repository names are automatically detected
- **Dynamic Values**: Uses `${{ github.repository_owner }}` and `${{ github.repository }}`
- **Reusable**: Same workflow template works across different organizations
- **Centralized Storage**: All backups stored in this repository (`db-backup-actions`)
- **Clear Naming**: Backup folders use prefixes for easy identification

### Backup Storage Location

- **Storage**: All backups are stored in this repository in the `backups/` directory
- **Latest**: `backups/latest/latest_{timestamp}/` contains the most recent timestamped backup (previous latest automatically moved to archive)
- **Archive**: `backups/archive/` contains historical backups (previous latest backups moved here automatically)
- **Naming**: Archive backups use format: `{timestamp}--{repo}--{event}--{sha}/`
- **Organization**: Timestamped latest folders stored in `backups/latest/` for proper organization
- **Version Control**: All backups are tracked in git history

### Schema Backup Strategy

The system **automatically works with any Supabase database**:

- ✅ **Automatic Detection**: Discovers all user schemas and tables dynamically
- ✅ **Public Schema**: Always backed up (primary application schema)
  - All tables in the public schema are backed up individually
  - Number of tables varies by database (automatically detected)
- ✅ **Custom Schemas**: Automatically detected and backed up
  - Any custom schemas you've created (e.g., `analytics`, `billing`, `custom_app`, etc.)
  - All tables within custom schemas are backed up individually
  - System adapts to your database structure automatically
- ✅ **Full Database Backup**: Includes ALL Supabase system schemas
  - `auth`, `storage`, `realtime`, `vault`, `extensions`, `graphql`, `graphql_public`, `pgbouncer`, `cron`, `pg_cron`, `pgagent`
  - All custom user schemas
  - Only PostgreSQL internal schemas excluded: `pg_catalog`, `information_schema`, `pg_toast`, `pg_temp_*`, `pg_toast_temp_*`

**How It Works:**
1. You provide your Supabase connection string
2. System queries your database to discover ALL schemas and tables
3. Includes ALL Supabase system schemas (full database backup)
4. Creates per-table backups for ALL schemas and tables
5. No configuration needed - performs complete full backup of entire database

**Example:** If your database has:
- `public` schema with 20 tables
- `analytics` schema with 5 tables  
- `billing` schema with 8 tables

The system will automatically detect and backup all 33 tables across 3 schemas.

## Documentation

For detailed architecture, implementation plans, and test scenarios, see:
- [System Plan](./Docs/system-plan.md) - Comprehensive planning document with architecture, requirements, and test scenarios
- [Development Plan](./Docs/development-plan.md) - Development phases, tasks, and implementation details
- [Script Improvement Plan](./Docs/script-improvement-plan.md) - Dual backup structure implementation (schema .dump files + per-table files)
- [Full Backup Policy](./Docs/full-backup-policy.md) - Complete database backup policy (includes ALL Supabase schemas)

## Contributing

Contributions are welcome! If you have improvements or fixes, feel free to submit a pull request.

## License

This project is licensed under the MIT License. See the LICENSE file for details.
