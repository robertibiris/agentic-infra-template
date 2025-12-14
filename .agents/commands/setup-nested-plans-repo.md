# Command: setup-nested-plans-repo

## Purpose
Initialize a nested git repository in `.agents/plans/` directory to enable local version control of plan files without committing them to the main project repository. This allows developers to track their plan progress independently while keeping the main repository clean.

## Rationale

Plans are developer-specific work that doesn't need to be shared in the main repository. The main repository's `.gitignore` is configured to ignore plan files (except templates and README). By setting up a nested repository:

- Developers can commit and track their plan progress locally
- The main repository stays clean and focused on shared infrastructure
- Each developer maintains their own plan history independently
- No conflicts or merge issues with plan files in the main repo

## Inputs
None required. This command sets up the nested repository structure.

## Behavior

### Step 1: Navigate to Plans Directory
```bash
cd .agents/plans
```

### Step 2: Check if Repository Already Exists
```bash
if [ -d .git ]; then
    echo "Error: A git repository already exists in .agents/plans/"
    echo "If you want to reinitialize, remove the .git directory first."
    exit 1
fi
```

### Step 3: Initialize Git Repository
```bash
git init
```

### Step 4: Create .gitignore File
Create `.gitignore` file with the following content:

```gitignore
# Ignore files tracked by the main repository
README.md
_template/

# System files
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db

# Editor files
.vscode/
.idea/
*.swp
*.swo
*~

# Temporary files
*.tmp
*.log
*.cache
```

### Step 5: Create AGENTS.md File (if not exists)
Create `AGENTS.md` file documenting the nested repository structure. See `.agents/plans/AGENTS.md` for the template.

### Step 6: Initial Commit (Optional)
```bash
git add .gitignore AGENTS.md
git commit -m "chore: initialize nested plans repository

- Add .gitignore to ignore files tracked by main repo
- Add AGENTS.md documenting nested repository structure"
```

## Complete Setup Script

For convenience, here's a complete script that performs all steps:

```bash
#!/bin/bash
set -e

cd .agents/plans

# Check if repository already exists
if [ -d .git ]; then
    echo "Error: A git repository already exists in .agents/plans/"
    echo "If you want to reinitialize, remove the .git directory first."
    exit 1
fi

# Initialize git repository
echo "Initializing nested git repository..."
git init

# Create .gitignore
echo "Creating .gitignore..."
cat > .gitignore << 'EOF'
# Ignore files tracked by the main repository
README.md
_template/

# System files
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db

# Editor files
.vscode/
.idea/
*.swp
*.swo
*~

# Temporary files
*.tmp
*.log
*.cache
EOF

# Create AGENTS.md if it doesn't exist
if [ ! -f AGENTS.md ]; then
    echo "Creating AGENTS.md..."
    cat > AGENTS.md << 'EOF'
# Nested Repository for Plans Directory

## Overview

This directory (`.agents/plans/`) contains a **nested git repository** that tracks plan files locally without committing them to the main project repository. This structure allows developers to version control their plans independently while keeping the main repository clean.

## Repository Structure

### Main Repository Tracks
The main project repository tracks shared infrastructure files:
- `README.md` - Documentation for the plans directory structure
- `_template/` - Template files for creating new plans and tasks (shared across all developers)

### Nested Repository Tracks
This nested repository tracks developer-specific plan files:
- `{PLAN_NAME}/` directories - Each plan lives in its own folder
  - `plan.md` - Plan metadata, objectives, requirements, steps, tasks summary, and progress log
  - `{TASK_NAME}.md` - Task files with metadata, steps, outputs, dependencies, and progress notes
- `AGENTS.md` - This file, documenting the nested repository structure

## Why This Structure?

Plans are developer-specific work that doesn't need to be shared in the main repository. By using a nested repository:
- Developers can commit and track their plan progress locally
- The main repository stays clean and focused on shared infrastructure
- Each developer maintains their own plan history independently
- No conflicts or merge issues with plan files in the main repo

## How Agents Should Interact

1. **For general agentic infrastructure guidance**: Refer to the main repository's `AGENTS.md` file at the project root (`../../AGENTS.md`)

2. **For plan-specific operations**: Work within this nested repository structure:
   - Plans are tracked by this nested repo, not the main repo
   - Use standard git commands within this directory to commit plan changes
   - The `.gitignore` in this nested repo ignores files tracked by the main repo (`README.md`, `_template/`)

3. **When creating plans**: 
   - Use templates from `_template/` directory (tracked by main repo)
   - Create new plan directories that will be tracked by this nested repo
   - Follow the same structure and conventions documented in the main `AGENTS.md`

4. **File tracking**:
   - Files ignored by this nested repo's `.gitignore` are tracked by the main repo
   - Files tracked by this nested repo are ignored by the main repo's `.gitignore`
   - This separation prevents conflicts and keeps responsibilities clear

## Reference

For complete agentic infrastructure documentation, see the main repository's `AGENTS.md` file, which contains:
- Plans and tasks overview
- Command index
- Workflow guidance
- Assistant behavior requirements
EOF
fi

# Stage and commit initial files
echo "Staging initial files..."
git add .gitignore AGENTS.md

echo ""
echo "✅ Nested repository initialized successfully!"
echo ""
echo "Next steps:"
echo "1. Review the staged files: git status"
echo "2. Commit the initial setup: git commit -m 'chore: initialize nested plans repository'"
echo "3. Start creating plans that will be tracked by this nested repository"
```

## Side Effects
- Creates `.git/` directory in `.agents/plans/`
- Creates `.gitignore` file in `.agents/plans/`
- Creates `AGENTS.md` file in `.agents/plans/` (if it doesn't exist)
- Initializes a new git repository (does not affect the main repository)

## Expected Outcomes

After running this command:
- A nested git repository exists in `.agents/plans/`
- `.gitignore` is configured to ignore files tracked by the main repo
- `AGENTS.md` documents the nested repository structure
- Plan files can be committed locally without affecting the main repository

## Notes
- This setup is **optional** but recommended for developers who want version control of their plans
- The nested repository is completely independent from the main repository
- Files ignored by the nested repo (README.md, _template/) are tracked by the main repo
- Files tracked by the nested repo are ignored by the main repo's `.gitignore`
- Always run git commands from within `.agents/plans/` directory when working with plans

