#!/usr/bin/env bash
set -euo pipefail

root_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")"/../.. && pwd)"
cd "$root_dir/.ai-assisted/rules"

echo "[verify] Checking registry.yaml exists..."
test -f registry.yaml || { echo "[verify] Missing registry.yaml"; exit 1; }

echo "[verify] Validating listed files exist and have front-matter..."
awk 'BEGIN{RS="- +path:";FS="\n"} NR>1{print $1}' registry.yaml | while read -r rest; do
  path=$(echo "$rest" | awk '{print $1}')
  file="$root_dir/.ai-assisted/$path"
  if [ ! -f "$file" ]; then echo "[verify] Missing $file"; exit 1; fi
  head -n 10 "$file" | grep -qE "^id:|^---$" || { echo "[verify] $file missing id/front-matter"; exit 1; }
done

echo "[verify] OK"

