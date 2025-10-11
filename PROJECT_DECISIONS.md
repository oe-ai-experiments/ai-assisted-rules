## [Init] Decision: Create canonical logs
**Context**: Initialize root-level decision log per assistant-rules
**Options Considered**: Use context folder vs root
**Choice**: Use root-level PROJECT_DECISIONS.md
**Rationale**: Tool-agnostic, consistent location across assistants

## 2025-10-05 Decision: Adopt modular rules structure

Context
- Needed a reusable, assistant-agnostic rules layout with tool adapters and templates.

Options Considered
- Keep monolithic `assistant-rules.md` with language files
- Modularize into core/profiles/tools with registry and bootstrap

Choice
- Modularize under `.ai-assisted/rules` with `registry.yaml`, tool adapters, templates, and bootstrap scripts.

Rationale
- Easier reuse across projects, clearer scoping, and leverage Codex/Claude strengths.

## 2025-10-05 Decision: Prefer copy-in over submodule

Context
- We want the simplest installation and contributor workflow.

Options Considered
- Git submodule for centralized updates
- Copy-in with a local sync script

Choice
- Copy-in. Provide `scripts/sync-rules.sh` for easy updates.

Rationale
- Removes submodule complexity while still allowing periodic updates.

## 2025-10-11 Decision: Consolidate assistant quickstarts

Context
- Multiple rule files plus bootstrap scripts made onboarding harder for individual assistants.

Options Considered
- Keep the modular registry with per-tool adapters and shell scripts.
- Replace per-tool files with a single Markdown manual for each assistant and describe manual setup steps.

Choice
- Provide one `Claude.md` and one `Codex.md` quickstart, expand `AGENTS.md`, and update `README.md` with manual copy-in guidance.

Rationale
- Reduces cognitive load, matches Ovidiu's preference for minimal files, and removes the need to run shell scripts while keeping canonical logs.

## 2025-10-11 Decision: Remove legacy .ai-assisted/rules directory

Context
- After introducing single-file manuals, the modular rules tree was redundant and increased maintenance overhead.

Options Considered
- Keep the directory as archived reference material.
- Delete the directory entirely and rely on the new Markdown guides.

Choice
- Delete `.ai-assisted/rules` and point assistants to `Claude.md`, `Codex.md`, and `AGENTS.md`.

Rationale
- Simplifies onboarding, eliminates outdated instructions, and avoids confusion from parallel guidance sources.
