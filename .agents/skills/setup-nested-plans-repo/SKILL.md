---
name: setup-nested-plans-repo
description: "Initialize an optional nested git repository inside .agents/plans/ so developers can version-control their tracked plans (persisted plans, nested plans) locally, without committing plan directories to the main repository. This is an infra skill for setting up the tracked plan infrastructure. Use when setting up plan tracking for the first time. Triggers on: 'setup plans repo', 'initialize nested plans', 'set up plan tracking', 'setup tracked plans', or when the user wants to start using the plans infrastructure."
---

Initialize an optional nested git repository inside `.agents/plans/` for local version control of plans.

## Inputs

None.

## Implementation

**Source of truth**: The deterministic setup script at `.agents/skills/setup-nested-plans-repo/scripts/setup_nested_plans_repo.sh` implements all setup logic.

## Usage

Run from the project root:

```bash
bash .agents/skills/setup-nested-plans-repo/scripts/setup_nested_plans_repo.sh
```

## Behavior

1. **Validates prerequisites**:
   - Checks that `.agents/plans/` directory exists.
   - Verifies the template file exists at `.agents/plans/_template/nested-plans-repo.gitignore.template`.

2. **Idempotent check**:
   - If `.agents/plans/.git/` already exists, prints "already initialized" and exits with code 0 (no changes made, no `.gitignore` refresh).

3. **Setup (only if not already initialized)**:
   - Copies `.gitignore` from the template (single source of truth).
   - Initializes git repository with `git init` inside `.agents/plans/`.
   - Creates initial commit with message: `"Docs: Added nested plans gitignore"`.
   - Provides helpful error messages if git user configuration is missing.

## Side effects

- Creates `.agents/plans/.git/` (nested git repository metadata).
- Creates `.agents/plans/.gitignore` (nested repo ignore rules).
- Creates a local git commit in the nested repo.

## Notes

- Once `.agents/plans/.git/` exists, the outer repository will stop traversing into `.agents/plans/`. This is expected for nested repos.
- Ensure the outer repo tracks shared docs before enabling the nested repo: `.agents/plans/README.md`, `.agents/plans/AGENTS.md`.
- The nested repo's `.gitignore` content must come from the template at `.agents/plans/_template/nested-plans-repo.gitignore.template`.
