#!/usr/bin/env bash
set -euo pipefail

root_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")"/../.. && pwd)"
src_dir="$root_dir/.ai-assisted/rules/templates/prompts/claude"
dst_dir="$HOME/.claude/prompts"

echo "This will symlink portable prompts into ~/.claude/prompts."
read -r -p "Proceed? [y/N] " ans
if [[ "$ans" != "y" && "$ans" != "Y" ]]; then
  echo "Aborted."
  exit 0
fi

mkdir -p "$dst_dir"
for f in "$src_dir"/*; do
  ln -sf "$f" "$dst_dir/$(basename "$f")"
done
echo "Linked prompts. Never store sessions/secrets in ~/.claude under version control."

