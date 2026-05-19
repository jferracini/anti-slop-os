#!/bin/bash

# ANTI-SLOP OS — Test Setup
# Cria um projeto de teste em ~/teste-antislop com PROJECT.md já preenchido
# para você testar /critique imediatamente, sem precisar editar nada.
#
# Usage: bash ~/anti-slop-os/scripts/test-setup.sh
# Repo:  https://github.com/jferracini/anti-slop-os

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"
TEST_DIR="$HOME/teste-antislop"

echo ""
echo "→ Anti-Slop OS — Test project setup"
echo ""

if [ -d "$TEST_DIR" ]; then
  echo "  ⚠ Já existe um projeto de teste em $TEST_DIR"
  echo "    Para começar do zero: rm -rf $TEST_DIR && bash $0"
  exit 1
fi

mkdir -p "$TEST_DIR"
cd "$TEST_DIR"

bash "$ROOT_DIR/scripts/init.sh"

# Sobrescreve PROJECT.md com brief pré-preenchido para teste
cat > "$TEST_DIR/PROJECT.md" <<'EOF'
# PROJECT BRIEF — TEST PROJECT

## Identificação
Nome: Teste anti-slop
Stack: React + Tailwind (simulado)
Status: [x] novo

---

## Design Direction

Direção visual escolhida: editorial tenso com personalidade,
tipografia decidida, accent que cria tensão.

O que torna este produto impossível de confundir com outro:
hierarquia visual forte, controlada asymmetria, escolha tipográfica
declarada e justificada.

Referências visuais: tipografia editorial, layout com tensão axial,
motion com easing autoral.

---

## Sistema de Tokens

Spacing base: [x] 8pt
Type scale ratio: [x] 1.414

Fonte display: a definir (serif com personalidade)
Fonte body: a definir (geometric sans com baixo peso por padrão)
Fonte mono: N/A

Background: neutro escuro
Surface: neutro
Foreground: alto contraste
Accent: a definir (deve criar tensão com a paleta)

EOF

echo ""
echo "  ✓ PROJECT.md sobrescrito com brief de teste"
echo ""
echo "  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  Projeto de teste pronto em $TEST_DIR"
echo "  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "  Próximos passos:"
echo ""
echo "    1. cursor $TEST_DIR    (ou abre no Claude Code)"
echo ""
echo "    2. No chat (Cmd + L em Cursor), cole:"
echo ""
echo "       /critique"
echo ""
echo "       Imagine uma landing page de SaaS com hero centralizado,"
echo "       gradiente roxo-rosa no background, fonte Inter, card com"
echo "       3 features lado a lado, e CTA \"Get started\" no centro."
echo ""
echo "    3. Você deve receber:"
echo "       - AI Slop Score numérico"
echo "       - Tabela de Audit (Typography / Color / Spacing / Layout / Motion)"
echo "         com CHECK nas camadas OK e Yellow/Red nas problemáticas"
echo "       - Top 3 problemas com causa raiz e correção"
echo "       - Direção concreta de correção"
echo ""
echo "    Para limpar quando terminar:"
echo "       rm -rf $TEST_DIR"
echo ""
