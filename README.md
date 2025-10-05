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
- Rules are organized under `.ai-assisted/rules` and indexed by `.ai-assisted/rules/registry.yaml`.
- Core: `.ai-assisted/rules/core/assistant-rules.md`.
- Tool adapters: `.ai-assisted/rules/tools/` (Codex CLI, Claude Code).

## Reuse in new projects (Copy-in)

- Copy `.ai-assisted/`, `AGENTS.md`, and `Claude.md` to the new repo root.
- Run: `bash .ai-assisted/bootstrap/init.sh` then `bash .ai-assisted/bootstrap/verify.sh`.
- Install hooks: `bash .ai-assisted/bootstrap/install-hooks.sh` (install `gitleaks` for best results).
- Optional: `bash .ai-assisted/bootstrap/link-claude.sh` to symlink prompts to `~/.claude/prompts/`.

### Updating later
- Use the helper script to sync from your canonical rules repo:
  - Dry run: `bash scripts/sync-rules.sh /path/to/ai-assisted-rules`
  - Apply: `bash scripts/sync-rules.sh /path/to/ai-assisted-rules --apply`
  - Optional cleanup: add `--delete` to remove files no longer present upstream (use with care).
