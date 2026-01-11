#!/bin/bash

# To make this script executable, run:
#   chmod +x Backups/Postgres/scripts/0_backup_supabase_lighthouse_db.sh
# Execute with:
#   ./Backups/Postgres/scripts/0_backup_supabase_lighthouse_db.sh
#
# Full logical backup utility for Supabase Lighthouse Postgres databases
# Creates schema+data dumps for dev, prod, or both environments using Key Vault connection strings

set -euo pipefail

# Suppress locale noise from perl/pg_dump on minimal containers
export LC_ALL=C
export LANG=C

# CLI usage helper
print_usage() {
    cat <<'USAGE'
Usage: 0_backup_supabase_lighthouse_db.sh [--target prod|dev|both] [--help]

Options:
  --target   Skip the interactive prompt and choose prod, dev, or both directly.
  --help     Show this message.

Examples:
  ./Backups/Postgres/scripts/0_backup_supabase_lighthouse_db.sh
  ./Backups/Postgres/scripts/0_backup_supabase_lighthouse_db.sh --target both
USAGE
}

# Script directories
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../../.." && pwd)"
LIB_DIR="${REPO_ROOT}/scripts/lib"

# Source shared helpers
if [[ -f "${LIB_DIR}/common.sh" ]]; then
    source "${LIB_DIR}/common.sh"
else
    echo "Error: common.sh library not found at ${LIB_DIR}/common.sh" >&2
    exit 1
fi

# Constants
readonly PROD_PROJECT_REF="grmyhpslmeglhdzduakn"
readonly DEV_PROJECT_REF="rydjtromccpzryyblsxx"
readonly PROD_KEYVAULT="prod-lh-KeyVault"
readonly DEV_KEYVAULT="dev-lh-KeyVault"
readonly SECRET_NAME="lh-PostgresConnectionString"

readonly BACKUP_DIR="${REPO_ROOT}/Backups/Postgres/dumps/FullBackups"
readonly TIMESTAMP="$(date +%Y%m%d_%H%M%S)"
readonly LOG_FILE="${BACKUP_DIR}/backup_${TIMESTAMP}.log"
export LOG_FILE

mkdir -p "${BACKUP_DIR}"

# Helper functions (kept local so we don't impact other scripts)
parse_conn_string_components() {
    local conn_string="$1"
    local host port database username password

    host=$(echo "$conn_string" | grep -oP 'Host=\K[^;]+' || echo "")
    port=$(echo "$conn_string" | grep -oP 'Port=\K[^;]+' || echo "")
    database=$(echo "$conn_string" | grep -oP 'Database=\K[^;]+' || echo "")
    username=$(echo "$conn_string" | grep -oP 'Username=\K[^;]+' || echo "")
    password=$(echo "$conn_string" | grep -oP 'Password=\K[^;]+' || echo "")

    if [[ -z "$host" || -z "$port" || -z "$database" || -z "$username" || -z "$password" ]]; then
        fatal "Invalid connection string format. Missing required components."
    fi

    echo "${host}|${port}|${database}|${username}|${password}"
}

extract_project_ref() {
    local username="$1"
    if [[ "$username" == postgres.* ]]; then
        echo "${username#postgres.}"
    else
        echo ""
    fi
}

convert_conn_string_to_uri() {
    local conn_string="$1"
    local host port database username password

    IFS='|' read -r host port database username password <<< "$(parse_conn_string_components "$conn_string")"

    local encoded_password
    encoded_password=$(urlencode "$password")

    echo "postgresql://${username}:${encoded_password}@${host}:${port}/${database}"
}

fetch_connection_string() {
    local keyvault="$1"
    az keyvault secret show --vault-name "$keyvault" --name "$SECRET_NAME" --query value -o tsv
}

convert_choice_to_targets() {
    local choice="$1"
    case "${choice,,}" in
        1|"prod"|"production") echo "prod" ;;
        2|"dev"|"development") echo "dev" ;;
        3|"both"|"all") echo "prod dev" ;;
        *) fatal "Invalid selection '$choice'. Please choose 1, 2, or 3." ;;
    esac
}

display_selection_menu() {
    echo >&2
    echo "Backup target options:" >&2
    echo "  1) Production only" >&2
    echo "  2) Development only" >&2
    echo "  3) Both production and development" >&2
    local selection
    read -rp "Select backup target (1=Prod, 2=Dev, 3=Both): " selection
    printf '%s\n' "$selection"
}

get_db_size_bytes() {
    local conn_uri="$1"
    local size
    size=$(psql "$conn_uri" -Atc "SELECT pg_database_size(current_database());" 2>>"${LOG_FILE}" || echo "")
    if [[ "$size" =~ ^[0-9]+$ ]]; then
        echo "$size"
    else
        echo 0
    fi
}

backup_database() {
    local env_name="$1"
    local conn_uri="$2"
    local outfile="$3"

    log_info "Backing up ${env_name} database to ${outfile}"
    if pg_dump "$conn_uri" \
        --format=custom \
        --file="$outfile" \
        --no-owner \
        --no-privileges \
        --blobs \
        --verbose 2>&1 | tee -a "${LOG_FILE}"; then
        log_info "Backup for ${env_name} completed successfully"
    else
        fatal "Backup for ${env_name} failed. Check log file: ${LOG_FILE}"
    fi
}

