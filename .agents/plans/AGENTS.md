# Nested Repository for Plans Directory

## Overview

This directory (`.agents/plans/`) contains a **nested git repository** that tracks plan files locally without committing them to the main project repository. This structure allows developers to version control their plans independently while keeping the main repository clean.

## Repository Structure

### Main Repository Tracks
The main project repository tracks shared infrastructure files:
- `README.md` - Documentation for the plans directory structure
- `AGENTS.md` - Documentation for the plans directory nested-repo workflow
- `_template/` - Template files for creating new plans and tasks (shared across all developers)

### Nested Repository Tracks
This nested repository tracks developer-specific plan files:
- `{PLAN_NAME}/` directories - Each plan lives in its own folder
  - `plan.md` - Plan metadata, objectives, requirements, steps, tasks summary, and progress log
  - `{TASK_NAME}.md` - Task files with metadata, steps, outputs, dependencies, and progress notes

## Why This Structure?

Plans are developer-specific work that doesn't need to be shared in the main repository. By using a nested repository:
- Developers can commit and track their plan progress locally
- The main repository stays clean and focused on shared infrastructure
- Each developer maintains their own plan history independently
- No conflicts or merge issues with plan files in the main repo

## How Agents Should Interact

1. **For general agentic infrastructure guidance**: Refer to the main repository's `AGENTS.md` file at the project root (`../../AGENTS.md`)

2. **For plan-specific operations**: Work within this nested repository structure:
   - Plans are tracked by this nested repo, not the main repo
   - Use standard git commands within this directory to commit plan changes
   - Use the `setup-nested-plans-repo` skill to initialize the nested repo
   - The nested repo’s `.gitignore` is generated from the single source of truth template:
     - `.agents/plans/_template/nested-plans-repo.gitignore.template`
   - The `.gitignore` in this nested repo ignores files tracked by the main repo (`README.md`, `AGENTS.md`, `_template/`)

3. **When creating plans**:
   - Use templates from `_template/` directory (tracked by main repo)
   - Create new plan directories that will be tracked by this nested repo
   - Follow the same structure and conventions documented in the main `AGENTS.md`

4. **File tracking**:
   - Files ignored by this nested repo's `.gitignore` are tracked by the main repo
   - Files tracked by this nested repo are ignored by the main repo's `.gitignore`
   - This separation prevents conflicts and keeps responsibilities clear

## Reference

For complete agentic infrastructure documentation, see the main repository's `AGENTS.md` file, which contains:
- Tracked plans and tasks overview
- Skills index
- Workflow guidance
- Assistant behavior requirements
