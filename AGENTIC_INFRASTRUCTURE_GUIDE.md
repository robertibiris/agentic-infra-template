# Agentic Infrastructure: A Complete Guide

## Executive Summary

A structured system for managing AI-assisted development workflows. It standardizes how AI agents understand, track, and execute work across projects, improving consistency, collaboration, and productivity.

---

## What Is Agentic Infrastructure?

A framework that:
- **Standardizes** AI agent context across projects
- **Tracks** work through Plans and Tasks
- **Provides** commands for common workflows
- **Maintains** a single source of truth for project knowledge
- **Works** across AI platforms (Cursor, GitHub Copilot, Claude, etc.)

### Core Philosophy

1. **Single Source of Truth**: `AGENTS.md` is the primary reference
2. **Modular Design**: Detailed context lives in `.agents/` subdirectories
3. **Platform-Agnostic**: Core structure works with any AI tool
4. **Structured Tracking**: Plans and Tasks with clear status and progress
5. **Automation-Ready**: Commands enable consistent workflows

---

## Why This Matters

### Problems It Solves

- **Context Loss**: AI agents don't remember project details between sessions
- **Inconsistency**: Different team members/AI tools use different approaches
- **Lack of Visibility**: No clear view of what's being worked on
- **Onboarding Friction**: New team members/AI agents need repeated explanations
- **Work Fragmentation**: No structured way to break down and track initiatives

### Benefits

- ✅ **Consistency**: Same structure across all projects
- ✅ **Efficiency**: No need to re-explain project context repeatedly
- ✅ **Portability**: Works with Cursor, GitHub Copilot, Claude, and other AI tools
- ✅ **Maintainability**: Single source of truth that's easy to update
- ✅ **Collaboration**: Team members and AI agents work from the same context
- ✅ **Visibility**: Clear tracking of plans, tasks, and progress
- ✅ **Resumability**: Easy to pick up where you left off

---

## Architecture Overview

### Directory Structure

```
project-root/
├── AGENTS.md                    # 🎯 Single source of truth (REQUIRED)
├── .agents/                     # 📁 Structured context and workflows
│   ├── context/
│   │   └── agentic-infra-setup.md  # Detailed setup reference
│   ├── commands/                # Workflow command definitions
│   │   ├── create-plan.md
│   │   ├── create-task.md
│   │   ├── update-status.md
│   │   ├── whats-next.md
│   │   └── review-agentic-infra.md
│   └── plans/                   # All project plans and tasks
│       ├── _template/           # Templates for plans and tasks
│       │   ├── plan.md
│       │   └── TASK_TEMPLATE.md
│       └── {PLAN_NAME}/         # One directory per plan
│           ├── plan.md          # Plan metadata and overview
│           └── {TASK_NAME}.md   # Individual task files
├── .cursor/                     # Cursor IDE integration (optional)
│   ├── commands/                # Cursor command references
│   └── rules/                   # Cursor project rules
│       └── project_context.mdc
├── .github/
│   └── copilot-instructions.md  # GitHub Copilot integration (optional)
└── CLAUDE.md                    # Claude AI integration (optional)
```

---

## Core Components

### 1. AGENTS.md — Master Reference

**Purpose**: Single source of truth for project context

**Location**: Project root (required)

**Contains**:
- Project overview and purpose
- Directory structure explanation
- Plans overview and workflow
- Command index
- Guidance for resuming work
- Assistant behavior requirements

**Key Principle**: Never lists active plans; documents how to use the system

### 2. Plans & Tasks System

#### Plans
- **Definition**: Bounded initiatives documented in `plan.md`
- **Location**: Under `.agents/plans/{PLAN_NAME}/`
- **Contains**: Intent, requirements, high-level steps, task links, progress log
- **Status**: `pending`, `active`, `paused`, or `completed`

#### Tasks
- **Definition**: Executable units inside the same plan folder
- **Format**: One file per task: `{TASK_NAME}.md`
- **Contains**: Purpose, concrete steps, outputs, dependencies, progress notes
- **Status**: `pending`, `active`, `paused`, or `completed`

