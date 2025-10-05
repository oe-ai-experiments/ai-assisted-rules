#!/usr/bin/env bash
set -euo pipefail

root_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")"/../.. && pwd)"

cd "$root_dir"

echo "[init] Ensuring canonical files exist..."
touch PROJECT_DECISIONS.md LESSONS_LEARNED.md FUTURE_CONSIDERATIONS.md

if [ ! -f .ai_state ] || [ ! -s .ai_state ]; then
  echo "[init] Creating .ai_state from example"
  cp .ai-assisted/rules/templates/ai_state.example.json .ai_state
fi

echo "[init] Done. Consider running: bash .ai-assisted/bootstrap/verify.sh"

