# Command: create-plan

## Purpose
Scaffold a new plan directory and initialize `plan.md` from the template so work can be tracked consistently.

## Inputs
- `plan_name` (required) – slug/cased name that becomes the folder under `.agents/plans/`.
- `objective` (required) – short description of the plan’s intent; inserted into the template’s Objective section.
- `priority` (optional, default `medium`) – stored in the plan metadata.

## Behavior
1. Confirm the target directory `.agents/plans/{PLAN_NAME}` does not already exist; abort with guidance if it does.
2. Create the directory and write `plan.md` using the Plan File Template (templates can be found at `.agents/plans/_template`):
   - Set `status: active`.
   - Populate `priority`, `created`, and `updated` using the canonical timestamp format: `YYYY-MM-DD HH:MM TZ`.
   - Insert the provided `objective` text
   - IMPORTANT: Add the actual information relevant to describe the task in the resulting file, as you see fit, respecting markdown format and the template.
3. Append an entry to the “Tasks” section containing a placeholder such as “(no tasks yet)” so the plan renders validly until tasks are added.
4. Add an initial progress note documenting that the plan was created via the command.

## Side Effects
- Creates directories/files under `.agents/plans/{PLAN_NAME}/`.
- Emits console output that references next steps (e.g., “Run `create-task` to add your first task”).

## Notes
- Always use reverse-chronological ordering when writing the initial progress entry.
- If priority is omitted, default to `medium` to keep metadata consistent.
