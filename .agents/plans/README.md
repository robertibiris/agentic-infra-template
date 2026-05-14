# Plans Directory

Every plan lives in its own folder: `.agents/plans/{PLAN_NAME}/`.

Each folder must contain:
1. `plan.md` – the plan metadata plus sections for Objective, Requirements, Steps, Tasks, and Progress Notes.
2. One file per task (`{TASK_NAME}.md`) following the task template.

## Usage
1. Run `create-plan` to scaffold a new plan directory and initial `plan.md`.
2. Run `create-task` for each executable unit; this creates `{TASK_NAME}.md` and updates the parent plan.
3. Use `update-status` to track lifecycle changes and append progress notes.
4. Run `whats-next` whenever you resume work; the command derives next actions by reading these files.

Refer to the `_template` directory for ready-to-copy plan and task files.

## Learnings
- Each plan can optionally include a `learnings.md` file for non-obvious insights discovered during execution.
- `_learnings/` stores cross-cutting reference docs not tied to one plan (topic-named, for example `content-ingestion-patterns.md`).
- If a feature produces learnings but has no plan yet, create a minimal plan folder so `learnings.md` follows the same convention.
- Use `create-learning` for interactive learnings creation.
- Use `_template/learnings.md` as the standard structure for learnings files.

## Nested Repository Setup (Optional)

To enable local version control of your plans without committing them to the main repository, you can set up a nested git repository in this directory. This is recommended because:

- Plans are developer-specific and ignored by the main repository
- You can track your plan progress locally with git commits
- Each developer maintains independent plan history
- No conflicts with the main repository

**To set up**: Run the `setup-nested-plans-repo` command or see `.agents/commands/setup-nested-plans-repo.md` for detailed instructions and copy-pasteable commands.

### Single source of truth for the nested `.gitignore`
The nested repository’s `.gitignore` content must come from the tracked template:
- `.agents/plans/_template/nested-plans-repo.gitignore.template`

Do not manually maintain a second “authoritative” `.gitignore` copy elsewhere.
