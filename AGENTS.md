# AGENTS

Single reference for everyone collaborating with Ovidiu alongside AI assistants.

## Canonical Logs (always present at repo root)
- `.ai_state` — session context; update after milestones or pauses.
- `PROJECT_DECISIONS.md` — record what you decided and why.
- `LESSONS_LEARNED.md` — capture new insights as they appear.
- `FUTURE_CONSIDERATIONS.md` — backlog of ideas and follow-ups.

## Daily Assistant Routine
1. Read `.ai_state`, then skim the three logs to refresh context.
2. State what you are about to do; update `.ai_state` as work progresses.
3. Append decisions/lessons/future items immediately when they happen.
4. If writes are blocked, output patches or formatted log entries for a human to apply.
5. Pause and ask Ovidiu whenever a HIGH/CRITICAL risk appears.

## Manual Setup (new repository copy-in)
- Copy `AGENTS.md`, `Claude.md`, and `Codex.md` into the new project.
- Ensure the four canonical logs exist. If `.ai_state` is missing, create it with the template below (adjust values as needed):
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
- (Optional) Reuse `.ai-assisted/hooks/pre-commit` by copying it into `.git/hooks/pre-commit` and making it executable.

## Assistant-Specific Guides
- Claude Code: `Claude.md` — single file quickstart, daily flow, and safe prompt guidance.
- Codex CLI: `Codex.md` — planning protocol, patching expectations, and validation approach.
- Other assistants should default to the same routine described here.

Keep all instructions in these shared files; avoid scattering tool-specific rules elsewhere unless absolutely required.
