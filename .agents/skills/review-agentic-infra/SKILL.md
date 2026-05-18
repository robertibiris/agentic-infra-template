---
name: review-agentic-infra
description: "Review and audit the AI agent infrastructure for a project. This infra skill performs a comprehensive review of context files, skills, and agent infrastructure scripts. Use when you want to audit the agentic setup, check for inconsistencies, verify single-source-of-truth compliance, or ensure infrastructure quality. Triggers on: 'review infrastructure', 'audit agents', 'check agentic setup', 'review agentic infra', 'audit infra', or when someone wants to verify the health of the agent infrastructure."
---

Review and audit the AI agent infrastructure. This includes context files (documentation), skills, and agent infrastructure scripts (code).

**Scope**: Agent infrastructure only (not project code/content)

## Review scope

### Context files to review:
- `AGENTS.md` (root level and in subdirectories if any)
- `.agents/` directory:
  - `context/*.md` — all context files
  - `skills/*/SKILL.md` — all skill definitions
- `.cursor/` directory (if exists):
  - `rules/*.mdc`
- `.github/copilot-instructions.md` (if exists)
- `CLAUDE.md` (if exists)

### Agent infrastructure scripts to review:
- All scripts in `.agents/` directory (any language)
- Scripts that are part of agent workflows/automation

**Out of scope**: Project code files, project documentation (unless agent context), regular project files and content.

## Review process

### Step 1: Inventory agent infrastructure

1. **Identify all context files**: Scan for `AGENTS.md` files, list all `.md` files in `.agents/context/`, check for platform-specific files.
2. **Identify all skills**: List all `SKILL.md` files under `.agents/skills/`.
3. **Identify all scripts**: Find all executable files in `.agents/` directory.

### Step 2: Review context files

For each context file, evaluate against:

1. **Structure & Organization** — follows `agentic-infra-setup.md` patterns, proper directory organization, clear naming, appropriate location.
2. **Content Quality** — complete, clear, actionable, with examples where helpful, correct references.
3. **Consistency** — consistent structure, naming, formatting, and style across files. Correct cross-references.
4. **Best Practices** — single source of truth (no duplication), platform files reference core context, proper separation of concerns, modular design.
5. **Maintainability** — easy to update, clear relationships, portable where applicable, logical structure.

### Step 3: Review skills

For each skill, evaluate:

1. **Frontmatter quality** — name is descriptive, description is substantive and covers triggering contexts.
2. **Instruction clarity** — instructions are clear, actionable, and well-structured.
3. **Completeness** — covers inputs, steps, quality bar, and edge cases.

### Step 4: Review scripts (if any)

For each script, evaluate: efficacy, clarity, modularity, maintainability, scalability, and code quality.

## Output format

Produce a structured review report:

### Section 1: Overview
- Summary of agent infrastructure state
- Files reviewed (context files, skills, scripts)
- High-level assessment, key strengths, key concerns

### Section 2: Context files review
- Structure & organization findings
- Content quality issues
- Consistency issues
- Best practices adherence
- Maintainability assessment
- File-specific recommendations

### Section 3: Skills review
- Frontmatter quality assessment
- Instruction clarity findings
- Completeness assessment
- Skill-specific recommendations

### Section 4: Action items
- **Priority 1 (Critical)**: Must-fix issues
- **Priority 2 (Important)**: Significant improvements
- **Priority 3 (Nice to Have)**: Long-term enhancements
- **Quick Wins**: Easy improvements with high impact

## Guidance

- Be thorough: review all agent infrastructure files systematically.
- Be constructive: provide actionable suggestions, not just criticism.
- Prioritize: focus on most impactful improvements first.
- Reference authority: use `agentic-infra-setup.md` as the guiding document.
- Be specific: provide concrete examples and file references.
- Balance: don't over-engineer, but ensure quality and maintainability.
