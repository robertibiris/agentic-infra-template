# Command: setup-agentic-context

## Purpose
Set up the agentic infrastructure in a new repository: create the required files/folders (root `AGENTS.md`, `.agents/`, templates, and optional platform integrations like `.cursor/`) so AI agents and developers share a consistent, portable workflow.

> Note: The repository terminology has evolved from “agentic context” to “agentic infrastructure”. This command name is kept for compatibility, but the authoritative setup reference is `.agents/context/agentic-infra-setup.md`.

## Inputs
None.

## Implementation

**Source of truth**: Follow the step-by-step setup guide in:
- `.agents/context/agentic-infra-setup.md`

This command document exists so platform integrations (e.g. Cursor commands) can reference a stable, single location under `.agents/commands/`.

## Usage

1. Open `.agents/context/agentic-infra-setup.md`
2. Answer the pre-setup questions and follow the setup steps for your chosen platforms (Cursor/Copilot/Claude/etc.)
3. Ensure platform-specific files **reference** `AGENTS.md` and do not duplicate content.

## Expected Outcomes
- `AGENTS.md` exists at the project root and acts as the single source of truth.
- `.agents/` contains modular context, commands, and plan templates.
- Platform-specific files exist only as thin references to `.agents/` sources of truth.

## Side Effects
- Creates and/or updates documentation files and directories as described in the setup guide.

