# 🤖 Agentic Infrastructure Setup Guide

*A comprehensive guide for setting up AI agent infrastructure in any project, in a platform-agnostic manner (Cursor, Claude Code, Copilot, etc.).*

---

### Why Use This System?

**Benefits:**
- **Consistency**: Same context structure across all projects
- **Efficiency**: No need to re-explain project structure to each AI agent
- **Portability**: Works with Cursor, GitHub Copilot, Claude, and other AI tools
- **Maintainability**: Single source of truth that's easy to update
- **Collaboration**: Team members and AI agents work from the same context

### System Overview

The complete agentic infrastructure system consists of:

```
project-root/
├── AGENTS.md                    # 🎯 Single source of truth (REQUIRED)
├── .agents/                     # 📁 Modular context files (REQUIRED)
│   ├── structure.md (OPTIONAL, example)            # Folder organization patterns
│   ├── guidelines.md (OPTIONAL, example)           # Content management best practices
│   ├── nomenclature.md  (OPTIONAL, example)        # Naming conventions
│   └── [domain-specific].md    # Additional context as needed
├── .cursor/
│   └── rules/                   # 🖥️ Cursor Project Rules (OPTIONAL)
│       ├── code_style.mdc (OPTIONAL, example)      # Code style rules
│       ├── project_context.mdc (OPTIONAL, example) # Project-specific context rules
│       └── [rule-name].mdc (OPTIONAL, example)     # Additional rules as needed
├── .github/
│   └── copilot-instructions.md # 🤖 GitHub Copilot integration (OPTIONAL)
├── CLAUDE.md                   # 🧠 Claude AI integration (OPTIONAL)
├── .claude/
│   └── commands/               # 🧠 Claude command wrappers (OPTIONAL)
└── [subdirectory]/
    └── AGENTS.md               # 📄 Subdirectory-specific context (OPTIONAL)
```

---

## Core Components

### AGENTS.md (Required)

**Purpose**: Single source of truth for project context

**Location**: Project root (mandatory)

**What to include**:
- Project overview and purpose
- Directory structure explanation
- Coding standards and conventions
- Development workflow
- Testing procedures
- Deployment process
- References to detailed context in `.agents/` directory

