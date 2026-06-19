#!/bin/bash

# ANTI-SLOP OS — Skill + Commands Installer
# Installs the antislop-design-os SKILL.md (with its supporting files) and the
# slash commands into both Cursor and Claude Code, so the agent can discover and
# activate it automatically (/critique, /nu-critique, /slop-check, /nu-fix, etc.).
#
# Usage: bash ~/antislop-design-os/scripts/install-skill.sh
# Repo:  https://github.com/nu-design-org/antislop-design-os

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"
SKILL_SRC="$ROOT_DIR/SKILL.md"

echo ""
echo "→ Anti-Slop OS — install"
echo ""

if [ ! -f "$SKILL_SRC" ]; then
  echo "  ✗ SKILL.md not found at $SKILL_SRC"
  echo "    Make sure you have the latest version of antislop-design-os."
  exit 1
fi

# Link (or copy on read-only fs) a path into a destination.
link_path() {
  local src="$1"
  local dst="$2"
  if ln -sfn "$src" "$dst" 2>/dev/null; then
    return 0
  else
    rm -rf "$dst" 2>/dev/null || true
    cp -R "$src" "$dst"
    return 0
  fi
}

# Install the skill folder: SKILL.md + the supporting files it loads on demand
# (core/, critique/). Linking the support dirs alongside SKILL.md is what makes
# progressive disclosure work globally — the skill can read core/RULES.md,
# critique/nu/PROTOCOL.md, etc. without depending on the repo path.
install_skill_to() {
  local dst_dir="$1"
  local label="$2"

  mkdir -p "$dst_dir"
  link_path "$SKILL_SRC"          "$dst_dir/SKILL.md"
  link_path "$ROOT_DIR/core"      "$dst_dir/core"
  link_path "$ROOT_DIR/critique"  "$dst_dir/critique"
  echo "  ✓ $label skill → $dst_dir (SKILL.md + core/ + critique/)"
}

# Install every command file in commands/ into the agent's commands dir.
# In the personal/public repo only universal commands exist; in the Nu repo the
# /nu-* commands exist too. We install whatever is present — no hardcoding.
install_commands_to() {
  local dst_dir="$1"
  local label="$2"
  local src_dir="$ROOT_DIR/commands"

  if [ ! -d "$src_dir" ]; then
    echo "  ↩ $label commands — no commands/ dir, skipping"
    return 0
  fi

  mkdir -p "$dst_dir"
  local count=0
  for cmd in "$src_dir"/*.md; do
    [ -e "$cmd" ] || continue
    link_path "$cmd" "$dst_dir/$(basename "$cmd")"
    count=$((count + 1))
  done
  echo "  ✓ $label commands → $dst_dir ($count installed)"
}

# Cursor
install_skill_to    "$HOME/.cursor/skills/anti-slop-os" "Cursor"
install_commands_to "$HOME/.cursor/commands"            "Cursor"

# Claude Code
install_skill_to    "$HOME/.claude/skills/anti-slop-os" "Claude Code"
install_commands_to "$HOME/.claude/commands"            "Claude Code"

echo ""
echo "  Installed for Cursor and Claude Code."
echo ""
echo "  IMPORTANT: quit and reopen the agent so it picks up the new commands."
echo ""
echo "  Try in any project, in either agent:"
echo "    /critique <screen or context>      (add --report for a visual report)"
echo "    /slop-check"
echo "    /design   /nu-design               (generate with the anti-AI-signature guardrail)"
echo "    /nu-critique   /nu-principles   /nu-design-plan   /nu-fix   /report"
echo "    'review this design'   'is this AI slop?'   'generate a landing without AI signature'"
echo ""
echo "  For Claude.ai (web/desktop):"
echo "    Open a Claude Project → Project instructions →"
echo "    paste the content of templates/CLAUDE.md."
echo ""
echo "  Updates: 'cd ~/antislop-design-os && git pull' — symlinks auto-update."
echo ""
echo "  Done."
echo ""