#### Progress Tracking
- **Reverse-chronological** progress notes (newest first)
- **Timestamps** in format: `YYYY-MM-DD HH:MM TZ`
- **Status propagation**: Task statuses summarized in parent plan

### 3. Command System

Five core commands define workflows:

#### `create-plan`
- **Purpose**: Scaffold a new plan directory and initialize `plan.md`
- **Inputs**: `plan_name`, `objective`, `priority` (optional)
- **Behavior**: Creates directory structure, populates template, registers plan

#### `create-task`
- **Purpose**: Add a task file under an existing plan
- **Inputs**: `plan_name`, `task_name`, `purpose`
- **Behavior**: Creates task file, updates parent plan's task list

#### `update-status`
- **Purpose**: Change lifecycle status and capture progress notes
- **Inputs**: `target`, `new_status`, `progress_note` (optional)
- **Behavior**: Updates status, timestamps, propagates to parent plan

#### `whats-next`
- **Purpose**: Surface next actionable steps across active plans
- **Behavior**: Scans plans, identifies active/paused tasks, produces summary report
- **Output**: Concise report showing next actions per plan

#### `review-agentic-infra`
- **Purpose**: Audit agent infrastructure setup
- **Scope**: Reviews context files and agent infrastructure scripts
- **Output**: Structured review report with action items

### 4. Platform Integration

#### Cursor IDE (`.cursor/`)
- **`.cursor/rules/`**: Project rules that reference `AGENTS.md`
- **`.cursor/commands/`**: Command references (not duplicates)
- **Principle**: Reference, don't duplicate

#### GitHub Copilot (`.github/`)
- **`.github/copilot-instructions.md`**: Repository-level custom instructions
- **References** `AGENTS.md` as primary context source

#### Claude AI (`CLAUDE.md`)
- **Claude-specific** context file
- **References** `AGENTS.md` as primary context source

---

## Workflow Example

### Starting a New Initiative

1. **Create a plan**:
   ```
   Run: create-plan
   Input: plan_name="user-authentication", objective="Implement secure user auth"
   Result: Creates .agents/plans/user-authentication/plan.md
   ```

2. **Break down into tasks**:
   ```
   Run: create-task
   Input: plan_name="user-authentication", task_name="setup-database-schema"
   Result: Creates task file and updates plan.md
   ```

3. **Execute and track**:
   ```
   Work on task → Update progress → Change status as needed
   ```

4. **Resume work**:
   ```
   Run: whats-next
   Result: Shows all active plans and next actionable tasks
   ```

### Daily Workflow

1. Run `whats-next` to see active work
2. Open the indicated plan or task file
3. Review latest progress notes (reverse chronological)
4. Continue execution, update steps if needed
5. Append progress notes with timestamps
6. Update status before pausing or completing

---

## Key Features

### 1. Structured Context Management

- **`AGENTS.md`**: High-level overview
- **`.agents/context/`**: Detailed references
- **Platform files**: Reference core context, don't duplicate

### 2. Lifecycle Management

- **Clear status transitions**: `pending` → `active` → `paused`/`completed`
- **Automatic timestamp tracking**
- **Status propagation** from tasks to plans

### 3. Progress Tracking

- **Reverse-chronological notes** (newest first)
- **Timestamped entries**
- **Contextual notes** capture insights and blockers

### 4. Automation Support

- **Commands are executable** by AI agents
- **Structured data** enables programmatic queries
- **Templates** ensure consistency

### 5. Discoverability

- **`whats-next`** surfaces next actions
- **Clear file organization**
- **Status summaries** in parent plans

---

## Benefits for Teams

### For Developers

- ✅ Clear view of active work
- ✅ Easy to resume after breaks
- ✅ Structured way to break down complex work
- ✅ Consistent approach across projects

### For AI Assistants

- ✅ Consistent context understanding
- ✅ Clear instructions on project structure
- ✅ Ability to track and update work status
- ✅ Reduced need for repeated explanations

### For Project Managers

- ✅ Visibility into active initiatives
- ✅ Progress tracking through notes
- ✅ Status overview across plans
- ✅ Easy to identify blockers

