#!/usr/bin/env bash
set -euo pipefail

root_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")"/../.. && pwd)"
hooks_dir="$root_dir/.git/hooks"

mkdir -p "$hooks_dir"
cp "$root_dir/.ai-assisted/hooks/pre-commit" "$hooks_dir/pre-commit"
chmod +x "$hooks_dir/pre-commit"
echo "[hooks] Installed pre-commit hook. If gitleaks is installed, it will run automatically."

