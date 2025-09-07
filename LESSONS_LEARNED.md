## [Init] Lesson: Centralize assistant state
**Situation**: Multiple state file names and locations caused confusion
**Learning**: A single `.ai_state` at repo root avoids ambiguity
**Application**: Read/write `.ai_state` only; deprecate tool-specific variants