### For New Team Members

- ✅ Clear project structure
- ✅ Examples in templates
- ✅ Self-documenting workflows
- ✅ Faster onboarding

---

## Implementation Strategy

### Phase 1: Setup (Day 1)

1. Copy template structure to project
2. Create `AGENTS.md` with project-specific content
3. Set up `.agents/` directory structure
4. Add platform-specific files (if using Cursor/Copilot/Claude)

### Phase 2: Initial Plans (Week 1)

1. Create first plan for current initiative
2. Break down into 3-5 initial tasks
3. Start tracking progress
4. Refine templates based on team needs

### Phase 3: Adoption (Month 1)

1. Use `whats-next` daily
2. Create plans for all active initiatives
3. Train team on command usage
4. Establish conventions for progress notes

### Phase 4: Optimization (Ongoing)

1. Review infrastructure quarterly
2. Refine templates based on usage
3. Add domain-specific context files as needed
4. Share learnings across projects

---

## Best Practices

### Do's

✅ Keep `AGENTS.md` concise; details go in `.agents/`
✅ Use reverse-chronological ordering for progress notes
✅ Always include timestamps with timezone
✅ Reference core context; don't duplicate
✅ Create tasks when plan steps become complex
✅ Run `whats-next` when resuming work

### Don'ts

❌ Don't merge plans and tasks into single files
❌ Don't duplicate information across platform files
❌ Don't skip progress notes on status changes
❌ Don't create plans without breaking into tasks
❌ Don't forget to update parent plans when tasks change

---

## Comparison: Before vs. After

### Before Agentic Infrastructure

- ❌ AI agents ask the same questions repeatedly
- ❌ No structured way to track AI-assisted work
- ❌ Different team members use different approaches
- ❌ Context scattered across conversations
- ❌ Hard to resume work after breaks
- ❌ No visibility into what AI agents are working on

### After Agentic Infrastructure

- ✅ AI agents reference structured context files
- ✅ Clear Plans → Tasks hierarchy for tracking
- ✅ Consistent approach across team and projects
- ✅ Single source of truth in `AGENTS.md`
- ✅ `whats-next` shows exactly where to resume
- ✅ Full visibility through status tracking and progress notes

---

## ROI Considerations

### Time Savings

- **Reduced context re-explanation**: ~15 min/day per developer
- **Faster onboarding**: ~50% reduction in ramp-up time
- **Better work resumption**: ~10 min saved per context switch

### Quality Improvements

- **Consistency**: Standardized approach reduces errors
- **Visibility**: Early detection of blockers
- **Documentation**: Self-documenting workflows

### Scalability

- **Works across projects**: Template is reusable
- **Platform-agnostic**: Works with any AI tool
- **Team-agnostic**: Same structure for all team members

---

## Getting Started

### Quick Start Checklist

- [ ] Copy template structure to your project
- [ ] Create `AGENTS.md` with project overview
- [ ] Set up `.agents/` directory structure
- [ ] Create your first plan using `create-plan`
- [ ] Break it into tasks using `create-task`
- [ ] Start tracking progress with `update-status`
- [ ] Use `whats-next` to resume work

### Resources

- **Template files**: `.agents/plans/_template/`
- **Setup guide**: `.agents/context/agentic-infra-setup.md`
- **Command definitions**: `.agents/commands/*.md`

---

## Conclusion

This agentic infrastructure provides:

1. **Structure**: Clear organization for AI-assisted development
2. **Consistency**: Same approach across projects and team members
3. **Visibility**: Clear tracking of plans, tasks, and progress
4. **Efficiency**: Reduced context re-explanation and faster onboarding
5. **Scalability**: Reusable template that grows with your needs

It transforms ad-hoc AI assistance into a structured, trackable, and scalable system that benefits both developers and AI agents.

---

*This infrastructure is designed to be portable, maintainable, and adaptable to any project type. Start simple, iterate based on your team's needs, and watch productivity improve as AI agents become true collaborative partners rather than tools that need constant re-education.*


