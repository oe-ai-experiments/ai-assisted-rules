# AI-Assisted Project Context

Minimal, tool-agnostic guidance so any assistant (Claude Code, Codex CLI, Cursor, Gemini, …) can operate safely with Ovidiu.

## Canonical Files (always at repo root)
- `.ai_state` — shared session state; update after milestones or pauses.
- `PROJECT_DECISIONS.md` — record choices and rationale.
- `LESSONS_LEARNED.md` — capture insights discovered while working.
- `FUTURE_CONSIDERATIONS.md` — note follow-ups or ideas for later.

### `.ai_state` Template
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

### Log Entry Templates
- `PROJECT_DECISIONS.md`
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
  ```
- `LESSONS_LEARNED.md`
  ```
  ## 2025-10-11 Lesson: Title
  Situation
  - ...
  Learning
  - ...
  Application
  - ...
  ```
- `FUTURE_CONSIDERATIONS.md`
  ```
  ## 2025-10-11 Suggestion: Title
  Situation
  - ...
  Future suggestions
  - ...
  ```

## Daily Cadence (all assistants)
1. Read `.ai_state`, then skim the three logs for context.
2. Declare your plan; keep it updated as work progresses.
3. Annotate `.ai_state` and the logs in real time—never defer until the end.
4. If writes are blocked, provide ready-to-paste patches or log entries.
5. Pause for HIGH/CRITICAL risks and ask Ovidiu before proceeding.

## Manual Copy-In (new repository)
1. Copy `AGENTS.md`, `Claude.md`, `Codex.md`, and optionally `.ai-assisted/hooks/pre-commit`.
2. Create the four canonical log files (use the templates above).
3. For secret scanning, copy `.ai-assisted/hooks/pre-commit` into `.git/hooks/pre-commit` and run `chmod +x .git/hooks/pre-commit`. Install `gitleaks` locally to enable deep scans; otherwise the fallback regex check still runs.
4. Update project-specific details (e.g., repo name, preferred prompts) directly in these Markdown files.

## Assistant Guides
- `Claude.md` — Claude Code-specific quickstart, context pinning, escalation, prompt hygiene.
- `Codex.md` — Codex CLI plan discipline, patching expectations, validation philosophy.
- Other assistants can rely on `AGENTS.md` plus the shared cadence.

## Optional Resources
- `.ai-assisted/hooks/pre-commit` — ready-to-copy secret scan hook.
- `.ai-assisted/bootstrap/` — legacy automation scripts available if you prefer scripted setup.

Keep everything human-readable and in sync. When expectations change, update the relevant Markdown files and log the decision in `PROJECT_DECISIONS.md`.
