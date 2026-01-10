# Backup Scripts

This directory contains modular, reusable scripts for the Supabase database backup workflow.

## Scripts Overview

### `detect-schemas.sh`
Detects all user schemas in the database, excluding Supabase system schemas.

**Usage:**
```bash
./detect-schemas.sh <db_url>
```

**Output:** List of schema names (one per line)

**Excludes:**
- Supabase system schemas: `auth`, `extensions`, `graphql`, `graphql_public`, `realtime`, `storage`, `vault`, `pgbouncer`
- PostgreSQL system schemas: `pg_catalog`, `information_schema`, `pg_toast`
- Temporary schemas: `pg_temp*`, `pg_toast_temp*`

---

### `detect-tables.sh`
Detects all tables in a specific schema.

**Usage:**
```bash
./detect-tables.sh <db_url> <schema_name>
```

**Output:** List of table names (one per line)

---

### `create-directories.sh`
Creates the base directory structure for backups.

**Usage:**
```bash
./create-directories.sh [backup_base_dir]
```

**Default:** Creates `backups/latest/` and `backups/archive/` if no directory specified

---

### `backup-table.sh`
Backs up a single table (both schema and data).

**Usage:**
```bash
./backup-table.sh <db_url> <schema> <table> <output_dir>
```

**Creates:**
- `{output_dir}/{schema}/tables/{table}/schema.sql` - Table structure
- `{output_dir}/{schema}/tables/{table}/data.sql` - Table data

---

### `backup-roles.sh`
Backs up all database roles and permissions.

**Usage:**
```bash
./backup-roles.sh <db_url> <output_file>
```

**Creates:** Single SQL file with all roles

---

### `backup-schema.sh`
Orchestrates backup of all tables in a schema.

**Usage:**
```bash
./backup-schema.sh <db_url> <schema> <output_dir> <scripts_dir>
```

**Process:**
1. Detects all tables in the schema
2. Backs up each table individually
3. Reports success/failure for each table

---

## Security

- All scripts use `set -euo pipefail` for strict error handling
- Database URLs are passed as parameters (never logged)
- Scripts validate all required parameters before execution
- Error messages are written to stderr

## Error Handling

- Scripts exit with non-zero status on failure
- Clear error messages for debugging
- Validation of inputs before processing
- Graceful handling of edge cases (empty schemas, no tables, etc.)

## Maintainability

- Each script has a single responsibility
- Clear parameter validation
- Helpful usage messages
- Consistent error handling patterns
- Well-commented code
