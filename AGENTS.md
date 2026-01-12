# 🤖 Agentic Context

This is a stub template file used to setup new 
projects with a common agentic infrastructure. When 
setting up the project, fill out any void sections 
with the details of the REAL project.

## Plans Overview

- **Plan**: A bounded initiative documented in `plan.md` under `.agents/plans/{PLAN_NAME}`. Plans contain the intent, requirements, high-level steps, links to their tasks, and a reverse-chronological progress log.
- **Task**: An executable unit inside the same plan folder (`{TASK_NAME}.md`). Tasks reference their parent plan, list concrete steps, outputs, dependencies, and track progress notes the same way plans do.
- **Status**: `pending`, `active`, `paused`, or `completed`. Status is stored in each file’s front-matter block and is updated whenever work is waiting to be picked up (`pending`), currently in progress (`active`), temporarily halted (`paused`), or done (`completed`).
- **Progress notes**: Appended in reverse chronological order every time a material update happens (new insight, partial delivery, blockers, etc.).
- **Workflow**: Create or select a plan, decompose into tasks, execute tasks incrementally, append notes, and keep statuses accurate so that automation can determine “what’s next.”

## Agentic Infrastructure Description

- `AGENTS.md` (this file) is the master reference. It never lists active plans; instead it documents how to use the system.
- `.agents/` stores all structured context:
  - `.agents/context/agentic-infra-setup.md` provides the detailed reference for setting up and auditing the agentic infrastructure. Consult it when cloning this template or when auditing an existing repo.
  - `.agents/commands/` holds command definitions. Each command describes its inputs, behavior, and expected side effects. REFERENCE (DON'T duplicate) these commands inside `.cursor/commands/` so editors can invoke them (thus keeping a single source of truth for the actual command contents).
  - `.agents/plans/` groups every plan by name. Each plan directory contains:
    - `plan.md` – metadata, objectives, requirements, steps, tasks summary, and progress log.
    - `{TASK_NAME}.md` – one file per task with metadata, steps, outputs, dependencies, and progress notes.
    - **Nested Repository (Optional)**: It's recommended to set up a nested git repository in `.agents/plans/` for local version control of plans. Since plans are ignored by the main repository, a nested repo allows developers to track plan progress independently. See `.agents/commands/setup-nested-plans-repo.md` for setup instructions.
- Plans and tasks must not be merged together; every concern has its own file. Metadata, timestamps, and note ordering must stay consistent across the hierarchy.

## Command Index

- **`.agents/commands/review-agentic-infra.md`** - 
Command to review and audit agent infrastructure
- **`.agents/commands/setup-agentic-context.md`** – bootstrap the agentic infrastructure in a new repo (authoritative setup guide: `.agents/context/agentic-infra-setup.md`).
- **`.agents/commands/create-plan.md`** – scaffold a new plan directory and generate `plan.md` from the template.
- **`.agents/commands/create-task.md`** – add a task file under an existing plan and append the task entry in that plan's "Tasks" section.
- **`.agents/commands/update-status.md`** – change the status of a plan or task, append an optional progress note, and propagate task status summaries back to `plan.md`.
- **`.agents/commands/whats-next.md`** – scan all plan directories, find active items, determine the next actionable steps, and report them. Run this command whenever you resume work.
- **`.agents/commands/setup-nested-plans-repo.md`** – initialize a nested git repository in `.agents/plans/` for local version control of plans. Recommended if you want to track plan progress independently without committing to the main repository.

## Guidance for Resuming Work

1. Run `whats-next` to list every active plan and its next actionable task.
2. Open the indicated `plan.md` or `{TASK_NAME}.md` file.
3. Review the latest progress notes (remember they are reverse chronological).
4. Continue execution, update steps or requirements if needed, and append a new progress entry with timestamps before pausing or completing the work.

## Assistant Behavior Requirements

- Enforce the directory, file, and naming structure exactly as documented.
- Keep each plan and task in its own file; never co-mingle scopes or duplicate metadata.
- Whenever interacting with a plan or task, summarize the current state and propose the next logical step before making changes.
- Suggest creating a task whenever a plan’s step grows complex or ambiguous.
- Maintain timestamps, status fields, and reverse-chronological progress notes with every update.
- Record all dates/times using the local system timezone (currently CET as reported by `date`) and include hour/minute stamps (`YYYY-MM-DD HH:MM TZ`) so metadata and progress notes remain consistent without manual adjustments.
- Surface any missing metadata or structural inconsistencies and fix them before proceeding.
- After completing or pausing work, always recommend running `whats-next` so future sessions can resume seamlessly.

