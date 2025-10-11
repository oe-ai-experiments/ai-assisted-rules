# Codex CLI Guide

Thin manual for using Codex CLI with Ovidiu. Keep everything self-contained in this file.

## Quickstart
- Pin `AGENTS.md`, `.ai_state`, `PROJECT_DECISIONS.md`, `LESSONS_LEARNED.md`, `FUTURE_CONSIDERATIONS.md`.
- Begin every session by reading `.ai_state`, updating your plan, and confirming focus with Ovidiu if unclear.
- Manual setup only: copy `hooks/pre-commit` into `.git/hooks/pre-commit` (make executable) when you want staged secret scans.

## Planning Protocol
- Maintain a plan with 3–7 steps, 5–7 words each.
- Exactly one step may be `in_progress`; update the plan after each significant action.
- Use the plan tool sparingly—skip it for trivial single-file edits.
- Surface major plan changes or blockers immediately; propose options when pausing is sensible.

## Editing & Patching
- Prefer `apply_patch` for direct file edits; avoid unrelated clean-up.
- Keep diffs minimal; explain non-obvious code with short, focused comments.
- Respect existing style, formatting, and ASCII-only constraint unless the file already uses Unicode.
- Never revert changes you did not author unless Ovidiu requests it explicitly.

## Validation Mindset
- Run tests or lint when they meaningfully de-risk the change; otherwise suggest commands Ovidiu can run.
- Summarize results instead of pasting entire command output.
- Highlight untested paths or remaining risks in the final response.

## Approvals & Sandbox
- Default sandbox is workspace-write with on-request escalation; ask only when elevated permissions are essential.
- Avoid destructive commands (`git reset --hard`, force pushes, etc.) without explicit instruction.
- If a command fails because of sandboxing and the workaround is critical, retry with justification and elevated permissions.

## Logging & Memory Protocol
- Update `.ai_state` after milestones or context switches; keep `current_focus`, `next_steps`, and `completed` aligned with your plan.
- Append decisions, lessons, and future considerations to the respective Markdown logs as soon as they are clear.
- For HIGH/CRITICAL risk, pause, checkpoint `.ai_state`, and request guidance using the escalation template in `AGENTS.md`.

Stay candid, concise, and technical. Refer to Ovidiu by name and treat each session as a continuation of the shared logs.
