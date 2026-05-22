# Agentic Infrastructure Setup Guide

A step-by-step guide for setting up AI agent infrastructure in any project, in a platform-agnostic manner (Cursor, Claude Code, Copilot, etc.).

---

## System Overview

The agentic infrastructure gives AI agents and humans a shared, structured context so they can work effectively across sessions and platforms. The system has three layers: context (what the project is), skills (what agents can do), and plans (what's being worked on).

```
project-root/
├── AGENTS.md                        # Single source of truth (REQUIRED)
├── .agents/                         # Structured context, skills, and plans (REQUIRED)
│   ├── context/                     # Reference docs
│   │   ├── agentic-infra-setup.md   # This file
│   │   └── [domain-specific].md     # Additional context as needed
│   ├── skills/                      # Skill definitions (single source of truth)
│   │   ├── create-plan/SKILL.md
│   │   ├── create-task/SKILL.md
│   │   ├── update-plan/SKILL.md
│   │   ├── whats-next/SKILL.md
│   │   ├── create-learning/SKILL.md
│   │   ├── setup-agentic-context/SKILL.md
│   │   ├── setup-nested-plans-repo/SKILL.md
│   │   └── review-agentic-infra/SKILL.md
│   └── plans/                       # Tracked plans and tasks
│       ├── _template/               # Templates for plans, tasks, learnings
│       └── {PLAN_NAME}/             # One directory per plan
├── CLAUDE.md                        # Claude integration (OPTIONAL)
├── .claude/
│   └── skills/                      # Symlink → ../.agents/skills (OPTIONAL)
├── .cursor/
│   ├── skills/                      # Symlink → ../.agents/skills (OPTIONAL)
│   └── rules/                       # Cursor project rules (OPTIONAL)
└── .github/
    └── copilot-instructions.md      # GitHub Copilot integration (OPTIONAL)
```

---

## Core Components

### AGENTS.md (Required)

The single source of truth for project context. Lives at the project root. Contains the tracked plans overview, key terminology, infrastructure description, skills index, resuming guidance, and assistant behavior requirements.

Based on the [AGENTS.md pattern](https://agents.md/). Additional `AGENTS.md` files can be placed in subdirectories for folder-specific context, but the root-level file is mandatory.

### .agents/ Directory (Required)

Houses all structured context, organized into three areas:

**`context/`** — Reference documentation. This setup guide lives here. Add domain-specific context files as your project grows (e.g., `architecture.md`, `commit-guidelines.md`). Keep context files inside this subdirectory, not at the `.agents/` root level.

**`skills/`** — Skill definitions. Each skill is a directory containing a `SKILL.md` file with YAML frontmatter:

```markdown
---
name: skill-name
description: "What the skill does, when to use it, trigger phrases. This is the
  primary triggering mechanism — it must be thorough enough that the agent
  recognizes when to use it from natural language."
---

[Skill instructions — inputs, behavior, side effects, notes]
```

The template ships with 8 infra skills for plan management, setup, and auditing. Project-specific skills (e.g., deployment, testing) can be added alongside them.

**`plans/`** — Tracked plans and tasks. Each plan is a directory containing `plan.md` and numbered task files (`{NN}-{TASK_NAME}.md`). Templates live in `_template/`. Plans are typically git-ignored by the main repo and optionally tracked by a nested git repository (see the `setup-nested-plans-repo` skill).

---

## Platform Integration

Platform-specific directories use **symlinks** to `.agents/skills/` so all platforms read skill definitions from a single source of truth.

### Cursor

```bash
mkdir -p .cursor
ln -s ../.agents/skills .cursor/skills
```

Optionally add `.cursor/rules/*.mdc` for Cursor-specific project rules. Rules should reference `AGENTS.md`, not duplicate its content.

### Claude

```bash
echo "@AGENTS.md" > CLAUDE.md
mkdir -p .claude
ln -s ../.agents/skills .claude/skills
```

`CLAUDE.md` uses the `@`-reference syntax to include `AGENTS.md`. Only add Claude-specific content if truly platform-specific.

Reference: [Claude Code Best Practices](https://www.anthropic.com/engineering/claude-code-best-practices)

### GitHub Copilot

```bash
mkdir -p .github
# Create .github/copilot-instructions.md referencing AGENTS.md
```

Reference: [GitHub Copilot Custom Instructions](https://docs.github.com/en/copilot/how-tos/configure-custom-instructions/add-repository-instructions)

---

## Step-by-Step Setup

### Step 1: Create AGENTS.md

Create `AGENTS.md` at the project root. Use this template's own `AGENTS.md` as a starting point — replace the stub content with your project's overview, structure, conventions, and workflow. The key sections to fill in are:

- **Tracked Plans Overview** — keep as-is unless you modify the plans system
- **Agentic Infrastructure Description** — update the `.agents/context/` references for your project's context files
- **Skills Index** — add any project-specific skills alongside the infra skills
- **Assistant Behavior Requirements** — add project-specific rules as needed

### Step 2: Set up .agents/ directory

```bash
mkdir -p .agents/context .agents/skills .agents/plans/_template
```

Copy or adapt the template's skill definitions and plan templates. If starting from this template project, these are already in place.

### Step 3: Add context files

Create context files inside `.agents/context/` for your project's specific needs. Examples: `architecture.md`, `commit-guidelines.md`, `api-conventions.md`. Each file should cover one topic and be referenced from `AGENTS.md`.

### Step 4: Set up platform integrations

Based on which AI platforms you use, create the appropriate symlinks and config files (see the Platform Integration section above).

### Step 5: Configure .gitignore

Plans are typically developer-specific and should be git-ignored. The template's `.gitignore` already handles this:

```gitignore
# Ignore plans (developer-specific), but keep shared infrastructure
.agents/plans/*
!.agents/plans/README.md
!.agents/plans/AGENTS.md
!.agents/plans/_template
!.agents/plans/_template/
!.agents/plans/_template/**
```

### Step 6: Optional — set up nested plans repo

If you want local version control for your plans:

```bash
bash .agents/skills/setup-nested-plans-repo/scripts/setup_nested_plans_repo.sh
```

This creates a nested git repository in `.agents/plans/` so you can commit plan progress independently.

### Step 7: Verify

- [ ] `AGENTS.md` exists at project root with project-specific content
- [ ] `.agents/context/` contains this setup guide and any project context files
- [ ] `.agents/skills/` contains skill directories with `SKILL.md` files
- [ ] `.agents/plans/_template/` contains plan and task templates
- [ ] Platform symlinks resolve correctly (e.g., `ls .claude/skills/` shows skills)
- [ ] `CLAUDE.md` or equivalent platform file references `AGENTS.md`
- [ ] No information is duplicated between platform files and `AGENTS.md`

---

## Best Practices

**Single source of truth** — `AGENTS.md` is the master reference. Platform files and context docs should reference it, not duplicate it.

**Modular context** — Keep `AGENTS.md` concise. Detailed guidance belongs in `.agents/context/` files. Each context file should cover one topic.

**Skills over prose** — When agents need to perform a repeatable action, define it as a skill with clear inputs, behavior, and side effects. This is more reliable than embedding instructions in context files.

**Platform separation** — Platform-specific files (`.cursor/rules/`, `CLAUDE.md`) should only contain truly platform-specific instructions. Everything else goes in `.agents/`.

**Regular audits** — Use the `review-agentic-infra` skill periodically to check for inconsistencies, stale references, and structural issues.
