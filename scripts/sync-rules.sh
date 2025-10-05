#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'USAGE'
Sync ai-assisted rules into the current repository (copy-in model).

Usage:
  scripts/sync-rules.sh /path/to/source-repo [--apply] [--delete]

Notes:
- By default performs a dry run (no changes). Use --apply to write changes.
- --delete will remove files in the destination that no longer exist in the source (use with care).
- Syncs the `.ai-assisted/` directory, and `AGENTS.md` and `Claude.md` if present in the source.
USAGE
}

if [[ ${1:-} == "-h" || ${1:-} == "--help" || $# -lt 1 ]]; then
  usage; exit 0
fi

SRC="$1"
APPLY=false
DELETE=false
shift || true
while [[ $# -gt 0 ]]; do
  case "$1" in
    --apply) APPLY=true ;;
    --delete) DELETE=true ;;
    *) echo "Unknown option: $1"; usage; exit 1 ;;
  esac
  shift || true
done

if [[ ! -d "$SRC/.ai-assisted" ]]; then
  echo "[sync] Source missing .ai-assisted: $SRC" >&2
  exit 1
fi

DRY_FLAG="-n"
[[ "$APPLY" == true ]] && DRY_FLAG=""

DELETE_FLAG=""
[[ "$DELETE" == true ]] && DELETE_FLAG="--delete"

echo "[sync] From: $SRC"
echo "[sync] Into: $(pwd)"
echo "[sync] Mode: $([[ "$APPLY" == true ]] && echo apply || echo dry-run) $([[ "$DELETE" == true ]] && echo with-delete || echo )"

set -x
rsync -av $DRY_FLAG $DELETE_FLAG "$SRC/.ai-assisted/" ".ai-assisted/"

if [[ -f "$SRC/AGENTS.md" ]]; then
  rsync -av $DRY_FLAG "$SRC/AGENTS.md" "AGENTS.md"
fi

if [[ -f "$SRC/Claude.md" ]]; then
  rsync -av $DRY_FLAG "$SRC/Claude.md" "Claude.md"
fi
set +x

echo "[sync] Done. Review changes, then commit as needed."

