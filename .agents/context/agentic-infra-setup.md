# Agentic Infrastructure Setup Guide

A platform-agnostic guide for giving AI agents and developers shared project context, repeatable skills, and a private local workspace.

## System Overview

The infrastructure separates shared project knowledge from developer-owned working state:

```text
project-root/
├── AGENTS.md                         # Shared source of truth
├── .agents/
│   ├── context/                      # Shared reference documentation
│   │   └── agentic-infra-setup.md
│   ├── skills/                       # Shared skills and skill-owned templates
│   │   ├── create-plan/
│   │   │   ├── SKILL.md
│   │   │   └── templates/plan.md
│   │   ├── create-task/
│   │   │   ├── SKILL.md
│   │   │   └── templates/task.md
│   │   ├── create-learning/
│   │   │   ├── SKILL.md
│   │   │   └── templates/learnings.md
│   │   ├── setup-local-repo/
│   │   │   ├── SKILL.md
│   │   │   ├── scripts/
│   │   │   └── templates/local-repo.gitignore.template
│   │   └── [other skills]/
│   └── local/                        # Developer-owned content
│       ├── README.md                 # Shared purpose and privacy guidance
│       ├── context/.gitkeep          # Personal or machine-specific context
│       ├── skills/.gitkeep           # Personal or experimental skills
│       └── plans/.gitkeep            # Tracked plans, tasks, and learnings
├── CLAUDE.md                         # Optional platform reference
├── .claude/skills -> ../.agents/skills
├── .cursor/skills -> ../.agents/skills
└── .github/copilot-instructions.md   # Optional platform reference
```

## Core Components

### `AGENTS.md`

The root source of truth for project context, tracked-plan conventions, the skill index, workflow guidance, and assistant behavior. Subdirectory `AGENTS.md` files may add narrower instructions, but they must not duplicate or contradict the root.

### `.agents/context/`

Shared, topic-focused reference documentation such as architecture, testing conventions, or commit guidance. Keep detailed material here and link to it from `AGENTS.md`.

### `.agents/skills/`

Shared repeatable workflows. Every skill has a `SKILL.md` with YAML frontmatter and actionable instructions. Templates used by one skill live in that skill's `templates/` directory; deterministic implementations live in its `scripts/` directory.

### `.agents/local/`

The local directory is the developer-owned boundary. Use it for material that helps one developer or machine but should not enter the main repository:

- `context/` for personal preferences, private notes, and machine-specific guidance.
- `skills/` for personal or experimental skills not ready to be shared.
- `plans/` for tracked plans, tasks, progress notes, and learnings.
- Other scratch files or local workflow state as needed.

The outer repository tracks only `.agents/local/README.md` and the three `.gitkeep` placeholders. All other content is ignored. The directory may optionally contain its own nested Git repository, initialized by `setup-local-repo`, so local work can have independent history.

`.agents/local/` is private by convention, not a secrets vault. Use a secret manager for credentials and production secrets.

### Tracked Plans

Tracked plans live only at `.agents/local/plans/{PLAN_NAME}/`. Each plan contains `plan.md`, numbered task files, and optionally `learnings.md`. Cross-cutting learnings live at `.agents/local/plans/_learnings/`.

Plan templates do not live in the local repository. They are shared, skill-owned infrastructure:

- `.agents/skills/create-plan/templates/plan.md`
- `.agents/skills/create-task/templates/task.md`
- `.agents/skills/create-learning/templates/learnings.md`

## Platform Integration

Platform directories should reference shared sources rather than duplicate them.

### Cursor

```bash
mkdir -p .cursor
ln -s ../.agents/skills .cursor/skills
```

Optional `.cursor/rules/*.mdc` files should contain only Cursor-specific guidance.

### Claude

```bash
printf '@AGENTS.md\n' > CLAUDE.md
mkdir -p .claude
ln -s ../.agents/skills .claude/skills
```

### GitHub Copilot

Create `.github/copilot-instructions.md` and point it to `AGENTS.md`. Add only Copilot-specific instructions there.

## Step-by-Step Setup

### Step 1: Customize `AGENTS.md`

Replace the stub project description and add project-specific structure, conventions, context links, skills, and behavioral requirements. Keep the tracked-plan and local-directory contracts unless intentionally changing the infrastructure.

### Step 2: Create Shared Infrastructure

```bash
mkdir -p .agents/context .agents/skills
mkdir -p .agents/local/context .agents/local/skills .agents/local/plans
```

Add `.agents/local/README.md` and the three outer-tracked `.gitkeep` files. Copy or adapt the shared skills and their templates.

### Step 3: Configure the Outer `.gitignore`

```gitignore
# Ignore developer-owned local content while preserving shared scaffolding
.agents/local/*
!.agents/local/README.md
!.agents/local/context/
.agents/local/context/*
!.agents/local/context/.gitkeep
!.agents/local/skills/
.agents/local/skills/*
!.agents/local/skills/.gitkeep
!.agents/local/plans/
.agents/local/plans/*
!.agents/local/plans/.gitkeep
```

These rules keep private content out of the outer repository while allowing the starter structure to ship with the project.

### Step 4: Add Shared Context

Create one focused file per topic under `.agents/context/` and reference it from `AGENTS.md`.

### Step 5: Add Platform Integrations

Create only the symlinks and reference files required by the platforms the project uses. Verify that every symlink resolves to `.agents/skills/`.

### Step 6: Optional Local Repository

For a fresh installation:

```bash
bash .agents/skills/setup-local-repo/scripts/setup_local_repo.sh
```

For a project upgrading from the former plan-specific nested repository:

```bash
bash .agents/skills/setup-local-repo/scripts/migrate_legacy_plans_repo.sh
```

The migration preserves the original Git history and moves plans beneath `.agents/local/plans/`. Review its safety snapshot and staged changes before committing.

### Step 7: Verify

- [ ] `AGENTS.md` describes the actual project and local-directory contract.
- [ ] `.agents/context/` contains focused shared reference files.
- [ ] Every shared skill has a clear `SKILL.md`; skill-specific templates live with their skill.
- [ ] `.agents/local/README.md` explains purpose, privacy, ownership, and optional version control.
- [ ] `context/`, `skills/`, and `plans/` placeholders are outer-tracked while representative local files are outer-ignored.
- [ ] Plan workflows read and write only `.agents/local/plans/`.
- [ ] `setup-local-repo` is idempotent and its generated `.gitignore` matches its template.
- [ ] Platform symlinks resolve to `.agents/skills/` and platform files do not duplicate shared guidance.
- [ ] Active infrastructure has no references to the former plan-specific root or setup skill.

## Best Practices

**Single source of truth** — Keep project-wide instructions in `AGENTS.md`, detailed shared guidance in `.agents/context/`, and repeatable operations in skills.

**Clear ownership** — Shared, portable material belongs in outer-tracked infrastructure. Developer-specific material belongs in `.agents/local/`.

**Skill-owned assets** — Keep templates and deterministic scripts with the skill that consumes them.

**Local privacy** — Review local content before sharing its nested repository. Store real secrets elsewhere.

**Regular audits** — Use `review-agentic-infra` to catch broken references, duplicated instructions, unsafe ignore rules, and path drift.
