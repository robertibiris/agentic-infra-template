# Command: update-status

## Purpose
Change the lifecycle status of a plan or task, capture an optional progress note, and propagate status summaries so parent/child files stay in sync.

## Inputs
- `target` (required) – path or identifier of the plan (`plan`) or task (`plan/task`). If the user does not provide it explicitely, ALWAYS try to infer it first, by assuming the task the user is working on in the current session. If truly unclear, ask the user.
- `new_status` (required) – one of `active`, `paused`, `completed`. If the user does not provide it explicitely, ALWAYS try to infer it first, by assuming the task the user is working on in the current session. If truly unclear, ask the user.
- `progress_note` (optional) – free-form note to append in the Progress Notes section (strongly recommended). Also try to ifer it, since the user typically works with YOU, so you should know what notes wre worthy of adding.

**IMPORTANT NOTE**: If the user does not provide some or any needed inputs explicitely, ALWAYS try to infer them first, by using the context of your interaction with the user in the current session he's having with YOU. If truly unclear, ask the user for any needed information.

## Behavior
1. Resolve the target file:
   - Plans: `.agents/plans/{PLAN_NAME}/plan.md`
   - Tasks: `.agents/plans/{PLAN_NAME}/{TASK_NAME}.md`
2. Update the `status` field and the `updated` timestamp (ISO date).
3. Append the provided progress note (or an automatic default) to the Progress Notes section, ensuring newest entries appear first.
4. If the target is a task:
   - Update the corresponding bullet in the parent plan’s “Tasks” section to reflect the new status summary.
   - If all tasks in the plan are `completed`, log a note recommending plan completion.
5. If the target is a plan and the new status is `completed`, verify all tasks already show `completed` and warn if not.

## Side Effects
- Mutates the target file and, for tasks, the parent plan file.
- Produces console output summarizing the change and suggesting next steps (e.g., “Run whats-next to see remaining actions”).

## Notes
- Never remove historical notes; always prepend the newest entry.
- Status transitions should be idempotent—setting the same status twice should simply append a note if provided.
