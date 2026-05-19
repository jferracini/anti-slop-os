#!/bin/bash

# ANTI-SLOP OS — Project Init
# Usage: bash ~/anti-slop-os/scripts/init.sh
# Alias:  anti-slop
# Repo:   https://github.com/jferracini/anti-slop-os

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"
TARGET="$(pwd)"

echo ""
echo "→ Anti-Slop OS"
echo "  Initializing in: $TARGET"
echo ""

# .cursorrules
cp "$ROOT_DIR/templates/.cursorrules" "$TARGET/.cursorrules"
echo "  ✓ .cursorrules"

# CLAUDE.md
mkdir -p "$TARGET/.claude"
cp "$ROOT_DIR/templates/CLAUDE.md" "$TARGET/.claude/CLAUDE.md"
echo "  ✓ .claude/CLAUDE.md"

# PROJECT.md (não sobrescreve se já existe)
if [ -f "$TARGET/PROJECT.md" ]; then
  echo "  ↩ PROJECT.md já existe — mantido sem alteração"
else
  cp "$ROOT_DIR/templates/PROJECT.md" "$TARGET/PROJECT.md"
  echo "  ✓ PROJECT.md"
fi

echo ""
echo "  → Próximos passos:"
echo "    1. Preencha PROJECT.md antes do primeiro prompt"
echo "    2. Cole o contexto do projeto em .cursorrules (seção PROJECT CONTEXT)"
echo "    3. Para auditoria: envie /critique + print de uma tela existente"
echo ""
echo "  Done."
echo ""
