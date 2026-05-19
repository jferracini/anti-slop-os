# anti-slop-os

> Taste Design OS personal. Elimina AI Slop de cualquier proyecto — nuevo o en curso.

Reglas, protocolos, templates y un **Agent Skill instalable** que opera como
Director Creativo dentro del agente. Funciona nativamente con **Cursor**,
**Claude Code (CLI)** y **VS Code**. En **Claude.ai** (web/desktop), funciona
vía copy-paste de las instructions en un Project.

También disponible en [Português](./README.pt.md) y [English](./README.md).

---

## Qué es

Un OS de gusto personal, versionado en git, que hace tres cosas:

1. **Instala un Skill en Cursor y Claude Code** que se activa automáticamente con `/critique`, `/slop-check`, "review this design" y otros gatillos
2. **Inyecta reglas anti-slop** en cualquier proyecto vía `.cursorrules` (Cursor / VS Code) y `.claude/CLAUDE.md` (Claude Code) — y puede ser pegado en Claude.ai como Project instructions
3. **Entrega un protocolo de Design Critique** auditable con score 0–10

---

## Estructura

```
anti-slop-os/
├── SKILL.md                      entry point del Agent Skill (autosuficiente)
├── core/
│   ├── PHILOSOPHY.md             inmutable. se lee una vez.
│   ├── RULES.md                  constraints operativos
│   ├── CHECKLIST.md              gate de calidad pre-entrega
│   ├── en/                       versiones en inglés
│   └── es/                       versiones en español
├── critique/
│   ├── PROTOCOL.md               cómo conducir un Design Critique
│   ├── TEMPLATE.md               output estructurado del critique
│   ├── en/                       versiones en inglés
│   └── es/                       versiones en español
├── templates/
│   ├── .cursorrules              se copia a la raíz de cada proyecto
│   ├── CLAUDE.md                 se copia al .claude/ de cada proyecto
│   └── PROJECT.md                se completa por proyecto antes del primer prompt
└── scripts/
    ├── init.sh                   inicializa el proyecto + instala el skill
    └── install-skill.sh          solo instala el skill (sin tocar el proyecto)
```

---

## Setup inicial (por máquina)

```bash
git clone git@github.com:jferracini/anti-slop-os.git ~/anti-slop-os
chmod +x ~/anti-slop-os/scripts/*.sh
echo 'alias anti-slop="bash ~/anti-slop-os/scripts/init.sh"' >> ~/.zshrc
source ~/.zshrc
```

Instala el skill en Cursor + Claude Code (una sola vez):

```bash
bash ~/anti-slop-os/scripts/install-skill.sh
```

> Si usas bash: reemplaza `~/.zshrc` por `~/.bashrc`

A partir de aquí, en **cualquier proyecto** que abras en Cursor o Claude Code,
puedes llamar `/critique`, `/slop-check`, "review this design" y el skill se activa.

**Claude.ai (web/desktop)** — no tiene installer local. Abre un Project en
Claude.ai, ve a "Project instructions" y pega el contenido de
[templates/CLAUDE.md](./templates/CLAUDE.md). Listo — el Project sigue las
reglas anti-slop en cualquier conversación.

---

## Nuevo proyecto

```bash
cd ~/ruta/al/proyecto
anti-slop
# Completa PROJECT.md antes del primer prompt
```

El comando `anti-slop` crea, dentro del proyecto:

- `.cursorrules` — reglas para Cursor / VS Code
- `.claude/CLAUDE.md` — contexto para Claude Code
- `.anti-slop/core/` — filosofía + reglas + checklist (copia local)
- `.anti-slop/critique/` — protocolo + template del critique (copia local)
- `PROJECT.md` — brief del proyecto (se preserva si ya existe)

Y garantiza que el skill esté instalado en `~/.cursor/skills/anti-slop-os/` y
`~/.claude/skills/anti-slop-os/`.

## Proyecto en curso

```bash
cd ~/ruta/al/proyecto
anti-slop
# Completa la sección "Línea de corte" en PROJECT.md
# Corre /critique para auditar lo que ya existe
```

---

## Design Critique

En Claude o Cursor, envía una pantalla, frame o componente con:

```
/critique [contexto opcional]
```

Variantes:
- `/slop-check` — solo corre el AI Slop Score
- `/critique-figma <url>` — usa el Figma MCP para extraer el frame y auditar

El output sigue `critique/PROTOCOL.md` + `critique/TEMPLATE.md`.

---

## Actualizar reglas entre máquinas

```bash
cd ~/anti-slop-os && git pull
```

- Skill instalado vía symlink → se actualiza solo (en Cursor y Claude Code)
- Los archivos ya copiados en los proyectos **no se sobrescriben** automáticamente, excepto `.cursorrules`, `CLAUDE.md` y `.anti-slop/` (reejecuta `anti-slop` para actualizar)
- `PROJECT.md` nunca se sobrescribe — preserva el contexto del proyecto

---

## Flujo resumido

| Situación | Comando |
|---|---|
| Primera vez en la máquina | `git clone` + alias + `install-skill.sh` |
| Nuevo proyecto | `cd proyecto && anti-slop` |
| Proyecto en curso | `cd proyecto && anti-slop` + línea de corte |
| Actualizar reglas | `cd ~/anti-slop-os && git pull` |
| Design Critique | `/critique` en Cursor o Claude |
| Critique en Figma | `/critique-figma <url>` |
| Sincronizar segunda máquina | `git pull` en el repo |
