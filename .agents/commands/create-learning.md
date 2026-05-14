# Command: create-learning

## Purpose
Interactively create or update learnings documents so non-obvious, hard-won insights are captured in a consistent format.

## Interactive Flow
1. Determine scope:
   - `plan-specific` -> write to `.agents/plans/{PLAN_NAME}/learnings.md`
   - `cross-cutting` -> write to `.agents/plans/_learnings/{topic-name}.md`
2. Identify target:
   - For plan-specific learnings, infer the current plan from session context first. If unclear, ask the user.
   - If no plan exists for plan-specific learnings, offer to create a minimal plan folder before writing.
   - For cross-cutting learnings, ask for a short topic slug (for example, `content-ingestion-patterns`).
3. Gather content:
   - First: proactively propose learnings from current session context (discussion, decisions, tool outputs, and fixes).
   - Second: if current session context is thin, offer to analyze the current branch (commits, diffs, PR notes) and propose learnings.
   - Third: ask the user to provide learnings directly.
   - Present a proposed list for confirmation/refinement before drafting.
4. Draft and confirm:
   - Structure the file using `.agents/plans/_template/learnings.md`.
   - Show the full drafted content and request explicit confirmation.
   - Write files only after explicit confirmation.

## Content Quality Guidelines
- Focus on surprising, non-obvious insights, not generic best practices.
- Capture what was learned and why it matters, not just what was done.
- Include practical implications that future contributors can apply quickly.
- Ensure each learning includes a clear, actionable `**Takeaway:**` line.

## Existing File Behavior
- If `.agents/plans/{PLAN_NAME}/learnings.md` exists, append new sections and continue numbering.
- If `.agents/plans/_learnings/{topic-name}.md` exists, ask whether to update the existing file or create a new topic file.
- Preserve reverse-chronological progress notes in related plan/task files when they are updated as part of this workflow.

## Output
- New or updated learnings file in the appropriate location.
- Short confirmation message summarizing what was created or updated.
