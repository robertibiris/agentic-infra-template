# Local Developer Directory

`.agents/local/` is the developer-owned part of the agentic infrastructure. Use it for files that help you and your AI tools work effectively but should not be committed to the project's main repository.

Typical content includes:

- `context/` — personal context, preferences, private notes, and machine-specific guidance.
- `skills/` — personal or experimental skills that are not ready to become shared project infrastructure.
- `plans/` — tracked plans, task files, progress notes, and plan-related learnings.
- Any other scratch files or workflow state that belongs to the developer rather than the shared project.

The main repository tracks only this README and the placeholder files that preserve the starter directory structure. Everything else under `.agents/local/` is ignored by the main repository.

## Optional Local Version Control

Run the `setup-local-repo` skill to initialize a nested Git repository at `.agents/local/.git/`. That repository can version-control all developer-owned content together while keeping it separate from the main project history.

The nested repository is optional. The local directory remains usable without it.

## Privacy Boundary

Treat `.agents/local/` as private by default, but do not use it as a secrets vault. Keep credentials and production secrets in an appropriate secret manager. Before sharing or publishing the nested repository, review its contents explicitly.

## Shared vs. Local

- Put team-wide context, stable skills, scripts, and templates in the shared `.agents/` directories tracked by the main repository.
- Put developer-specific context, experimental skills, plans, and local workflow state in `.agents/local/`.
- Promote useful local material into shared infrastructure deliberately after reviewing it for privacy and portability.
