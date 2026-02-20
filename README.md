# Agentic Project Template

**AI coding assistants work best when they understand your project.** But each session often starts from scratch—you repeat context, paste snippets, and hope the agent remembers. This template fixes that.

It gives you a **shared, structured context** that both humans and AI agents read from—so everyone works from the same understanding.

---

## In 30 Seconds

A project template that gives AI coding assistants (and humans) a shared context so they can work effectively without re-explaining the project every time. Use it as a starting point for any new project where you want Cursor, GitHub Copilot, Claude, or similar tools to "get" your structure, conventions, and workflow from day one.

---

## The Idea in Practice

Imagine: You clone a repo. You open Cursor. The AI already knows your folder structure, your conventions, and what you're actively working on. No copy-pasting. No re-explaining. It's like onboarding a new teammate who's already read the docs.

**Without this template:**
- New session → paste context → agent forgets → repeat

**With this template:**
- New session → agent reads `AGENTS.md` and `.agents/` → picks up where you left off

---

## Key Benefits

**One source of truth, many agents.** You might use Cursor today, Claude tomorrow, and Copilot in another project. Instead of maintaining separate instructions for each, you keep a single context—`AGENTS.md` and `.agents/`—that every tool reads from. Same structure, same conventions, no drift.

**Collaboration without chaos.** Shared context means everyone on the project—humans and AI—works from the same understanding. At the same time, each person can have their own plans and progress. The nested repo lets you version-control your plans locally without cluttering the main repo or stepping on teammates' work. Shared context for the team, personal context for you, and they don't collide.

**Complex work across many sessions.** Some initiatives take days or weeks and span dozens of agent sessions. Agents forget between sessions; plans and progress notes don't. You document what you're doing, where you left off, and what's next. When you resume, you (or any agent) run `whats-next` and pick up exactly where you were.

---

## What You Get

- **Shared context** — `AGENTS.md` as the single source of truth; `.agents/` for modular, detailed guidance
- **Plans & tasks** — Structured way to track initiatives and executable units with status and progress notes
- **Platform support** — Works with Cursor, GitHub Copilot, Claude; each platform references the same context
- **Optional nested repo** — Version-control your plans locally without committing them to the main project

---

## Project Structure

```
project-root/
├── AGENTS.md                    # Single source of truth (customize for your project)
├── .agents/
│   ├── context/                 # Setup and reference docs
│   ├── commands/                # Command definitions (create-plan, whats-next, etc.)
│   ├── plans/                   # Plans and tasks (each plan in its own folder)
│   │   ├── _template/           # Templates for new plans and tasks
│   │   ├── README.md            # Documentation for the plans directory
│   │   └── {PLAN_NAME}/         # Your plans go here
│   └── scripts/                 # Setup scripts
├── .cursor/
│   └── rules/                   # Cursor project rules (references AGENTS.md)
└── .github/
    └── copilot-instructions.md  # GitHub Copilot (optional, references AGENTS.md)
```

---

## Quick Start

### 1. Use This Template

Clone or use this repo as a template for your new project:

```bash
git clone <this-repo-url> my-project
cd my-project
```

### 2. Customize

- **Edit `AGENTS.md`** — Replace the stub content with your project's overview, structure, conventions, and workflow. This is the main file agents read.
- **Add platform files** — If you use Cursor, ensure `.cursor/rules/` references `AGENTS.md`. For Copilot or Claude, add `.github/copilot-instructions.md` or `CLAUDE.md` that point to the same source.

### 3. Optional: Set Up Plans Version Control

If you want to track your plans and tasks with git (without committing them to the main repo), run:

```bash
bash .agents/scripts/setup_nested_plans_repo.sh
```

This creates a nested git repository in `.agents/plans/` so you can commit plan progress locally.

### 4. Full Setup Guide

For detailed setup, platform-specific options, and best practices, see [`.agents/context/agentic-infra-setup.md`](.agents/context/agentic-infra-setup.md).

---

## How to Use It

### Resuming Work

Run `whats-next` (or its equivalent) to see the next actionable steps across all active plans. It scans your plans, finds active tasks, and tells you what to do next.

### Creating Work

- **Create a plan** — Use `create-plan` to scaffold a new plan directory and `plan.md` with objectives, requirements, and steps.
- **Create tasks** — Use `create-task` to add executable units under a plan.

### Tracking Progress

- **Update status** — Use `update-status` to change a plan or task status (`pending`, `active`, `paused`, `completed`) and append progress notes.
- **Progress notes** — Keep them reverse-chronological so the latest updates appear first.

### Command Reference

| Command | Purpose |
|---------|---------|
| `whats-next` | Find next actionable steps across active plans |
| `create-plan` | Scaffold a new plan directory and `plan.md` |
| `create-task` | Add a task file under an existing plan |
| `update-status` | Change status and append progress notes |
| `setup-nested-plans-repo` | Initialize nested git repo for plans |
| `setup-agentic-context` | Bootstrap agentic infrastructure in a new repo |
| `review-agentic-infra` | Audit agent infrastructure |

Command definitions live in [`.agents/commands/`](.agents/commands/). Reference them from your editor (e.g. Cursor commands) so you keep a single source of truth.

---

## Platform Support

| Platform | File(s) | Notes |
|----------|---------|-------|
| **Cursor** | `.cursor/rules/*.mdc` | Reference `AGENTS.md`; don't duplicate content |
| **GitHub Copilot** | `.github/copilot-instructions.md` | Reference `AGENTS.md`; add Copilot-specific instructions only |
| **Claude** | `CLAUDE.md` | Reference `AGENTS.md`; add Claude-specific instructions only |

---

## Best Practices

- **Keep `AGENTS.md` concise** — Put detailed information in `.agents/` files.
- **Run `whats-next` when resuming work** — It surfaces the next actionable steps so you can pick up where you left off.
- **Use the nested plans repo** — If you want local version control for your plans, run the setup script so each developer can track their own plan history.
- **Avoid duplication** — Platform-specific files should reference `AGENTS.md` and `.agents/`, not repeat their content.

---

## Further Reading

- [`.agents/context/agentic-infra-setup.md`](.agents/context/agentic-infra-setup.md) — Full setup guide and best practices
- [AGENTS.md](AGENTS.md) — Master reference for plans, tasks, commands, and workflow
- [AGENTS.md pattern](https://agents.md/) — Official documentation for the AGENTS.md pattern
- [Cursor Project Rules](https://cursor.com/docs/context/rules) — Cursor project rules documentation
