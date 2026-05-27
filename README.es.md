<div align="center">

![anti-slop-os](./assets/cover.png)

# anti-slop-os

**El Director Creativo que vive dentro de tu agente de IA.**
Detecta la "cara de IA" antes de que el diseño llegue a producción.

[![Cursor](https://img.shields.io/badge/Cursor-soportado-000000?style=for-the-badge&logo=cursor&logoColor=white)](https://cursor.sh)
[![Claude Code](https://img.shields.io/badge/Claude_Code-soportado-D97757?style=for-the-badge&logo=anthropic&logoColor=white)](https://docs.anthropic.com/claude/docs/claude-code)
[![Claude.ai](https://img.shields.io/badge/Claude.ai-copy_paste-D97757?style=for-the-badge&logo=anthropic&logoColor=white)](https://claude.ai)
[![VS Code](https://img.shields.io/badge/VS_Code-soportado-007ACC?style=for-the-badge&logo=visualstudiocode&logoColor=white)](https://code.visualstudio.com)

[English](./README.md) · [Português](./README.pt.md)

</div>

---

## ¿No sabes programar? Tranquilo.

Solo necesitas **tres cosas**:

1. Una **terminal** abierta (Mac: abre la app "Terminal"; Windows: "PowerShell")
2. Tener **git** instalado ([descárgalo aquí](https://git-scm.com/downloads) si no lo tienes)
3. Usar **Cursor** o **Claude Code** — ahí ocurre la magia

Copia cada bloque de código abajo, pégalo en la terminal, pulsa Enter. Listo.

---

## Instalación en 3 pasos

### Paso 1 — Descargar anti-slop-os a tu máquina

Pega esto en la terminal y pulsa Enter:

```bash
git clone https://github.com/jferracini/anti-slop-os.git ~/anti-slop-os
```

> **¿Qué hace esto?** Descarga todo el proyecto a una carpeta llamada `anti-slop-os` en tu cuenta.
> Si ya tienes esa carpeta y quieres empezar limpio, primero ejecuta: `rm -rf ~/anti-slop-os`

### Paso 2 — Dar permisos de ejecución a los scripts

```bash
chmod +x ~/anti-slop-os/scripts/*.sh
```

> **¿Qué hace esto?** Le dice al sistema que esos archivos `.sh` pueden ejecutarse.
> Sin esto, el siguiente paso falla.

### Paso 3 — Instalar la Skill en Cursor y Claude Code

```bash
bash ~/anti-slop-os/scripts/install-skill.sh
```

> **¿Qué hace esto?** Conecta anti-slop-os con tu Cursor y tu Claude Code.
> Desde aquí, cualquier conversación en esos agentes puede ejecutar `/critique`.

Deberías ver algo así:

```
→ Anti-Slop OS — Skill install

  ✓ Cursor: symlinked → ~/.cursor/skills/anti-slop-os/SKILL.md
  ✓ Claude Code: symlinked → ~/.claude/skills/anti-slop-os/SKILL.md

  Skill is now installed for Cursor and Claude Code.
```

### Paso 4 (opcional, recomendado) — Crear un atajo

```bash
echo 'alias anti-slop="bash ~/anti-slop-os/scripts/init.sh"' >> ~/.zshrc
source ~/.zshrc
```

> **¿Qué hace esto?** Crea un comando corto llamado `anti-slop` que puedes usar
> dentro de cualquier proyecto (siguiente sección). Sin él, tendrías que escribir
> la ruta completa cada vez.
>
> ¿Usas bash en vez de zsh? Reemplaza `~/.zshrc` por `~/.bashrc` en ambos comandos.

---

## Cómo usarlo

### Reinicia Cursor y Claude Code

Ciérralos y ábrelos de nuevo. Eso hace que la Skill aparezca.

### Pruébalo en cualquier chat

Abre cualquier proyecto en Cursor o Claude Code. En el chat, escribe:

```
/critique

Imagina una landing page de SaaS con hero centrado, gradiente morado-rosa,
fuente Inter, tres cards de feature idénticas y un botón "Get Started" en el medio.
```

Vas a recibir de vuelta:

- Un **AI Slop Score** de 0 a 10
- Una auditoría capa por capa (tipografía, color, espaciado, layout, motion)
- Los 3 peores problemas con correcciones concretas
- Una dirección clara para resolverlos

Los ítems que están OK aparecen como `CHECK` — sin relleno.

### Otros comandos

| Comando | Qué hace |
|---|---|
| `/critique` | Crítica completa (Slop Score + auditoría + top 3 + dirección) |
| `/critique-figma <url-del-frame>` | Trae el frame de Figma (vía MCP) y lo audita |
| `/slop-check` | Rápido — solo el Slop Score, sin análisis completo |

Frases que también activan la Skill: *"review this design"*, *"is this AI slop?"*, *"audit this UI"*, *"¿esta pantalla tiene cara de IA?"*.

---

## Usarlo dentro de un proyecto específico

La Skill ya funciona en cualquier chat. Pero si quieres que **el proyecto en sí**
cargue las reglas (para que tus colaboradores las hereden, y para que el agente
lea el protocolo desde disco), ejecuta dentro de la carpeta del proyecto:

```bash
cd ~/ruta/a/tu/proyecto
anti-slop
```

Esto crea, dentro del proyecto:

```
tu-proyecto/
├── .cursorrules              reglas para Cursor y VS Code
├── .claude/
│   └── CLAUDE.md             reglas para Claude Code
├── .anti-slop/
│   ├── core/                 filosofía + reglas + checklist
│   └── critique/             protocolo + template
└── PROJECT.md                brief del proyecto (no se sobrescribe si ya existe)
```

Rellena `PROJECT.md` una vez. La Skill lo lee cada vez que ejecutes `/critique`.

---

## Claude.ai (web / escritorio)

No hay instalador local para Claude.ai. Setup es una vez, por copy-paste:

1. Abre [claude.ai](https://claude.ai) y crea un nuevo **Project**
2. Ve a **Project instructions**
3. Pega el contenido de [`templates/CLAUDE.md`](./templates/CLAUDE.md)
4. Guarda

Desde aquí, cualquier conversación en ese Project sigue las reglas anti-slop.

---

## Mantenerlo actualizado

Cuando quieras traer mejoras del repo:

```bash
cd ~/anti-slop-os && git pull
```

La Skill fue instalada vía symlink — se actualiza sola en Cursor y Claude Code.
Los archivos copiados en otros proyectos **no** se sobrescriben automáticamente;
ejecuta `anti-slop` otra vez dentro del proyecto si quieres actualizar
`.cursorrules`, `CLAUDE.md` y `.anti-slop/`. `PROJECT.md` nunca se sobrescribe.

---

## Idiomas

Reglas, protocolo y docs están traducidos:

| Idioma | Core | Crítica | README |
|---|---|---|---|
| Español (ES) | [`core/es/`](./core/es/) | [`critique/es/`](./critique/es/) | este archivo |
| Inglés (EN) | [`core/en/`](./core/en/) | [`critique/en/`](./critique/en/) | [README.md](./README.md) |
| Portugués (PT) | [`core/`](./core/) | [`critique/`](./critique/) | [README.pt.md](./README.pt.md) |

El agente elige el idioma según el contexto de la conversación. Si escribes el
brief en español, la crítica vuelve en español.

---

## Estructura del repo

```
anti-slop-os/
├── SKILL.md                 punto de entrada de la Skill (lo lee el agente)
├── core/
│   ├── PHILOSOPHY.md        la "filosofía". lectura única.
│   ├── RULES.md             reglas operativas (tipo, color, espacio, motion)
│   ├── CHECKLIST.md         gate de calidad antes de entregar
│   ├── en/                  versiones en inglés
│   └── es/                  versiones en español
├── critique/
│   ├── PROTOCOL.md          cómo se conduce una Design Critique
│   ├── TEMPLATE.md          formato del output de la crítica
│   ├── en/                  versiones en inglés
│   └── es/                  versiones en español
├── templates/
│   ├── .cursorrules         va a la raíz de cada proyecto
│   ├── CLAUDE.md            va a .claude/ de cada proyecto
│   └── PROJECT.md           brief del proyecto (se rellena una vez)
└── scripts/
    ├── init.sh              prepara un proyecto (crea los archivos de arriba)
    ├── install-skill.sh     instala la Skill en Cursor + Claude Code
    └── test-setup.sh        valida que todo está en su sitio
```

---

## Documentación

| Archivo | Qué encontrarás dentro |
|---|---|
| [docs/TEST-GUIDE.md](./docs/TEST-GUIDE.md) | Test práctico de 15 min (sin programar) |
| [core/PHILOSOPHY.md](./core/PHILOSOPHY.md) | El "porqué" — verdades operativas detrás de la Skill |
| [core/RULES.md](./core/RULES.md) | Todas las reglas anti-slop (tipo, color, espacio, layout, motion, componentes) |
| [core/CHECKLIST.md](./core/CHECKLIST.md) | Gate de calidad pre-entrega (AI Slop Score) |
| [critique/PROTOCOL.md](./critique/PROTOCOL.md) | Cómo se conduce una Design Critique |

---

## Problemas comunes

**`fatal: destination path '...' already exists and is not an empty directory.`**
Ya habías clonado antes. Ejecuta `rm -rf ~/anti-slop-os` y reintenta el `git clone`.

**`/critique` no aparece en Cursor / Claude Code.**
Cierra y abre la app por completo. Las Skills solo aparecen después de reiniciar.

**`bash: ...install-skill.sh: No such file or directory`**
Tu clon está desactualizado. Ejecuta `cd ~/anti-slop-os && git pull`.

**Quiero desinstalar.**
Borra los symlinks: `rm -rf ~/.cursor/skills/anti-slop-os ~/.claude/skills/anti-slop-os`.
Y borra la carpeta: `rm -rf ~/anti-slop-os`.

---

## Resumen de situaciones

| Situación | Comando |
|---|---|
| Primera vez en la máquina | `git clone` + `install-skill.sh` |
| Proyecto nuevo | `cd proyecto && anti-slop` |
| Proyecto existente | `cd proyecto && anti-slop` + rellenar PROJECT.md |
| Actualizar reglas | `cd ~/anti-slop-os && git pull` |
| Design Critique | `/critique` en Cursor o Claude |
| Crítica de Figma | `/critique-figma <url>` en Cursor o Claude |
| Sincronizar otra máquina | Pasos 1, 2 y 3 allá también |
