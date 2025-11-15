# Command: create-task

## Purpose
Add a task file under an existing plan, populate it from the Task File Template, and insert a reference in the parent plan’s “Tasks” list.

## Inputs
- `plan_name` (required) – target plan directory under `.agents/plans/`.
- `task_name` (required) – filename (without extension) used for `{TASK_NAME}.md`.
- `purpose` (required) – short description inserted into the “Purpose” section of the task file.

## Behavior
1. Validate that `.agents/plans/{PLAN_NAME}` exists and that `.agents/plans/{PLAN_NAME}/{TASK_NAME}.md` does not; abort if either check fails.
2. Generate the task file using the Task Template (templates found at `.agents/plans/_template`):
   - Set `belongs_to_plan` to the parent plan name.
   - Initialize `status: active`.
   - Populate `created` and `updated` fields with the current ISO date.
   - Insert the provided `purpose`
   - IMPORTANT: Add the actual information relevant to describe the task in the resulting file, as you see fit, respecting markdown format and the template.
3. Append an entry to the parent `plan.md` “Tasks” section in the format `- {TASK_NAME}.md — {status summary}`.
4. Update the parent plan’s `updated` timestamp and progress notes to reflect the new task.

## Side Effects
- Modifies both the task file (new) and the parent `plan.md`.
- Emits guidance reminding the user to maintain reverse-chronological progress notes.

## Notes
- Task filenames should remain ASCII and use dashes or underscores for readability.
- If the plan has no prior tasks, replace the placeholder line with the first real entry.
