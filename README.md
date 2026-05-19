# anti-slop-os

Design OS pessoal. Regras, protocolos e templates para eliminar AI Slop de
qualquer projeto — novo ou em andamento.

Funciona com: **Cursor**, **VS Code**, **Claude Code**, **Claude.ai**.

---

## Estrutura

```
anti-slop-os/
├── core/
│   ├── PHILOSOPHY.md       imutável. lê uma vez.
│   ├── RULES.md            constraints operacionais. carrega em todo projeto.
│   └── CHECKLIST.md        gate de qualidade antes de qualquer entrega.
├── critique/
│   ├── PROTOCOL.md         como conduzir uma Design Critique.
│   └── TEMPLATE.md         output estruturado da critique.
├── templates/
│   ├── .cursorrules        copia para raiz de cada projeto (Cursor / VS Code).
│   ├── CLAUDE.md           copia para .claude/ de cada projeto (Claude Code).
│   └── PROJECT.md          preenche por projeto antes do primeiro prompt.
└── scripts/
    └── init.sh             inicializa qualquer projeto em 1 comando.
```

---

## Setup inicial (por máquina)

```bash
git clone git@github.com:jferracini/anti-slop-os.git ~/anti-slop-os
chmod +x ~/anti-slop-os/scripts/init.sh
echo 'alias anti-slop="bash ~/anti-slop-os/scripts/init.sh"' >> ~/.zshrc
source ~/.zshrc
```

> Se usar bash: substitua `~/.zshrc` por `~/.bashrc`

---

## Novo projeto

```bash
cd ~/caminho/do/projeto
anti-slop
# Preencha PROJECT.md antes do primeiro prompt
```

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

Output segue `critique/PROTOCOL.md` + `critique/TEMPLATE.md`.

---

## Atualizar regras entre máquinas

```bash
cd ~/anti-slop-os && git pull
```

Arquivos já copiados nos projetos **não são sobrescritos automaticamente** —
exceto `.cursorrules` e `CLAUDE.md` (reexecute `anti-slop` para atualizar).
`PROJECT.md` nunca é sobrescrito para preservar o contexto do projeto.

---

## Fluxo resumido

| Situação | Comando |
|---|---|
| Primeira vez na máquina | `git clone` + alias no zshrc |
| Novo projeto | `cd projeto && anti-slop` |
| Projeto em andamento | `cd projeto && anti-slop` + linha de corte |
| Atualizar regras | `cd ~/anti-slop-os && git pull` |
| Design Critique | `/critique` no Cursor ou Claude |
| Sincronizar segunda máquina | `git pull` no repo |
