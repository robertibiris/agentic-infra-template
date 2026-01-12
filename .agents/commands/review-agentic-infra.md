# Review Agentic Infrastructure Command

Review and audit the AI agent infrastructure for a project. This includes context files (documentation) and agent infrastructure scripts (code).

## Command Purpose

This command instructs the AI agent to perform a comprehensive review of the agentic setup infrastructure. The review focuses exclusively on files and components that are part of the AI agent infrastructure, following the philosophy outlined in `.agents/context/agentic-infra-setup.md`.

**Scope**: Agent infrastructure only (not project code/content)

## Review Scope

### Context Files (Documentation) to Review:
- `AGENTS.md` (root level and in subdirectories if any)
- `.agents/` directory:
  - `context/agentic-infra-setup.md`
  - `commands/*.md`
  - Any other `.md` context files
- `.cursor/` directory:
  - `commands/*.md`
  - `rules/*.mdc`
- `.github/copilot-instructions.md` (if exists)
- `CLAUDE.md` (if exists)

### Agent Infrastructure Scripts (Code) to Review:
- All scripts in `.agents/` directory (any language: `.py`, `.sh`, `.js`, `.ts`, etc.)
- Scripts that are part of agent workflows/automation
- Scripts meant for AI agent to execute

**Note**: Only scripts located in `.agents/` directory are considered agent infrastructure. Scripts elsewhere are out of scope unless explicitly part of agent workflows.

