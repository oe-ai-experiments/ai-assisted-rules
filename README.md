# AI-Assisted Project Context

This repository is the lightweight playbook Ovidiu uses to keep every coding assistant aligned. Everything you need lives in a handful of Markdown files and a single optional hook—no helper scripts required.

## Quickstart (copy into a new project)
1. Copy `AGENTS.md`, `Claude.md`, `Codex.md`, and `.ai_state` (or create it from the template below).
2. Add `PROJECT_DECISIONS.md`, `LESSONS_LEARNED.md`, and `FUTURE_CONSIDERATIONS.md` to the repo root.
3. (Optional) Copy `.ai-assisted/hooks/pre-commit` into `.git/hooks/pre-commit` and run `chmod +x .git/hooks/pre-commit` to enable staged secret scanning.
4. Read `AGENTS.md` with your assistant and begin logging decisions, lessons, and future ideas as you work.

### `.ai_state` baseline
```json
{
  "session_start": "",
  "current_focus": "",
  "files_modified": [],
  "pending_tasks": [],
  "completed": [],
  "next_steps": [],
  "blockers": [],
  "last_checkpoint": ""
}
```

## Canonical log files
- `PROJECT_DECISIONS.md` – capture choices and why they were made.
- `LESSONS_LEARNED.md` – log insights that should influence future work.
- `FUTURE_CONSIDERATIONS.md` – track follow-ups, ideas, or deferred work.

Use these mini-templates when appending entries:
```
## 2025-10-11 Decision: Title
Context
- ...
Options Considered
- ...
Choice
- ...
Rationale
- ...

## 2025-10-11 Lesson: Title
Situation
- ...
Learning
- ...
Application
- ...

## 2025-10-11 Suggestion: Title
Situation
- ...
Future suggestions
- ...
```

## Daily cadence for any assistant
1. Read `.ai_state`, then skim the three logs.
2. Declare a short plan and keep it updated.
3. Update `.ai_state` and append log entries as soon as decisions or lessons surface.
4. If the filesystem is read-only, output patches or fully formatted log snippets for a human to apply.
5. Pause for HIGH/CRITICAL risks, checkpoint `.ai_state`, and ask Ovidiu before proceeding.

## Assistant-specific manuals
- `Claude.md` – Claude Code quickstart, pinning strategy, and escalation protocol.
- `Codex.md` – Codex CLI plan expectations, patching standards, and validation guidance.
- Other assistants can rely on `AGENTS.md`, which describes the shared routine and manual setup.

## Optional extras
- `.ai-assisted/hooks/pre-commit` – copy to `.git/hooks/pre-commit` to run gitleaks (with regex fallback) on staged changes.
- `.ai-assisted/bootstrap/` – legacy automation scripts retained only for convenience; the manual process above is the preferred path.

Keep all instructions human-readable. When expectations change, update the relevant Markdown file and record the decision in `PROJECT_DECISIONS.md`.
