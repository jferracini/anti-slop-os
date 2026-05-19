#!/bin/bash

# ANTI-SLOP OS — Project Init
# Usage: bash ~/anti-slop-os/scripts/init.sh
# Alias:  anti-slop
# Repo:   https://github.com/jferracini/anti-slop-os

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"
TARGET="$(pwd)"

echo ""
echo "→ Anti-Slop OS"
echo "  Initializing in: $TARGET"
echo ""

# .cursorrules (always overwrites — keeps the agent contract fresh)
cp "$ROOT_DIR/templates/.cursorrules" "$TARGET/.cursorrules"
echo "  ✓ .cursorrules"

# CLAUDE.md
mkdir -p "$TARGET/.claude"
cp "$ROOT_DIR/templates/CLAUDE.md" "$TARGET/.claude/CLAUDE.md"
echo "  ✓ .claude/CLAUDE.md"

# Critique reference (PROTOCOL + TEMPLATE) — local copy so the agent
# can read them inside the project without depending on ~/anti-slop-os.
mkdir -p "$TARGET/.anti-slop/critique"
cp "$ROOT_DIR/critique/PROTOCOL.md" "$TARGET/.anti-slop/critique/PROTOCOL.md"
cp "$ROOT_DIR/critique/TEMPLATE.md" "$TARGET/.anti-slop/critique/TEMPLATE.md"
echo "  ✓ .anti-slop/critique/ (PROTOCOL + TEMPLATE)"

# Core reference (philosophy + rules + checklist)
mkdir -p "$TARGET/.anti-slop/core"
cp "$ROOT_DIR/core/PHILOSOPHY.md" "$TARGET/.anti-slop/core/PHILOSOPHY.md"
cp "$ROOT_DIR/core/RULES.md"      "$TARGET/.anti-slop/core/RULES.md"
cp "$ROOT_DIR/core/CHECKLIST.md"  "$TARGET/.anti-slop/core/CHECKLIST.md"
echo "  ✓ .anti-slop/core/ (PHILOSOPHY + RULES + CHECKLIST)"

# PROJECT.md — never overwrites if it already exists
if [ -f "$TARGET/PROJECT.md" ]; then
  echo "  ↩ PROJECT.md já existe — mantido sem alteração"
else
  cp "$ROOT_DIR/templates/PROJECT.md" "$TARGET/PROJECT.md"
  echo "  ✓ PROJECT.md"
fi

# Install the skill globally for both Cursor and Claude Code so /critique,
# /slop-check, etc. work in any project — not just this one.
SKILL_SRC="$ROOT_DIR/SKILL.md"

install_skill_to() {
  local dst_dir="$1"
  local label="$2"
  local dst_file="$dst_dir/SKILL.md"

  mkdir -p "$dst_dir"
  if ln -sfn "$SKILL_SRC" "$dst_file" 2>/dev/null; then
    echo "  ✓ Skill ($label) linked → $dst_file"
  else
    cp "$SKILL_SRC" "$dst_file"
    echo "  ✓ Skill ($label) copied → $dst_file"
  fi
}

if [ -f "$SKILL_SRC" ]; then
  install_skill_to "$HOME/.cursor/skills/anti-slop-os" "Cursor"
  install_skill_to "$HOME/.claude/skills/anti-slop-os" "Claude Code"
else
  echo "  ⚠ SKILL.md not found at repo root — skipping skill install"
fi

echo ""
echo "  → Próximos passos:"
echo "    1. Preencha PROJECT.md antes do primeiro prompt"
echo "    2. Cole o contexto do projeto em .cursorrules (seção PROJECT CONTEXT)"
echo "    3. Para auditoria: envie /critique + tela existente"
echo ""
echo "  Done."
echo ""
