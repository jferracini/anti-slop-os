# anti-slop-os

> Taste Design OS pessoal. Elimina AI Slop de qualquer projeto — novo ou em andamento.

Regras, protocolos, templates e um **Agent Skill instalável** que opera como
Creative Director dentro do agente. Funciona nativamente em **Cursor**,
**Claude Code (CLI)** e **VS Code**. Em **Claude.ai** (web/desktop), funciona
via copy-paste das instructions num Project.

Disponível em [English](./README.md) e [Español](./README.es.md).

---

## O que é

Um OS de gosto pessoal, versionado em git, que faz três coisas:

1. **Instala um Skill em Cursor e Claude Code** que ativa automaticamente em `/critique`, `/slop-check`, "review this design" e outros gatilhos
2. **Injeta regras anti-slop** em qualquer projeto via `.cursorrules` (Cursor / VS Code) e `.claude/CLAUDE.md` (Claude Code) — e pode ser colado no Claude.ai como Project instructions
3. **Dá um protocolo de Design Critique** auditável com score 0–10

---

## Estrutura

```
anti-slop-os/
├── SKILL.md                      entry point do Agent Skill (autossuficiente)
├── core/
│   ├── PHILOSOPHY.md             imutável. lê uma vez.
│   ├── RULES.md                  constraints operacionais
│   ├── CHECKLIST.md              gate de qualidade pré-entrega
│   ├── en/                       versões em inglês
│   └── es/                       versões em espanhol
├── critique/
│   ├── PROTOCOL.md               como conduzir uma Design Critique
│   ├── TEMPLATE.md               output estruturado da critique
│   ├── en/                       versões em inglês
│   └── es/                       versões em espanhol
├── templates/
│   ├── .cursorrules              copia para raiz de cada projeto
│   ├── CLAUDE.md                 copia para .claude/ de cada projeto
│   └── PROJECT.md                preenche por projeto antes do primeiro prompt
└── scripts/
    ├── init.sh                   inicializa projeto + instala skill
    └── install-skill.sh          só instala o skill (sem tocar no projeto)
```

---

## Setup inicial (por máquina)

```bash
git clone git@github.com:jferracini/anti-slop-os.git ~/anti-slop-os
chmod +x ~/anti-slop-os/scripts/*.sh
echo 'alias anti-slop="bash ~/anti-slop-os/scripts/init.sh"' >> ~/.zshrc
source ~/.zshrc
```

Instala o skill em Cursor + Claude Code (só uma vez):

```bash
bash ~/anti-slop-os/scripts/install-skill.sh
```

> Se usar bash: substitua `~/.zshrc` por `~/.bashrc`

A partir daqui, em **qualquer projeto** que você abrir no Cursor ou Claude Code,
dá para chamar `/critique`, `/slop-check`, "review this design" e o skill ativa.

**Claude.ai (web/desktop)** — não tem installer local. Abre um Project no
Claude.ai, vai em "Project instructions" e cole o conteúdo de
[templates/CLAUDE.md](./templates/CLAUDE.md). Pronto — o Project respeita as
regras anti-slop em qualquer conversa.

---

## Novo projeto

```bash
cd ~/caminho/do/projeto
anti-slop
# Preencha PROJECT.md antes do primeiro prompt
```

O comando `anti-slop` cria, dentro do projeto:

- `.cursorrules` — regras para Cursor / VS Code
- `.claude/CLAUDE.md` — contexto para Claude Code
- `.anti-slop/core/` — filosofia + regras + checklist (cópia local)
- `.anti-slop/critique/` — protocolo + template da critique (cópia local)
- `PROJECT.md` — brief do projeto (preservado se já existir)

E garante que o skill esteja instalado em `~/.cursor/skills/anti-slop-os/` e
`~/.claude/skills/anti-slop-os/`.

## Projeto em andamento

```bash
cd ~/caminho/do/projeto
anti-slop
# Preencha a seção "Linha de corte" em PROJECT.md
# Rode /critique para auditar o que já existe
```

---

## Design Critique

No Claude ou Cursor, envie uma tela, frame ou componente com:

```
/critique [contexto opcional]
```

Variantes:
- `/slop-check` — só roda o AI Slop Score
- `/critique-figma <url>` — usa o Figma MCP para extrair o frame e auditar

Output segue `critique/PROTOCOL.md` + `critique/TEMPLATE.md`.

---

## Atualizar regras entre máquinas

```bash
cd ~/anti-slop-os && git pull
```

- Skill instalado via symlink → atualiza sozinho (em Cursor e Claude Code)
- Arquivos já copiados nos projetos **não são sobrescritos** automaticamente, exceto `.cursorrules`, `CLAUDE.md` e `.anti-slop/` (reexecute `anti-slop` para atualizar)
- `PROJECT.md` nunca é sobrescrito — preserva o contexto do projeto

---

## Fluxo resumido

| Situação | Comando |
|---|---|
| Primeira vez na máquina | `git clone` + alias + `install-skill.sh` |
| Novo projeto | `cd projeto && anti-slop` |
| Projeto em andamento | `cd projeto && anti-slop` + linha de corte |
| Atualizar regras | `cd ~/anti-slop-os && git pull` |
| Design Critique | `/critique` no Cursor ou Claude |
| Critique no Figma | `/critique-figma <url>` |
| Sincronizar segunda máquina | `git pull` no repo |
