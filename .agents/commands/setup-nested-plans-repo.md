# Command: setup-nested-plans-repo

## Purpose
Initialize an **optional nested git repository** inside `.agents/plans/` so developers can version-control their plan work locally, without committing plan directories to the main repository.

This command:
- Creates the nested repo’s `.gitignore` from the **single source of truth** template (first-run only).
- Initializes the nested repository.
- Creates an initial commit containing **only** `.gitignore`, so the repo is immediately usable.

## Inputs
None.

## Implementation

**Source of truth**: The deterministic setup script at `.agents/scripts/setup_nested_plans_repo.sh` implements all setup logic. This command document describes usage and expected behavior.

## Usage

Run from the project root:

```bash
bash .agents/scripts/setup_nested_plans_repo.sh
```

## Behavior

The script performs the following steps:

1. **Validates prerequisites**:
   - Checks that `.agents/plans/` directory exists
   - Verifies the template file exists at `.agents/plans/_template/nested-plans-repo.gitignore.template`

2. **Idempotent check**:
   - If `.agents/plans/.git/` already exists, prints "already initialized" message and exits with code 0 (**no changes made**, including no `.gitignore` refresh)

3. **Setup (only if not already initialized)**:
   - Copies `.gitignore` from the template (single source of truth)
   - Initializes git repository with `git init` inside `.agents/plans/`
   - Creates initial commit containing only `.gitignore` with message: `"Docs: Added nested plans gitignore"`
   - Provides helpful error messages if git user configuration is missing

## Expected Output

### First run (initialization):
```
[INFO] Setting up nested repository in .agents/plans/...
[INFO] Copying .gitignore from template...
[INFO] Initializing git repository...
[INFO] Creating initial commit...
[INFO] Nested repository initialized successfully!
[INFO]
[INFO] Next steps:
[INFO]   - Create a plan folder: .agents/plans/{PLAN_NAME}/
[INFO]   - Start committing plan progress locally inside the nested repo
```

### Subsequent runs (already initialized):
```
[INFO] Nested repository already initialized at .agents/plans/.git
[INFO] No action needed. The nested repo is ready to use.
```

### Error cases:
- Missing `.agents/plans/` directory: Error message with guidance
- Missing template file: Error message indicating required file
- Missing git user config: Helpful instructions for configuring `user.name` and `user.email`

## Side Effects
- Creates `.agents/plans/.git/` (nested git repository metadata)
- Creates `.agents/plans/.gitignore` (nested repo ignore rules)
- Creates a local git commit in the nested repo

## Notes / Gotchas
- Once `.agents/plans/.git/` exists, the **outer repository** will stop traversing into `.agents/plans/`. This is expected for nested repos.
- Ensure the outer repo tracks the shared docs before enabling the nested repo:
  - `.agents/plans/README.md`
  - `.agents/plans/AGENTS.md`
- The nested repo’s `.gitignore` content must come from the template at `.agents/plans/_template/nested-plans-repo.gitignore.template`.
  - Do not maintain a second “authoritative” copy elsewhere.
  - If you need to update an existing nested repo’s `.gitignore`, copy the template manually and commit inside the nested repo as desired.
