# Supabase Database Backup with GitHub Actions

This repository provides a seamless way to automate backups of your Supabase database using GitHub Actions. It supports **multiple repositories in an organization sharing a single Supabase database**, where any PR, commit, or scheduled event in any repository can trigger a backup of the shared database to a dedicated backup repository.

---

## Features

- **Multi-Repo Support:** Multiple repositories can trigger backups of a shared Supabase database
- **Flexible Triggers:** Backups can be triggered by commits, PRs, scheduled events, or manual dispatch from any repository
- **Concurrency Control:** Prevents duplicate backups when multiple repos trigger simultaneously
- **Automatic Daily Backups:** Scheduled backups run every day at midnight (configure in one repo only)
- **Schema-Specific Backups:** Creates modular backup files for roles, public schema, and custom schemas
- **Smart Schema Filtering:** Automatically excludes Supabase system schemas (auth, storage, realtime, etc.)
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
  - `SUPABASE_DB_URL`: Your shared Supabase PostgreSQL connection string.  
    Format: `postgresql://<USER>:<PASSWORD>@<HOST>:5432/postgres`
    - ⚠️ **Note**: All repos that share the database use the **same** `SUPABASE_DB_URL`

- **Variables:**
  - `BACKUP_ENABLED`: Set to `true` to enable backups or `false` to disable them.

#### In Backup Repository (if using reusable workflow):

- **Secrets:**
  - `GITHUB_TOKEN`: For committing backups (or use default `GITHUB_TOKEN` with proper permissions)

---

### 2. **How the Workflow Works**

#### Workflow Triggers

The GitHub Actions workflow can be triggered from **any repository** that shares the database:

- **Pushes** to `main` or `dev` branches (from any repo)
- **Pull requests** merged to `main` or `dev` (from any repo)
- **Manual dispatch** via the GitHub interface (from any repo)
- **Scheduled** backups (configure in **ONE repo only** to avoid duplicates)

#### Concurrency Control

The workflow uses GitHub Actions concurrency groups to ensure only **one backup runs at a time**, even when multiple repos trigger simultaneously. This prevents duplicate backups and ensures efficient resource usage.

#### Backup Process

The workflow performs the following steps:

1. Checks if backups are enabled using the `BACKUP_ENABLED` variable.
2. Detects available schemas (public + custom schemas, excluding Supabase system schemas).
3. Runs the Supabase CLI to create backup files:
   - `roles.sql`: Contains all database roles and permissions.
   - `public/schema.sql`: Contains public schema structure.
   - `public/data.sql`: Contains public schema table data.
   - `{custom-schema}/schema.sql`: For each custom schema.
   - `{custom-schema}/data.sql`: For each custom schema.
4. Stores backups in the dedicated backup repository:
   - Latest backup in `backups/latest/`
   - Historical backups in `backups/archive/{timestamp}-{source-repo}/`
5. Commits the backups to the backup repository.

#### Backup Storage Structure

Backups are stored **in this repository** in the `backups/` directory. Each table is backed up individually for better organization:

```
backups/
├── latest/                      # Always contains latest backup
│   ├── roles.sql               # All database roles
│   ├── public/                 # Public schema
│   │   └── tables/             # Individual table backups
│   │       ├── users/
│   │       │   ├── schema.sql  # Table structure
│   │       │   └── data.sql    # Table data
│   │       ├── orders/
│   │       │   ├── schema.sql
│   │       │   └── data.sql
│   │       └── products/
│   │           ├── schema.sql
│   │           └── data.sql
│   └── {custom-schema}/         # Custom schemas
│       └── tables/
│           └── {table-name}/
│               ├── schema.sql
│               └── data.sql
└── archive/                     # Historical backups with prefixes
    ├── 2024-01-15T00-00-00Z--org/repo1--push--abc1234/
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

1. Install the [Supabase CLI](https://supabase.com/docs/guides/cli).
2. Navigate to this repository and locate your backup files:
   - **Latest backup**: `backups/latest/`
   - **Historical backup**: `backups/archive/{timestamp}--{repo}--{event}--{sha}/`
3. Run the following commands in order:

#### Full Database Restoration

```bash
# Restore roles
supabase db execute --db-url "<SUPABASE_DB_URL>" -f backups/latest/roles.sql

# Restore all tables in public schema
for table_dir in backups/latest/public/tables/*/; do
  table_name=$(basename "$table_dir")
  echo "Restoring table: $table_name"
  supabase db execute --db-url "<SUPABASE_DB_URL>" -f "$table_dir/schema.sql"
  supabase db execute --db-url "<SUPABASE_DB_URL>" -f "$table_dir/data.sql"
done

# Restore custom schemas (if any)
for schema_dir in backups/latest/{custom-schema}/tables/*/; do
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
supabase db execute --db-url "<SUPABASE_DB_URL>" -f backups/latest/public/tables/users/schema.sql
supabase db execute --db-url "<SUPABASE_DB_URL>" -f backups/latest/public/tables/users/data.sql
```

This allows you to restore the entire database or selectively restore individual tables as needed.

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
    branches: [main, dev]
  pull_request:
    branches: [main, dev]
    types: [closed]
  workflow_dispatch:
  # schedule: Only add this in ONE repo!
  #   - cron: "0 0 * * *"

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

**Configuration Notes:**
- **Organization**: Automatically detected using `${{ github.repository_owner }}` - no hardcoding needed
- **Backup Storage**: All backups stored in `db-backup-actions` repository's `backups/` directory
- **Works Across Organizations**: Same workflow template works for any GitHub organization
- **Naming**: Backups use prefix format: `{timestamp}--{repo}--{event}--{sha}/`

## Requirements

- A Supabase project with a PostgreSQL database (shared across multiple repositories)
- Supabase CLI installed for manual restoration
- A GitHub organization with multiple repositories sharing the same database
- This repository (`db-backup-actions`) to store backups
- GitHub Actions enabled in all repositories
- Proper permissions for workflows to commit to this repository

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
- **Latest**: `backups/latest/` always contains the most recent backup
- **Archive**: `backups/archive/` contains historical backups with timestamp prefixes
- **Naming**: Archive backups use format: `{timestamp}--{repo}--{event}--{sha}/`
- **Version Control**: All backups are tracked in git history

### Schema Backup Strategy

The system automatically:
- ✅ Backs up the `public` schema (always included)
- ✅ Backs up any custom schemas you've created
- ❌ Excludes Supabase system schemas (auth, storage, realtime, vault, etc.)
- ❌ Excludes PostgreSQL system schemas (pg_catalog, information_schema, etc.)

## Documentation

For detailed architecture, implementation plans, and test scenarios, see:
- [System Plan](./Docs/system-plan.md) - Comprehensive planning document with architecture, requirements, and test scenarios

## Contributing

Contributions are welcome! If you have improvements or fixes, feel free to submit a pull request.

## License

This project is licensed under the MIT License. See the LICENSE file for details.
