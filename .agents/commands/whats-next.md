# Command: whats-next

## Purpose
Surface the next actionable steps across every active plan so work can resume without ambiguity.

## Behavior
1. Scan `.agents/plans/*/plan.md`, skipping directories marked `completed`.
   - Be wise, you don't need to read ALL the contents in the `plan.md` files, since you only need the line about the status, which you can fetch via some terminal command(s).
2. For each active plan:
   - Parse the “Tasks” list and open each referenced task file.
   - Identify tasks with `status` `active` or `paused`; if none exist, flag that new tasks are required.
   - Determine the highest-priority actionable step (e.g., first `active` task with incomplete steps).
3. Produce a summary report:
   - Plan name, priority, and status.
   - Next task name with a short derived hint (e.g., first bullet from “Steps to Complete”).
   - Highlight blockers, dependencies, or missing metadata.
4. If no plans are active, explicitly recommend running `create-plan`.

## Output Format
```
Plan: {PLAN_NAME} (priority {priority})
- Next task: {TASK_NAME} — {status}
- Suggested action: {short step or reminder}
```

## Notes
- Ensure reverse-chronological progress notes remain untouched; this command is read-only.
- The summary should be concise to fit a terminal view.
