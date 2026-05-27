<div align="center">

![anti-slop-os](./assets/cover.png)

# anti-slop-os

**O Diretor Criativo que mora dentro do seu agente de IA.**
Pega o "cara de IA" antes do design sair para produção.

[![Cursor](https://img.shields.io/badge/Cursor-suportado-000000?style=for-the-badge&logo=cursor&logoColor=white)](https://cursor.sh)
[![Claude Code](https://img.shields.io/badge/Claude_Code-suportado-D97757?style=for-the-badge&logo=anthropic&logoColor=white)](https://docs.anthropic.com/claude/docs/claude-code)
[![Claude.ai](https://img.shields.io/badge/Claude.ai-copy_paste-D97757?style=for-the-badge&logo=anthropic&logoColor=white)](https://claude.ai)
[![VS Code](https://img.shields.io/badge/VS_Code-suportado-007ACC?style=for-the-badge&logo=visualstudiocode&logoColor=white)](https://code.visualstudio.com)

[English](./README.md) · [Español](./README.es.md)

</div>

---

## Não sabe programar? Tudo bem.

Você só vai precisar de **três coisas**:

1. Um **terminal** aberto (no Mac: abra o app "Terminal"; no Windows: "PowerShell")
2. Ter o **git** instalado ([baixe aqui](https://git-scm.com/downloads) se não tiver)
3. Usar **Cursor** ou **Claude Code** — é onde a mágica vai acontecer

Copie cada bloco de código abaixo, cole no terminal, aperte Enter. Pronto.

---

## Instalação em 3 passos

### Passo 1 — Baixar o anti-slop-os para a sua máquina

Cole isso no terminal e aperte Enter:

```bash
git clone https://github.com/jferracini/anti-slop-os.git ~/anti-slop-os
```

> **O que isso faz?** Baixa todo o projeto para uma pasta chamada `anti-slop-os` na sua conta.
> Se você já tem essa pasta e quer começar limpo, rode antes: `rm -rf ~/anti-slop-os`

### Passo 2 — Dar permissão de execução aos scripts

```bash
chmod +x ~/anti-slop-os/scripts/*.sh
```

> **O que isso faz?** Diz para o sistema que aqueles arquivos `.sh` podem ser executados.
> Sem isso, o próximo passo falha.

### Passo 3 — Instalar a Skill no Cursor e no Claude Code

```bash
bash ~/anti-slop-os/scripts/install-skill.sh
```

> **O que isso faz?** Conecta o anti-slop-os ao seu Cursor e ao seu Claude Code.
> A partir daqui, qualquer conversa nesses agentes consegue rodar `/critique`.

Você deve ver algo assim:

```
→ Anti-Slop OS — Skill install

  ✓ Cursor: symlinked → ~/.cursor/skills/anti-slop-os/SKILL.md
  ✓ Claude Code: symlinked → ~/.claude/skills/anti-slop-os/SKILL.md

  Skill is now installed for Cursor and Claude Code.
```

### Passo 4 (opcional, recomendado) — Criar um atalho de teclado

```bash
echo 'alias anti-slop="bash ~/anti-slop-os/scripts/init.sh"' >> ~/.zshrc
source ~/.zshrc
```

> **O que isso faz?** Cria um comando curto chamado `anti-slop` que você pode usar
> em qualquer projeto (próxima seção). Sem esse atalho, você teria que digitar o
> caminho completo toda vez.
>
> Usa bash em vez de zsh? Troque `~/.zshrc` por `~/.bashrc` nos dois comandos.

---

## Como usar

### Reinicie o Cursor e o Claude Code

Feche e abra de novo. Isso faz eles detectarem a Skill recém-instalada.

### Teste com qualquer conversa

Abra qualquer projeto no Cursor ou Claude Code. No chat, digite:

```
/critique

Imagine uma landing page de SaaS com hero centralizado, gradiente roxo-rosa,
fonte Inter, três cards de feature idênticos e um botão "Get Started" no meio.
```

Você vai receber de volta:

- Um **AI Slop Score** de 0 a 10
- Uma auditoria camada por camada (tipografia, cor, espaçamento, layout, motion)
- Os 3 piores problemas com correções concretas
- Uma direção clara para resolver

Itens que estão OK aparecem como `CHECK` — sem encher linguiça.

### Outros comandos

| Comando | O que faz |
|---|---|
| `/critique` | Crítica completa (Slop Score + auditoria + top 3 + direção) |
| `/critique-figma <url-do-frame>` | Puxa o frame do Figma (via MCP) e audita |
| `/slop-check` | Rápido — só o Slop Score, sem análise completa |

Frases que também ativam a Skill: *"review this design"*, *"is this AI slop?"*, *"audit this UI"*, *"essa tela tem cara de IA?"*.

---

## Usando dentro de um projeto específico

A Skill já funciona em qualquer chat. Mas se você quiser que o **projeto em si**
carregue as regras (para colaboradores também herdarem, e para o agente ler o
protocolo direto do disco), rode dentro da pasta do projeto:

```bash
cd ~/caminho/do/seu/projeto
anti-slop
```

Isso cria, dentro do projeto:

```
seu-projeto/
├── .cursorrules              regras para Cursor e VS Code
├── .claude/
│   └── CLAUDE.md             regras para Claude Code
├── .anti-slop/
│   ├── core/                 filosofia + regras + checklist
│   └── critique/             protocolo + template
└── PROJECT.md                brief do projeto (não sobrescreve se já existir)
```

Preencha `PROJECT.md` uma vez. A Skill vai ler ele toda vez que você rodar `/critique`.

---

## Claude.ai (web / desktop)

Não existe instalador local pro Claude.ai. Setup é uma vez, por copy-paste:

1. Abra [claude.ai](https://claude.ai) e crie um novo **Project**
2. Vá em **Project instructions**
3. Cole o conteúdo de [`templates/CLAUDE.md`](./templates/CLAUDE.md)
4. Salve

A partir daqui, qualquer conversa naquele Project segue as regras anti-slop.

---

## Manter atualizado

Sempre que quiser puxar melhorias do repo:

```bash
cd ~/anti-slop-os && git pull
```

A Skill foi instalada via symlink — atualiza sozinha em Cursor e Claude Code.
Arquivos já copiados em projetos **não** são sobrescritos automaticamente; rode
`anti-slop` de novo dentro do projeto se quiser atualizar `.cursorrules`,
`CLAUDE.md` e `.anti-slop/`. `PROJECT.md` nunca é sobrescrito.

---

## Idiomas

Regras, protocolo e docs estão traduzidos:

| Idioma | Core | Crítica | README |
|---|---|---|---|
| Português (PT) | [`core/`](./core/) | [`critique/`](./critique/) | este arquivo |
| Inglês (EN) | [`core/en/`](./core/en/) | [`critique/en/`](./critique/en/) | [README.md](./README.md) |
| Espanhol (ES) | [`core/es/`](./core/es/) | [`critique/es/`](./critique/es/) | [README.es.md](./README.es.md) |

O agente escolhe o idioma pelo contexto da conversa. Se você escreve o brief em
português, a crítica volta em português.

---

## Estrutura do repo

```
anti-slop-os/
├── SKILL.md                 entry point da Skill (lido pelo agente)
├── core/
│   ├── PHILOSOPHY.md        a "filosofia". leitura única.
│   ├── RULES.md             regras operacionais (tipo, cor, espaço, motion)
│   ├── CHECKLIST.md         gate de qualidade antes da entrega
│   ├── en/                  versões em inglês
│   └── es/                  versões em espanhol
├── critique/
│   ├── PROTOCOL.md          como conduzir uma Design Critique
│   ├── TEMPLATE.md          formato do output da crítica
│   ├── en/                  versões em inglês
│   └── es/                  versões em espanhol
├── templates/
│   ├── .cursorrules         vai para a raiz de cada projeto
│   ├── CLAUDE.md            vai para .claude/ de cada projeto
│   └── PROJECT.md           brief do projeto (preenchido uma vez)
└── scripts/
    ├── init.sh              prepara um projeto (cria os arquivos acima)
    ├── install-skill.sh     instala a Skill em Cursor + Claude Code
    └── test-setup.sh        valida que tudo está no lugar
```

---

## Documentação

| Arquivo | O que tem dentro |
|---|---|
| [docs/TEST-GUIDE.md](./docs/TEST-GUIDE.md) | Teste prático de 15 min (sem programar) |
| [core/PHILOSOPHY.md](./core/PHILOSOPHY.md) | O "porquê" — verdades operacionais por trás da Skill |
| [core/RULES.md](./core/RULES.md) | Todas as regras anti-slop (tipo, cor, espaço, layout, motion, componentes) |
| [core/CHECKLIST.md](./core/CHECKLIST.md) | Gate de qualidade pré-entrega (AI Slop Score) |
| [critique/PROTOCOL.md](./critique/PROTOCOL.md) | Como uma Design Critique é conduzida |

---

## Problemas comuns

**`fatal: destination path '...' already exists and is not an empty directory.`**
Você já tinha clonado antes. Rode `rm -rf ~/anti-slop-os` e tente o `git clone` de novo.

**`/critique` não aparece no Cursor / Claude Code.**
Feche e abra o app inteiro. Skills só aparecem após reiniciar.

**`bash: ...install-skill.sh: No such file or directory`**
Seu clone está desatualizado. Rode `cd ~/anti-slop-os && git pull`.

**Quero desinstalar.**
Apague os symlinks: `rm -rf ~/.cursor/skills/anti-slop-os ~/.claude/skills/anti-slop-os`.
E remova a pasta: `rm -rf ~/anti-slop-os`.

---

## Resumo das situações

| Situação | Comando |
|---|---|
| Primeira vez na máquina | `git clone` + `install-skill.sh` |
| Novo projeto | `cd projeto && anti-slop` |
| Projeto em andamento | `cd projeto && anti-slop` + preencher PROJECT.md |
| Atualizar regras | `cd ~/anti-slop-os && git pull` |
| Design Critique | `/critique` no Cursor ou Claude |
| Critique de Figma | `/critique-figma <url>` no Cursor ou Claude |
| Sincronizar outra máquina | Passos 1, 2 e 3 lá também |
