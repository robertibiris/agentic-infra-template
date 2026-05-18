#!/usr/bin/env bash
# Setup script for nested plans repository
# Source of truth for initializing the optional nested git repo in .agents/plans/

set -euo pipefail

# Script configuration
PLANS_DIR=".agents/plans"
TEMPLATE_PATH="${PLANS_DIR}/_template/nested-plans-repo.gitignore.template"
GITIGNORE_PATH="${PLANS_DIR}/.gitignore"
GIT_DIR="${PLANS_DIR}/.git"

# Colors for output (optional, but helpful)
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Logging helpers
log_info() {
    echo -e "${GREEN}[INFO]${NC} $*"
}

log_warn() {
    echo -e "${YELLOW}[WARN]${NC} $*"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $*" >&2
}

# Main execution
main() {
    # Save original directory to restore before exit
    local original_dir
    original_dir="$(pwd)"

    # Set up trap to restore the original directory when script exits (normal or error)
    # The "${original_dir:-}" syntax safely handles unset variables (required by set -u)
    # If original_dir is set and non-empty, change back to it; otherwise do nothing
    trap 'if [[ -n "${original_dir:-}" ]]; then cd "${original_dir}"; fi' EXIT

    # Validate .agents/plans/ exists
    if [[ ! -d "${PLANS_DIR}" ]]; then
        log_error ".agents/plans/ directory does not exist."
        log_error "Please ensure the agentic infrastructure is set up correctly."
        exit 1
    fi

    # Validate template exists
    if [[ ! -f "${TEMPLATE_PATH}" ]]; then
        log_error "Template file not found: ${TEMPLATE_PATH}"
        log_error "This file is required as the source of truth for the nested repo's .gitignore"
        exit 1
    fi

    # Check if nested repo already exists
    if [[ -d "${GIT_DIR}" ]]; then
        log_info "Nested repository already initialized at ${GIT_DIR}"
        log_info "No action needed. The nested repo is ready to use."
        exit 0
    fi

    # Setup nested repository
    log_info "Setting up nested repository in ${PLANS_DIR}..."

    # Copy .gitignore from template
    log_info "Copying .gitignore from template..."
    cp "${TEMPLATE_PATH}" "${GITIGNORE_PATH}"

    # Initialize git repository
    log_info "Initializing git repository..."
    cd "${PLANS_DIR}"
    git init

    # Create initial commit
    log_info "Creating initial commit..."
    if ! git add .gitignore; then
        log_error "Failed to stage .gitignore"
        exit 1
    fi

    # Attempt commit, with helpful error message if git config is missing
    if ! git commit -m "Docs: Added nested plans gitignore"; then
        log_error "Failed to create initial commit."
        log_error ""
        log_error "This is likely because git user.name and user.email are not configured."
        log_error "Please run:"
        log_error "  git config --global user.name \"Your Name\""
        log_error "  git config --global user.email \"your.email@example.com\""
        log_error ""
        log_error "Or configure them locally for this repository only:"
        log_error "  git config user.name \"Your Name\""
        log_error "  git config user.email \"your.email@example.com\""
        exit 1
    fi

    log_info "Nested repository initialized successfully!"
    log_info ""
    log_info "Next steps:"
    log_info "  - Create a plan folder: .agents/plans/{PLAN_NAME}/"
    log_info "  - Start committing plan progress locally inside the nested repo"
}

main "$@"
