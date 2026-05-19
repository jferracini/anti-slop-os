# Guia de Teste — anti-slop-os

> Roteiro de teste manual para validar a instalação e o funcionamento do skill.
> Tempo total: ~15 minutos. Não precisa saber programar.

---

## Pré-requisitos

- macOS (ou Linux)
- Cursor ou Claude Code instalado e funcionando
- Git instalado (`git --version` deve mostrar algo)
- Terminal aberto

---

## Setup — 60 segundos

Cole no terminal **um bloco de cada vez**:

```bash
git clone git@github.com:jferracini/anti-slop-os.git ~/anti-slop-os
chmod +x ~/anti-slop-os/scripts/*.sh
```

Adiciona o alias `anti-slop` ao seu shell:

```bash
echo 'alias anti-slop="bash ~/anti-slop-os/scripts/init.sh"' >> ~/.zshrc
source ~/.zshrc
```

Instala o skill em Cursor e Claude Code:

```bash
bash ~/anti-slop-os/scripts/install-skill.sh
```

**O que esperar ver no final**:

```
→ Anti-Slop OS — Skill install

  ✓ Cursor: symlinked → /Users/<seu-user>/.cursor/skills/anti-slop-os/SKILL.md
  ✓ Claude Code: symlinked → /Users/<seu-user>/.claude/skills/anti-slop-os/SKILL.md

  Skill is now installed for Cursor and Claude Code.
```

Se viu isso: tudo certo. **Reinicie o Cursor e o Claude Code** (fecha e abre de novo) para o skill ser detectado.

