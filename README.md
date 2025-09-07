# AI-Assisted Project Context

This repository uses a shared, tool-agnostic setup so any coding assistant (Gemini CLI, Claude Code, Cursor, Codex CLI) can load the same context and follow the same rules.

## Canonical Files (repo root)
- `.ai_state` — Current session state (JSON). Read before starting; update after milestones, escalations, and context switches.
- `PROJECT_DECISIONS.md` — Decision log (what/why). Append entries as you make choices.
- `LESSONS_LEARNED.md` — Accumulated insights from work and debugging.
- `FUTURE_CONSIDERATIONS.md` — Ideas and potential improvements to revisit later.

## Expected `.ai_state` shape
```json
{
  "session_start": "ISO-8601 timestamp",
  "current_focus": "short task summary",
  "files_modified": [],
  "pending_tasks": [],
  "completed": [],
  "next_steps": [],
  "blockers": [],
  "last_checkpoint": "ISO-8601 timestamp"
}
```

## Log entry templates
- PROJECT_DECISIONS.md
  - `## [Date] Decision: [Title]`
  - Context, Options Considered, Choice, Rationale
- LESSONS_LEARNED.md
  - `## [Date] Lesson: [Title]`
  - Situation, Learning, Application
- FUTURE_CONSIDERATIONS.md
  - `## [Date] Suggestion: [Title]`
  - Situation, Future suggestions (bulleted with motivation)

## Usage guidance (all assistants)
- Read `.ai_state` and scan the three logs at session start.
- Write decisions/lessons/future items as they occur (don’t wait until the end).
- If filesystem writes are blocked, output the exact patch or log entry in your response for manual application.
- On HIGH/CRITICAL risks, pause, checkpoint to `.ai_state`, and request user input before proceeding.

## Rules reference
The full collaboration rules are defined in `.ai-assisted/rules/assistant-rules.md`. These rules apply repository-wide and reference the four files above as the single source of truth.
