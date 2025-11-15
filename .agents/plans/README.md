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