> Para usar no **Claude.ai** (web/desktop), não há installer — é copy-paste manual. Veja a seção "Claude.ai setup" no [README](../README.md#claudeai-webdesktop-setup).

---

## Teste 1 — Setup técnico OK? (1 min)

**Objetivo**: confirmar que o skill foi instalado nos dois ambientes e o repo local está acessível.

Cole no terminal:

```bash
ls -la ~/.cursor/skills/anti-slop-os/SKILL.md
ls -la ~/.claude/skills/anti-slop-os/SKILL.md
ls ~/anti-slop-os/
```

**O que esperar ver**:

- Primeiros dois comandos: linhas começando com `lrwxr-xr-x` (são symlinks) apontando para `~/anti-slop-os/SKILL.md`
- Terceiro comando: lista com `core/`, `critique/`, `docs/`, `scripts/`, `templates/`, `README.md`, `SKILL.md`, etc.

**Se falhou**: o `install-skill.sh` não rodou. Volta no setup acima e repete o último comando.

---

## Teste 2 — Skill aparece no agente? (2 min)

**Objetivo**: confirmar que o Cursor / Claude Code reconheceu o skill.

1. Abra o Cursor (se não estiver aberto, ou reinicie se estava aberto antes do install).
2. Em qualquer projeto, abre o chat (`Cmd + L`).
3. No campo de input, escreva exatamente:

```
o que é o anti-slop-os?
```

**O que esperar ver**: a resposta do agente vai mencionar:
- "Taste Design OS"
- "Agent Skill"
- Os comandos `/critique`, `/slop-check`
- Regras anti-slop, output gate, critique protocol

Se a resposta for genérica ("não sei o que é") **ou** o agente NÃO mencionar essas coisas:
- O skill ainda não foi detectado. Reinicia o Cursor completamente (Cmd+Q e abre de novo).
- Tenta de novo.

---

## Teste 3 — `/critique` em projeto novo (3 min)

**Objetivo**: validar o critique completo.

Cria um projeto de teste fake:

```bash
mkdir -p ~/teste-antislop && cd ~/teste-antislop
anti-slop
```

**O que esperar ver**:

```
→ Anti-Slop OS
  Initializing in: /Users/<seu-user>/teste-antislop

  ✓ .cursorrules
  ✓ .claude/CLAUDE.md
  ✓ .anti-slop/critique/ (PROTOCOL + TEMPLATE)
  ✓ .anti-slop/core/ (PHILOSOPHY + RULES + CHECKLIST)
  ✓ PROJECT.md
  ✓ Skill (Cursor) linked → ...
  ✓ Skill (Claude Code) linked → ...
```

Abre essa pasta no Cursor:

```bash
cursor ~/teste-antislop
```

No chat do Cursor (Cmd + L), cole:

```
/critique

Imagine uma landing page de SaaS com hero centralizado, gradiente roxo-rosa no background, fonte Inter, card com 3 features lado a lado, e CTA "Get started" no centro.
```

**O que esperar ver na resposta**:

- Um output estruturado começando com `## Project / Screen` ou `## First read`
- Um `AI Slop Score` numérico (provavelmente 6-9, porque a descrição é genérica)
- Tabela de Audit com Typography / Color / Spacing / Layout / Motion — camadas OK devem vir como `CHECK`, problemáticas como `Yellow` ou `Red`
- Pelo menos 3 problemas críticos identificados
- Uma "Direction" com sugestões específicas

**Sinal de sucesso**: o agente NÃO dá feedback genérico ("considere usar uma fonte diferente"). Ele dá decisões: "substitua Inter por GT Walsheim para criar tensão com o gradiente removido".

---

## Teste 4 — `/slop-check` rápido (1 min)

**Objetivo**: validar o atalho rápido (só score, sem análise profunda).

No chat:

```
/slop-check

dashboard com 8 cards iguais em grid 2x4, fundo branco, accent roxo padrão Linear
```

**O que esperar ver**:

- Resposta CURTA (não a análise completa)
- Um número (Score: X/10)
- 2-3 bullets explicando os pontos que aumentaram o score
- Sem tabela de audit, sem direção, sem preserva

**Sinal de sucesso**: tem o score numérico e cabe em uma tela. Se vier a análise completa do `/critique`, o gatilho `/slop-check` não está sendo reconhecido como modo curto.

---

## Teste 5 — Idempotência (1 min)

**Objetivo**: confirmar que rodar `anti-slop` duas vezes não destrói o que você escreveu.

```bash
cd ~/teste-antislop
# Verifica o PROJECT.md atual
cat PROJECT.md | head -5
```

Roda o init de novo:

```bash
anti-slop
```

**O que esperar ver**: a saída inclui a linha:

```
  ↩ PROJECT.md já existe — mantido sem alteração
```

**Sinal de sucesso**: rodar `anti-slop` é seguro. Não perde o brief do projeto.

---

## Teste 6 — Update via `git pull` (2 min)

**Objetivo**: confirmar que atualizar o repo propaga pro skill global.

```bash
cd ~/anti-slop-os
git pull
```

Verifica que o skill ainda aponta pro arquivo do repo:

```bash
readlink ~/.cursor/skills/anti-slop-os/SKILL.md
readlink ~/.claude/skills/anti-slop-os/SKILL.md
```

**O que esperar ver**: os dois caminhos retornados são:

```
/Users/<seu-user>/anti-slop-os/SKILL.md
```

**Sinal de sucesso**: qualquer mudança no `SKILL.md` do repo propaga automaticamente — não precisa reinstalar.

---

## Teste 7 — Limpeza pós-teste (30s)

Quando terminar de testar, remove o projeto fake:

```bash
rm -rf ~/teste-antislop
```

O alias `anti-slop` no `.zshrc`, o skill em `~/.cursor/skills/anti-slop-os/` e `~/.claude/skills/anti-slop-os/`, e o repo em `~/anti-slop-os` **permanecem instalados** — você só removeu o projeto de teste.

---

## Checklist final

Marque cada item conforme passou:

- [ ] Setup rodou sem erros
- [ ] Symlinks do skill existem em `.cursor/skills/` E `.claude/skills/`
- [ ] Agente responde sobre o anti-slop-os no chat (Teste 2)
- [ ] `/critique` dá análise estruturada (Teste 3)
- [ ] Camadas OK vêm como `CHECK`, problemáticas como Yellow/Red
- [ ] `/slop-check` dá resposta curta com score (Teste 4)
- [ ] Rodar `anti-slop` 2x preserva o PROJECT.md (Teste 5)
- [ ] `git pull` atualiza tudo sem reinstalar (Teste 6)

**Se passou em todos**: skill funcionando perfeitamente. Pode usar em qualquer projeto seu.

**Se falhou em algum**: anota qual e abre uma issue em [github.com/jferracini/anti-slop-os/issues](https://github.com/jferracini/anti-slop-os/issues). Quase sempre é setup (skill não detectado, repo não baixado, alias não carregado).

---

## Problemas comuns

### "command not found: anti-slop"

O alias não foi carregado. Roda:

```bash
source ~/.zshrc
```

Se ainda não funciona, verifica se foi adicionado mesmo:

```bash
grep anti-slop ~/.zshrc
```

Deve mostrar a linha do alias. Se não mostrou, repete o `echo 'alias...' >> ~/.zshrc` do setup.

### "Skill não responde / agente ignora /critique"

1. Verifica que os skills estão nos caminhos certos:
   ```bash
   ls -la ~/.cursor/skills/anti-slop-os/SKILL.md
   ls -la ~/.claude/skills/anti-slop-os/SKILL.md
   ```
2. Reinicia o Cursor / Claude Code (Cmd+Q e abre de novo).
3. Em vez de `/critique`, tenta o gatilho explícito: `"Apply the anti-slop-os skill and critique this:"`. Se isso ativa, o skill está OK mas o trigger `/critique` não tá pegando — pode ser conflito com outro skill instalado.

### "Permission denied" ao rodar scripts

```bash
chmod +x ~/anti-slop-os/scripts/*.sh
```

### Quero desinstalar tudo

```bash
rm -rf ~/.cursor/skills/anti-slop-os
rm -rf ~/.claude/skills/anti-slop-os
rm -rf ~/anti-slop-os
sed -i.bak '/anti-slop/d' ~/.zshrc
source ~/.zshrc
```
