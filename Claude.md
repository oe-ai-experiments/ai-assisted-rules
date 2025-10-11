# Claude Code Guide

Everything Claude Code needs lives in this file—no external rule tree required.

## Quickstart
- Pin `AGENTS.md`, `.ai_state`, `PROJECT_DECISIONS.md`, `LESSONS_LEARNED.md`, `FUTURE_CONSIDERATIONS.md`.
- Read `.ai_state` at session start, then outline your plan in the chat before editing.
- Manual setup: copy `hooks/pre-commit` into `.git/hooks/pre-commit` (make executable) if you want automatic gitleaks checks.

## Workspace & Context
- Use Claude’s project search to sample only the files necessary for the task.
- Summarize large files before pinning; release pins you no longer need.
- Keep conversations scoped—reference the canonical logs instead of re-copying long snippets.

## Checkpointing & Logging
- Update `.ai_state` whenever you hit a milestone, change direction, or pause for feedback.
- Append decisions, lessons, and future considerations in real time using the templates shown in `AGENTS.md`.
- If filesystem writes are blocked, output the formatted entry for Ovidiu to paste manually.

## Risk & Escalation
- For HIGH/CRITICAL risks or uncertain destructive actions, pause, checkpoint `.ai_state`, and ask Ovidiu using the escalation template in `AGENTS.md`.
- Stay candid about uncertainty; offer concrete options or request clarification when the path is unclear.

## Safe `~/.claude` Usage
- Only symlink portable prompts to `~/.claude/prompts/`. Never store transcripts, sessions, or secrets under version control.
- Example manual linking:
  ```bash
  mkdir -p ~/.claude/prompts
  ln -sf "<absolute path to prompt>" ~/.claude/prompts/ai-assisted-shared.md
  ```
  Replace the placeholder path with whichever prompt file you want to reuse.

Refer to `Codex.md` if you need parity details for Codex CLI. Keep both guides in sync when expectations change.
