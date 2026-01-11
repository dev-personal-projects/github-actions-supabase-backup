# Full Database Backup Policy

## 📋 Overview

This document defines the **Full Database Backup Policy** for the Supabase database backup system. The system performs a **complete full backup** of the entire database with **no Supabase schema exclusions**.

---

## 🎯 Backup Philosophy

**Complete Full Backup**: The system backs up **EVERYTHING** in the database except PostgreSQL internal system schemas that cannot be backed up.

---

## ✅ Schemas Included in Backup

### Supabase System Schemas (ALL Included)

The system includes ALL Supabase-managed schemas in the backup:

- **`auth`** - Authentication system
  - Users, sessions, refresh tokens, MFA settings, etc.
  - Critical for user authentication and authorization

- **`storage`** - Storage system
  - Files, buckets, policies, objects metadata
  - Critical for file storage and access control

- **`realtime`** - Realtime system
  - Subscriptions, channels, presence data
  - Critical for real-time features

- **`vault`** - Secrets management
  - Encrypted secrets, keys
  - Critical for secure data storage

- **`extensions`** - PostgreSQL extensions metadata
  - Extension configurations and states

- **`graphql`** - GraphQL system
  - GraphQL schema definitions and metadata

- **`graphql_public`** - GraphQL public API
  - Public GraphQL endpoints and configurations

- **`pgbouncer`** - Connection pooling
  - Connection pool configurations and metadata

- **`cron`** - Scheduled jobs
  - Cron job definitions and schedules

- **`pg_cron`** - PostgreSQL cron extension
  - Database-level cron job configurations

- **`pgagent`** - PostgreSQL agent
  - Agent job definitions and configurations

### Application Schemas (ALL Included)

- **`public`** - Primary application schema
  - All user-created tables and data
  - Primary application data

- **Custom schemas** - All user-created schemas
  - Any custom schemas (e.g., `lh_billing`, `analytics`, `custom_app`, etc.)
  - All tables and data within custom schemas

---

## ❌ Schemas Excluded (PostgreSQL Internal Only)

Only PostgreSQL internal system schemas are excluded (these cannot be backed up):

- **`pg_catalog`** - PostgreSQL system catalog
  - Internal PostgreSQL metadata
  - Cannot be backed up (system-defined)

- **`information_schema`** - PostgreSQL information schema
  - Internal PostgreSQL metadata
  - Cannot be backed up (system-defined)

- **`pg_toast`** - PostgreSQL toast tables
  - Internal storage for large values
  - Cannot be backed up (system-managed)

- **`pg_temp_*`** - Temporary schemas
  - Session-specific temporary schemas
  - Cannot be backed up (ephemeral)

- **`pg_toast_temp_*`** - Temporary toast schemas
  - Session-specific temporary toast schemas
  - Cannot be backed up (ephemeral)

---

## 🔍 Schema Detection Query

The system uses the following query to detect ALL schemas for backup:

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

**Key Points:**
- Only excludes PostgreSQL internal system schemas
- Includes ALL Supabase system schemas
- Includes ALL custom user schemas
- No Supabase schema filtering

---

## 📊 Backup Coverage

### What Gets Backed Up

✅ **ALL Supabase System Schemas**
- auth, storage, realtime, vault, extensions, graphql, graphql_public, pgbouncer, cron, pg_cron, pgagent

✅ **ALL Application Schemas**
- public schema
- All custom user-created schemas

✅ **ALL Tables**
- Every table in every included schema
- No table exclusions

✅ **ALL Data**
- Complete data backup for all tables
- No data filtering

✅ **Database Roles**
- All database roles and permissions

### What Does NOT Get Backed Up

❌ **PostgreSQL Internal Schemas Only**
- pg_catalog (system catalog)
- information_schema (information schema)
- pg_toast (toast tables)
- pg_temp_* (temporary schemas)
- pg_toast_temp_* (temporary toast schemas)

---

## 🎯 Benefits of Full Backup

### Complete Data Protection
- ✅ **No Data Loss**: Everything is backed up, including Supabase-managed data
- ✅ **User Data**: All authentication data (users, sessions, MFA)
- ✅ **File Metadata**: All storage metadata (files, buckets, policies)
- ✅ **Realtime State**: All realtime subscriptions and channels
- ✅ **Secrets**: All vault secrets and keys
- ✅ **Configuration**: All extension and system configurations

### Disaster Recovery
- ✅ **Complete Restoration**: Can restore entire database including Supabase state
- ✅ **User Accounts**: Restore all user accounts and authentication data
- ✅ **File References**: Restore all file storage metadata
- ✅ **System State**: Restore Supabase system configurations

### Compliance & Audit
- ✅ **Complete Audit Trail**: Full backup includes all data for compliance
- ✅ **No Gaps**: No missing data in backups
- ✅ **Complete History**: Full backup history for all schemas

---

## ⚠️ Important Notes

### Backup Size
- Full backups will be larger than selective backups
- Includes all Supabase system data
- Consider storage requirements

### Restoration Considerations
- Full backup allows complete database restoration
- Can restore Supabase system state
- May require Supabase-specific restoration procedures for some schemas

### Supabase System Schemas
- Some Supabase system schemas may be managed by Supabase
- Restoration of system schemas may require Supabase platform support
- Application schemas can always be restored independently

---

## 📝 Implementation

### Schema Detection
The `detect_schemas()` function in `detect.sh` should be updated to:
- Remove Supabase schema exclusions
- Only exclude PostgreSQL internal schemas
- Include ALL Supabase system schemas

### Backup Execution
The backup process should:
- Back up ALL detected schemas
- Create both .dump files and per-table files for each schema
- Include ALL tables in each schema
- No filtering of Supabase system schemas

---

## ✅ Verification

To verify full backup coverage:

1. **Check Schema Detection**:
   ```bash
   # Should list ALL schemas including auth, storage, realtime, etc.
   detect_schemas "$DB_URL"
   ```

2. **Check Backup Files**:
   ```bash
   # Should see backup files for ALL schemas
   ls -la backups/latest/
   ```

3. **Verify Tables**:
   ```bash
   # Should see tables from ALL schemas
   find backups/latest -name "*.sql" -o -name "*.dump"
   ```

---

**Document Version:** 1.0  
**Last Updated:** 2024-12-XX  
**Status:** Active Policy