**Reference**: Based on the [AGENTS.md pattern](https://agents.md/) with custom modifications

**Custom Rule**: Additional `AGENTS.md` files can be placed in subdirectories for folder-specific context, but the root-level file is mandatory.

### .agents/ Directory (Required)

**Purpose**: Modular context files for detailed guidance

**Location**: Project root

**Suggested files**:
- `structure.md` - Folder organization patterns and file handling (Optional)
- `guidelines.md` - Content management best practices (Optional)
- `nomenclature.md` - (Optional) Naming conventions and standards
- `commit-guidelines.md` - (Optional) Git commit message standards
- `[domain-specific].md` - Add context files as needed for your project

**Flexibility**: Add domain-specific context files as your project grows

---

## Platform-Specific Files

### Cursor (.cursor/rules/) - Optional

**Purpose**: Cursor IDE-specific behaviors and integration using Project Rules

**Location**: `.cursor/rules/` directory

**Key Principle**: Reference `AGENTS.md` as the primary context source, don't duplicate information

**Modern Approach**: Use individual `.mdc` rule files instead of deprecated `.cursorrules`

**When to use**: Working with Cursor IDE

**Note**: `.cursorrules` is deprecated and will be removed in future versions. Use Project Rules instead.

### GitHub Copilot (.github/copilot-instructions.md) - Optional

**Purpose**: Repository-level custom instructions for Copilot

**Location**: `.github/` directory

**Key Principle**: Reference `AGENTS.md` as the primary context source, don't duplicate information

**Reference**: [GitHub Copilot Custom Instructions](https://docs.github.com/en/copilot/how-tos/configure-custom-instructions/add-repository-instructions)

**When to use**: Using GitHub Copilot

### Claude (CLAUDE.md) - Optional

**Purpose**: Claude-specific context and best practices

**Location**: Project root

**Key Principle**: Reference `AGENTS.md` as the primary context source, don't duplicate information

**Content**: Commands, core files, code style, testing, workflow

**Reference**: [Claude Code Best Practices](https://www.anthropic.com/engineering/claude-code-best-practices)

**When to use**: Working with Claude Code or Claude AI

---

## Step-by-Step Setup

### Pre-Setup Questions

Before starting, answer these questions:

1. **Which AI platforms will you be using?**
   - [ ] Cursor IDE
   - [ ] GitHub Copilot
   - [ ] Claude AI/Code
   - [ ] Other: _______________

2. **Does your project have subdirectories that need specific AGENTS.md files?**
   - [ ] Yes, I have subdirectories with distinct contexts
   - [ ] No, root-level context is sufficient
   - [ ] I'm not sure (we'll analyze AFTER setup)

3. **What specialized context files would you like to set up?**
   - [ ] commit_guidelines.md context
   - [ ] project_architecture.md context
   - [ ] project_status.md context
   - [ ] No need for this yet.
   - [ ] I'm not sure (we'll analyze AFTER setup)

### Setup Steps

#### Step 1: Create AGENTS.md at Project Root

Create the main context file using the template below (see Templates section).

#### Step 2: Create .agents/ Directory

```bash
mkdir .agents
```

#### Step 3: Add Modular Context Files

Create the essential context files inside `.agents/` according to each project's needs. You can skip this for initial setup or suggest some files as well (for example: commit guidelines, project architecture).
Examples:
- `.agents/commit_guidelines.md`
- `.agents/current_project_progress.md`

#### Step 4: Add Platform-Specific Files

Based on your platform selections from the pre-setup questions:

**For Cursor users:**
```bash
mkdir -p .cursor/rules
# Create .cursor/rules/project_context.mdc file
# Create .cursor/rules/code_style.mdc file (optional)
```

**For GitHub Copilot users:**
```bash
mkdir -p .github
# Create .github/copilot-instructions.md file
mkdir -p .github/instructions
# Create .github/instructions directory for special context files (like in .agents/ dir, but for copilot)
```

**For Claude users:**
```bash
# Create CLAUDE.md file
# Optionally create .claude/commands wrappers that reference .agents/commands/*
```

#### Step 5: Optionally Create Subdirectory AGENTS.md Files

If you identified subdirectories that need specific context, create `AGENTS.md` files in those directories.

NOTE: When using Claude, you can create subdirectory `CLAUDE.md` files in the same way. To avoid duplicate logic, they should only reference the sibling `AGENTS.md` file in the same subdirectory.

#### Step 6: Add .gitignore Entries (if using Git)

Add these entries to your `.gitignore`:

```gitignore
# AI Agent context files (optional - you may want to track these)
# .agents/
# AGENTS.md
# .cursor/
# CLAUDE.md
```

#### Step 7: Verify Setup

Use this checklist to verify your setup:

- [ ] `AGENTS.md` exists at project root
- [ ] `.agents/` directory exists with context files
- [ ] Platform-specific files created (based on your selections)
- [ ] All files reference `AGENTS.md` as primary context source
- [ ] No duplication of information between files
- [ ] Context files are clear and actionable

---

## Templates

### AGENTS.md Template

```markdown
# 🤖 Agentic Context - [Project Name]

## Project Overview

[Brief description of what this project does and its main purpose]

## Detailed Context Files

For specific implementation details, refer to the modular context files in the `.agents/` directory:

- **`.agents/file1.md`**: [Description that defines when its useful to look into this context file]
- **`.agents/file2.md`**: [Description that defines when its useful to look into this context file]
- **`.agents/file3.md`**: [Description that defines when its useful to look into this context file]

## [Project-Specific Sections]

[Add sections specific to your project type]

---

*This context file serves as the single source of truth for understanding this project structure. Platform-specific implementations should reference this file while adding their own behavioral guidelines.*
```

### .cursor/rules/ Templates

**Project Context Rule** (`.cursor/rules/project_context.mdc`):

```mdc
---
description: Project context and agentic structure reference
globs: "*"
alwaysApply: true
---

# Project Context Reference

This project uses an agentic infrastructure structure. Always reference the main context file:

**Primary Context**: `AGENTS.md` - Contains the single source of truth for understanding this repository's purpose, structure, and organization.

**Detailed Context**: `.agents/` directory contains modular context files:
- `.agents/file1.md` - [Description that defines when its useful to look into this context file]
- `.agents/file2.md` - [Description that defines when its useful to look into this context file]
- `.agents/file3.md` - [Description that defines when its useful to look into this context file]
```

**Code Style Rule** (`.cursor/rules/code_style.mdc`) - Optional:

```mdc
---
description: Code style and formatting guidelines
globs: "*.js,*.ts,*.py,*.go,*.rs"
alwaysApply: true
---

For Code style rules check [.agents/code_style.md]
```
This example outlines the fact that local rules that have a source of truth inside `.agents/` should refer to the source, and not duplicate the context, but may have platform-specific files that only reference the real sources of truth

### .github/copilot-instructions.md Template

```markdown
# GitHub Copilot Instructions for [Project Name]

## Primary Context Source
This project uses an agentic infrastructure structure. Always reference the main context file:

**Primary Context**: `AGENTS.md` - Contains the single source of truth for understanding this repository's purpose, structure, and organization.

**Detailed Context**: `.agents/` directory contains modular context files:
- `.agents/file1.md` - [Description that defines when its useful to look into this]
- `.agents/file2.md` - [Description that defines when its useful to look into this]
- `.agents/file3.md` - [Description that defines when its useful to look into this]
[Any COPILOT-SPECIFIC context here. Make sure this is truly platform-specific, and anything else goes into reusable context files.]
```

### CLAUDE.md Template

```markdown
# Claude Context for [Project Name]

## Primary Context Source
This project uses an agentic infrastructure structure. Always reference the main context file:

**Primary Context**: `AGENTS.md` - Contains the single source of truth for understanding this repository's purpose, structure, and organization.

**Detailed Context**: `.agents/` directory contains modular context files:
- `.agents/file1.md` - [Description that defines when its useful to look into this]
- `.agents/file2.md` - [Description that defines when its useful to look into this]
- `.agents/file3.md` - [Description that defines when its useful to look into this]

[Any CLAUDE-SPECIFIC context here. Make sure this is truly platform-specific, and anything else goes into reusable context files.]
```

---

## Best Practices

### Core Principles

1. **Single Source of Truth**: Keep `AGENTS.md` as the primary context source
2. **Modular Design**: Use `.agents/` directory for detailed, specific guidance, or AGENTS.md within subfolders, for keeping AGENTS.md lean, yet useful.
3. **Platform Separation**: Platform-specific files should reference, not duplicate, core context
4. **Consistency**: Maintain consistent structure across all context files
5. **Clarity**: Write clear, actionable instructions that both humans and AI agents can understand

### Maintenance Guidelines

- **Keep AGENTS.md concise**: Detailed information belongs in `.agents/` files
- **Update context files as project evolves**: Context should reflect current project state
- **Use subdirectory AGENTS.md sparingly**: Only when folder-specific context is truly needed
- **Avoid duplication**: Platform files should reference core context, not repeat it
- **Regular review**: Periodically review and update context files

### File Organization Tips

- **Start simple**: Begin with essential files, add complexity as needed
- **Group related information**: Keep similar guidance in the same context file
- **Use descriptive names**: Context file names should clearly indicate their purpose
- **Maintain hierarchy**: Respect the established file organization patterns

---

## Real-World Example

### Racks Academy Implementation

The Racks Academy AI Course Repository serves as a real-world example of this agentic infrastructure system:

**Project Type**: Educational content repository

**Key Decisions Made**:
1. **Spanish Language Preservation**: All folder/file names maintain Spanish language
2. **Hierarchical Structure**: Three-level organization (Aula/Seccion/Leccion)
3. **Video File Exclusion**: Large video files excluded from Git tracking
4. **Educational Focus**: Context emphasizes learning progression and content management

**Structure**:
```
Racks Academy/
├── AGENTS.md                    # Single source of truth
├── .agents/
│   ├── structure.md            # Folder organization patterns
│   ├── guidelines.md           # Content management best practices
│   ├── nomenclature.md         # Spanish naming conventions
│   └── curso_ai_catalogo.md    # Course catalog reference
├── .cursor/rules/              # Cursor-specific behaviors
└── Aula_XX_Nombre/             # Educational content structure
```

**Adaptation for Different Project Types**:

**Web Application**:
- Focus on code organization, API structure, and deployment
- Include frontend/backend separation in structure.md
- Add testing guidelines specific to web development

**Library/Package**:
- Emphasize API documentation and versioning
- Include contribution guidelines in guidelines.md
- Focus on code quality and backward compatibility

**CLI Tool**:
- Include command structure and help system
- Focus on user experience and error handling
- Add installation and distribution guidelines

**Data Science Project**:
- Include data organization and preprocessing
- Focus on reproducibility and documentation
- Add model versioning and experiment tracking

---

## References

### Official Documentation

- **[AGENTS.md Pattern](https://agents.md/)**: Official documentation for the AGENTS.md pattern
- **[GitHub Copilot Custom Instructions](https://docs.github.com/en/copilot/how-tos/configure-custom-instructions/add-repository-instructions)**: Official guide for GitHub Copilot repository instructions
- **[Claude Code Best Practices](https://www.anthropic.com/engineering/claude-code-best-practices)**: Official Claude coding best practices documentation

### Community Resources

- **[AGENTS.md Examples](https://github.com/search?q=AGENTS.md)**: Search GitHub for real-world AGENTS.md examples
- **[Cursor Project Rules](https://cursor.com/docs/context/rules)**: Official Cursor Project Rules documentation
- **[AI Coding Agent Best Practices](https://github.com/topics/ai-coding)**: Community discussions and examples

### Examples from Popular Projects

- **[OpenAI Codex](https://github.com/openai/codex)**: Example of comprehensive agent context
- **[Apache Airflow](https://github.com/apache/airflow)**: Large project with multiple AGENTS.md files

---

*This guide is part of the agentic infrastructure system. It can be copied to any project and customized for specific needs.*
