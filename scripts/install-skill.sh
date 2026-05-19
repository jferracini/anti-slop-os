#!/bin/bash

# ANTI-SLOP OS — Skill Installer
# Installs the antislop-design-os SKILL.md into both Cursor and Claude Code
# so the agent can discover and activate it automatically (via /critique,
# /critique-nu, /slop-check, design review triggers, etc.).
#
# Usage: bash ~/antislop-design-os/scripts/install-skill.sh
# Repo:  https://github.com/nu-design-org/antislop-design-os

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"
SKILL_SRC="$ROOT_DIR/SKILL.md"

echo ""
echo "→ Anti-Slop OS — Skill install"
echo ""

if [ ! -f "$SKILL_SRC" ]; then
  echo "  ✗ SKILL.md not found at $SKILL_SRC"
  echo "    Make sure you have the latest version of antislop-design-os."
  exit 1
fi

# Helper: install via symlink (fallback to copy on read-only fs).
install_skill_to() {
  local dst_dir="$1"
  local label="$2"
  local dst_file="$dst_dir/SKILL.md"

  mkdir -p "$dst_dir"
  if ln -sfn "$SKILL_SRC" "$dst_file" 2>/dev/null; then
    echo "  ✓ $label: symlinked → $dst_file"
  else
    cp "$SKILL_SRC" "$dst_file"
    echo "  ✓ $label: copied → $dst_file"
  fi
}

# Cursor — ~/.cursor/skills/
install_skill_to "$HOME/.cursor/skills/anti-slop-os" "Cursor"

# Claude Code — ~/.claude/skills/
install_skill_to "$HOME/.claude/skills/anti-slop-os" "Claude Code"

echo ""
echo "  Skill is now installed for Cursor and Claude Code."
echo ""
echo "  Try these triggers in any project, in either agent:"
echo "    /critique <screen or context>"
echo "    /slop-check"
echo "    'review this design'"
echo "    'is this AI slop?'"
echo ""
echo "  For Claude.ai (web/desktop):"
echo "    Open a Claude Project → Project instructions →"
echo "    paste the content of templates/CLAUDE.md."
echo "    https://github.com/nu-design-org/antislop-design-os/blob/main/templates/CLAUDE.md"
echo ""
echo "  Updates: 'cd ~/antislop-design-os && git pull' — symlinks auto-update."
echo ""
echo "  Done."
echo ""