verify_prerequisites() {
    log_info "Validating prerequisites..."

    command -v az >/dev/null 2>&1 || fatal "Azure CLI (az) is not installed."
    log_info "Azure CLI version: $(az --version | head -n1)"

    command -v pg_dump >/dev/null 2>&1 || fatal "pg_dump is not installed."
    log_info "pg_dump version: $(pg_dump --version)"

    command -v psql >/dev/null 2>&1 || fatal "psql is not installed."

    if ! az account show >/dev/null 2>&1; then
        fatal "Not authenticated with Azure. Please run 'az login' first."
    fi
    log_info "Azure authentication verified"

    for kv in "$PROD_KEYVAULT" "$DEV_KEYVAULT"; do
        if ! az keyvault show --name "$kv" >/dev/null 2>&1; then
            fatal "Cannot access Key Vault: $kv"
        fi
        log_info "Key Vault accessible: $kv"
    done
}

main() {
    local cli_target=""
    while [[ $# -gt 0 ]]; do
        case "$1" in
            --target)
                [[ $# -ge 2 ]] || fatal "--target requires an argument (prod|dev|both)"
                cli_target="$2"
                shift 2
                ;;
            --target=*)
                cli_target="${1#*=}"
                shift
                ;;
            -h|--help)
                print_usage
                exit 0
                ;;
            *)
                fatal "Unknown argument: $1"
                ;;
        esac
    done

    log_info "Starting Supabase Lighthouse backup workflow"
    log_info "Script directory: $SCRIPT_DIR"
    log_info "Backup directory: $BACKUP_DIR"
    log_info "Log file: $LOG_FILE"

    verify_prerequisites

    echo ""
    local targets=""
    if [[ -n "$cli_target" ]]; then
        if ! targets=$(convert_choice_to_targets "$cli_target"); then
            fatal "Invalid --target value: $cli_target (expected prod|dev|both)"
        fi
    else
        local user_choice=""
        set +e
        user_choice=$(display_selection_menu)
        local status=$?
        set -e

        if [[ $status -ne 0 ]]; then
            fatal "Failed to read backup target from stdin (are you running non-interactively?)"
        fi

        if ! targets=$(convert_choice_to_targets "$user_choice"); then
            fatal "Invalid selection '$user_choice'. Please choose 1, 2, or 3."
        fi
    fi
    if [[ -z "$targets" ]]; then
        fatal "No backup targets specified."
    fi

    echo ""
    log_warn "This operation performs a FULL logical backup (schema + data)."
    log_warn "Destination directory: ${BACKUP_DIR}"
    if ! prompt_yes_no "Proceed with backup for target(s): ${targets}?"; then
        log_info "Backup cancelled by user."
        exit 0
    fi

    declare -A conn_strings
    declare -A conn_uris
    declare -A project_refs

    for env in $targets; do
        local keyvault conn_string conn_uri host port database username password project_ref expected_ref
        if [[ "$env" == "prod" ]]; then
            keyvault="$PROD_KEYVAULT"
            expected_ref="$PROD_PROJECT_REF"
        else
            keyvault="$DEV_KEYVAULT"
            expected_ref="$DEV_PROJECT_REF"
        fi

        log_info "Retrieving ${env} connection string from ${keyvault}"
        conn_string=$(fetch_connection_string "$keyvault")
        if [[ -z "$conn_string" ]]; then
            fatal "Failed to retrieve connection string for ${env}"
        fi
        log_info "$(printf "%s connection string retrieved: %s" "$env" "$(mask_connection_string "$conn_string")")"

        IFS='|' read -r host port database username password <<< "$(parse_conn_string_components "$conn_string")"
        project_ref=$(extract_project_ref "$username")
        if [[ -n "$project_ref" && -n "$expected_ref" && "$project_ref" != "$expected_ref" ]]; then
            fatal "Unexpected project reference for ${env}: ${project_ref} (expected ${expected_ref})"
        fi

        conn_uri=$(convert_conn_string_to_uri "$conn_string")
        conn_strings["$env"]="$conn_string"
        conn_uris["$env"]="$conn_uri"
        project_refs["$env"]="${project_ref:-unknown}"
    done

    if [[ -n "${conn_strings[prod]:-}" && -n "${conn_strings[dev]:-}" ]]; then
        if [[ "${conn_strings[prod]}" == "${conn_strings[dev]}" ]]; then
            fatal "Prod and Dev connection strings are identical. Aborting to prevent mistakes."
        fi
    fi

    declare -a completed_backups
    for env in $targets; do
        local outfile
        outfile="${BACKUP_DIR}/${env}_full_backup_${TIMESTAMP}.dump"
        backup_database "$env" "${conn_uris[$env]}" "$outfile"
        completed_backups+=("$outfile")
    done

    log_info "=========================================="
    log_info "Backup summary:"
    for file in "${completed_backups[@]}"; do
        if [[ -f "$file" ]]; then
            local size
            size=$(numfmt --to=iec-i --suffix=B "$(stat -c%s "$file")")
            log_info "  - $(basename "$file") (${size})"
        else
            log_warn "  - Expected backup file missing: $file"
        fi
    done
    log_info "Log file: ${LOG_FILE}"
    log_info "=========================================="
    echo "Backup completed successfully."
}

main "$@"

