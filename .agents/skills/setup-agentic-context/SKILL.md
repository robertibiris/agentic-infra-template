---
name: setup-agentic-context
description: "Set up the agentic infrastructure in a new repository: create the required files and folders (root AGENTS.md, .agents/, templates, and optional platform integrations) so AI agents and developers share a consistent, portable workflow. This is an infra skill for bootstrapping a new project or repo. Triggers on: 'setup agents', 'bootstrap infrastructure', 'set up agentic context', 'initialize agent infrastructure', 'set up infra', or when starting a new project that needs agent context."
---

Set up the agentic infrastructure in a new repository.

> Note: The terminology has evolved from "agentic context" to "agentic infrastructure." This skill name is kept for compatibility.

## Inputs

None.

## Implementation

**Source of truth**: Follow the step-by-step setup guide in `.agents/context/agentic-infra-setup.md`.

## Usage

1. Open `.agents/context/agentic-infra-setup.md`.
2. Answer the pre-setup questions and follow the setup steps for your chosen platforms (Cursor/Copilot/Claude/etc.).
3. Ensure platform-specific files **reference** `AGENTS.md` and do not duplicate content.

## Expected outcomes

- `AGENTS.md` exists at the project root and acts as the single source of truth.
- `.agents/` contains modular shared context and skills.
- `.agents/local/` exists with its README and outer-tracked `context/`, `skills/`, and `plans/` placeholders.
- Developer-owned local content is ignored by the outer repository and may optionally be versioned through `setup-local-repo`.
- Tracked plans live under `.agents/local/plans/`; their templates remain with the shared skills that consume them.
- Platform-specific skill directories are symlinked to `.agents/skills/` for single source of truth.

## Side effects

- Creates and/or updates documentation files and directories as described in the setup guide.