### Out of Scope:
- Project code files (unless they're agent-facing scripts in `.agents/`)
- Project documentation (unless it's agent context)
- Regular project files and content

## Review Process

### Step 1: Inventory Agent Infrastructure

1. **Identify all context files**:
   - Scan for `AGENTS.md` files (root and subdirectories)
   - List all `.md` files in `.agents/`
   - Check for platform-specific files (`.cursor/`, `.github/copilot-instructions.md`, `CLAUDE.md`)

2. **Identify all agent infrastructure scripts**:
   - Find all executable files in `.agents/` directory
   - List scripts by language/file type
   - Note their purpose and relationships

### Step 2: Review Context Files

For each context file, evaluate against these criteria:

#### 1. Structure & Organization
- [ ] Follows `agentic-infra-setup.md` patterns?
- [ ] Proper directory organization?
- [ ] Clear and descriptive file naming?
- [ ] Appropriate file location?

#### 2. Content Quality
- [ ] Documentation is complete and comprehensive?
- [ ] Instructions are clear and actionable?
- [ ] AI agents can understand and follow instructions?
- [ ] Examples provided where helpful?
- [ ] References are correct and up-to-date?

#### 3. Consistency
- [ ] Consistent structure across similar files?
- [ ] Consistent naming conventions?
- [ ] Consistent formatting and style?
- [ ] References between files are correct?

#### 4. Best Practices (from agentic-infra-setup.md)
- [ ] Single source of truth (no duplication)?
- [ ] Platform files reference core context (not duplicate)?
- [ ] Proper separation of concerns?
- [ ] Modular design (detailed info in `.agents/`, overview in `AGENTS.md`)?
- [ ] Platform-specific files reference, not duplicate?

#### 5. Maintainability
- [ ] Easy to update and modify?
- [ ] Clear relationships between files?
- [ ] Portable across projects (if applicable)?
- [ ] Well-organized and logical structure?

### Step 3: Review Agent Infrastructure Scripts

For each script in `.agents/` directory, perform a code review focusing on:

#### 1. Efficacy
- [ ] Does the script achieve its intended purpose?
- [ ] Are there more efficient approaches or algorithms?
- [ ] Performance considerations (if applicable)?
- [ ] Correctness of logic and output?

#### 2. Clarity
- [ ] Clear code structure and logic flow?
- [ ] Comprehensive comments and documentation?
- [ ] Readable variable and function names?
- [ ] Clear error messages and user feedback?
- [ ] Code is self-documenting where possible?

#### 3. Modularity
- [ ] Proper separation of concerns?
- [ ] Reusable components/functions?
- [ ] Single responsibility principle followed?
- [ ] Appropriate abstraction levels?
- [ ] No excessive coupling between components?

#### 4. Maintainability
- [ ] Easy to understand and modify?
- [ ] Clear dependencies and requirements?
- [ ] Well-organized code structure?
- [ ] Easy to debug and troubleshoot?
- [ ] Documentation for complex logic?

#### 5. Scalability
- [ ] Can handle growth and changes?
- [ ] Extensible design (easy to add features)?
- [ ] Not over-engineered but appropriately flexible?
- [ ] Future-proof considerations?

#### 6. Code Quality
- [ ] Follows language best practices?
- [ ] Proper error handling throughout?
- [ ] Input validation where needed?
- [ ] Proper resource management (file handles, connections, etc.)?
- [ ] Testing considerations (unit tests, integration tests)?
- [ ] Type hints/type safety (if applicable)?

## Output Format

Produce a structured review report with the following sections:

### Section 1: Overview
- **Summary**: Brief overview of agent infrastructure state
- **Files Reviewed**:
  - List of context files reviewed
  - List of scripts reviewed
- **High-Level Assessment**: Overall health of agent infrastructure
- **Key Strengths**: What's working well
- **Key Concerns**: Major areas needing attention

### Section 2: Context Files Review
- **Structure & Organization**: Findings on file organization
- **Content Quality**: Issues with completeness/clarity
- **Consistency**: Inconsistencies found across files
- **Best Practices**: Adherence to agentic-infra-setup.md principles
- **Maintainability**: Ease of maintenance and updates
- **File-Specific Recommendations**: Detailed suggestions per file

### Section 3: Scripts Code Review
For each script, provide:
- **Script Name & Purpose**: What it does
- **Efficacy**: Is it effective? Any improvements?
- **Clarity**: Readability and documentation issues
- **Modularity**: Separation of concerns, reusability
- **Maintainability**: How easy to maintain/modify
- **Scalability**: Can it grow with needs?
- **Code Quality**: Specific code issues found
- **Suggestions**: Concrete improvement recommendations

### Section 4: Action Items
- **Priority 1 (Critical)**: Must-fix issues that impact functionality
- **Priority 2 (Important)**: Significant improvements that enhance quality
- **Priority 3 (Nice to Have)**: Enhancements for long-term maintainability
- **Quick Wins**: Easy improvements with high impact
- **Long-Term Refactoring**: Larger improvements requiring more work

## AI Agent Instructions

When executing this review:

1. **Be thorough**: Review all agent infrastructure files systematically
2. **Be constructive**: Provide actionable suggestions, not just criticism
3. **Prioritize**: Focus on most impactful improvements first
4. **Reference authority**: Use `agentic-infra-setup.md` as the guiding document
5. **Be specific**: Provide concrete examples and file references
6. **Consider context**: Understand the project's needs and constraints
7. **Balance**: Don't over-engineer, but ensure quality and maintainability

### Review Checklist

- [ ] All agent infrastructure files identified
- [ ] All context files reviewed against criteria
- [ ] All scripts in `.agents/` directory code-reviewed
- [ ] Structured report generated with all sections
- [ ] Action items prioritized
- [ ] Suggestions are actionable and specific

## Examples of Good vs. Problematic Patterns

### Good: Context File Organization
```
.agents/
├── context/
│   └── agentic-infra-setup.md   # Setup guide
├── commands/
│   └── organize-inbox.md         # Command instructions
└── meditation-inbox-organizer.md # Detailed workflow
```
Clear separation, modular, easy to find.

### Problematic: Duplication
```
.cursor/commands/organize-inbox.md  # Contains full workflow
.agents/commands/organize-inbox.md  # Duplicates same content
```
Violates single source of truth principle.

### Good: Script Organization
```
.agents/
└── scripts/
    ├── utils.py              # Shared utilities
    └── process_inbox.py      # Main workflow script
```
Well-organized, modular scripts.

### Problematic: Monolithic Script
Single 1000-line script with no functions, unclear structure.
Should be broken into modules.

---

**Note**: This command is designed to be portable. You can copy this file (and the corresponding `.cursor/commands/review-agentic-infra.md`) to any project that follows the agentic-infra-setup.md pattern.
