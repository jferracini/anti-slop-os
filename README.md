<div align="center">

![anti-slop-os](./assets/cover.png)

# anti-slop-os

**Taste Design OS for the vibecoding era.**
An Agent Skill that catches AI slop before it ships.

[![Cursor](https://img.shields.io/badge/Cursor-supported-000000?style=for-the-badge&logo=cursor&logoColor=white)](https://cursor.sh)
[![Claude Code](https://img.shields.io/badge/Claude_Code-supported-D97757?style=for-the-badge&logo=anthropic&logoColor=white)](https://docs.anthropic.com/claude/docs/claude-code)
[![Claude.ai](https://img.shields.io/badge/Claude.ai-copy_paste-D97757?style=for-the-badge&logo=anthropic&logoColor=white)](https://claude.ai)
[![VS Code](https://img.shields.io/badge/VS_Code-supported-007ACC?style=for-the-badge&logo=visualstudiocode&logoColor=white)](https://code.visualstudio.com)

[![Languages](https://img.shields.io/badge/i18n-PT_·_EN_·_ES-blue?style=for-the-badge)](#languages)

[Português](./README.pt.md) · [Español](./README.es.md)

</div>

---

## What it is

A small, opinionated OS that runs **inside your AI agent** while you vibecode.
It works as an embedded Creative Director: every time you generate UI, it tests
the output against:

- **Anti-slop rules** — stops Inter-by-default, generic gradients, centered-everything, bento-without-hierarchy, and the rest of the "AI SaaS 2024" defaults
- **A scored critique protocol** — 0–10 AI Slop Score + layer-by-layer audit + concrete direction
- **An output gate** — three mandatory questions before any UI ships (visual tension, what couldn't be AI-generated, what was intentionally NOT optimized)

It does not replace formal design critique. It runs **before** that — in the
moment you're prototyping fast and don't even know yet what will become a Figma.

---

## Get Started in 60 seconds

Three steps. Copy-paste each block, one at a time.

### 1. Install

```bash
git clone git@github.com:jferracini/anti-slop-os.git ~/anti-slop-os
chmod +x ~/anti-slop-os/scripts/*.sh
echo 'alias anti-slop="bash ~/anti-slop-os/scripts/init.sh"' >> ~/.zshrc
source ~/.zshrc
bash ~/anti-slop-os/scripts/install-skill.sh
```

> Using bash? Replace `~/.zshrc` with `~/.bashrc`.

This installs the skill in **both Cursor and Claude Code** (symlinks — `git pull`
updates both at once).

### 2. Reload your agent

Quit and reopen **Cursor** and **Claude Code** so they detect the new skill.

### 3. Try it

Open any project in Cursor or Claude Code. In the chat, type:

```
/critique

Imagine a SaaS landing page with centered hero, purple-pink gradient,
Inter font, three identical feature cards, "Get Started" button in the
middle.
```

You should get back a structured critique with an AI Slop Score, a layer-by-layer
audit (Typography / Color / Spacing / Layout / Motion), the top 3 problems with
fixes, and a clear direction. Items that are OK come back as `CHECK` — no noise.

That's it. The skill is now alive in every project, every conversation, in any
agent that supports skills.

---

## Commands

| Command | What it does |
|---|---|
| `/critique` | Full structured critique (Slop Score + layer audit + top 3 + direction) |
| `/critique-figma <url>` | Pulls the frame via the Figma MCP and audits it |
| `/slop-check` | Quick — just the AI Slop Score, no full analysis |

Triggers also activate naturally: `"review this design"`, `"is this AI slop?"`,
`"audit this UI"`.

---

## How it works across agents

| Agent | How it activates | What you do |
|---|---|---|
| **Cursor** | Skill auto-loaded from `~/.cursor/skills/anti-slop-os/` | Nothing — just use `/critique` |
| **Claude Code** | Skill auto-loaded from `~/.claude/skills/anti-slop-os/` | Nothing — just use `/critique` |
| **VS Code** | Reads `.cursorrules` in the project root | Run `anti-slop` in the project once |
| **Claude.ai** (web/desktop) | Paste rules into Project instructions | See [Claude.ai setup](#claudeai-webdesktop-setup) |

### Claude.ai (web/desktop) setup

There's no local installer for Claude.ai. Setup is one-time copy-paste:

1. Open [claude.ai](https://claude.ai) and create a new **Project**
2. Go to **Project instructions**
3. Paste the content of [`templates/CLAUDE.md`](./templates/CLAUDE.md)
4. Save

From now on, every conversation in that Project follows the anti-slop rules.

---

## Per-project setup

The global skill works in any chat. But if you also want **the project itself**
to carry the rules (so collaborators get them too, and so the agent reads the
critique protocol from disk), run `anti-slop` inside the project:

```bash
cd ~/path/to/your/project
anti-slop
```

This creates:

```
your-project/
├── .cursorrules              ← Cursor + VS Code rules
├── .claude/
│   └── CLAUDE.md             ← Claude Code rules
├── .anti-slop/
│   ├── core/                 ← philosophy + rules + checklist
│   └── critique/             ← critique protocol + template
└── PROJECT.md                ← project brief (preserved if it already exists)
```

Fill out `PROJECT.md` once. The skill will read it on every `/critique`.

---

## Languages

Rules, critique protocol, and docs are localized:

| Language | Core | Critique | README |
|---|---|---|---|
| Portuguese (PT) | [`core/`](./core/) | [`critique/`](./critique/) | [README.pt.md](./README.pt.md) |
| English (EN) | [`core/en/`](./core/en/) | [`critique/en/`](./critique/en/) | this file |
| Spanish (ES) | [`core/es/`](./core/es/) | [`critique/es/`](./critique/es/) | [README.es.md](./README.es.md) |

The agent picks language from your conversation context. If you write the brief
in Portuguese, the critique comes in Portuguese. Mix is fine.

---

## Documentation

| File | What you'll find |
|---|---|
| [docs/TEST-GUIDE.md](./docs/TEST-GUIDE.md) | 15-min hands-on test (no programming) |
| [core/PHILOSOPHY.md](./core/PHILOSOPHY.md) | The "why" — operational truths behind the skill |
| [core/RULES.md](./core/RULES.md) | All anti-slop rules (typography, color, spacing, layout, motion, components) |
| [core/CHECKLIST.md](./core/CHECKLIST.md) | Pre-delivery quality gate (AI Slop Score) |
| [critique/PROTOCOL.md](./critique/PROTOCOL.md) | How a Design Critique is conducted |

---

## Update everything

```bash
cd ~/anti-slop-os && git pull
```

That's it. Symlinks make the skill auto-update in Cursor and Claude Code.
Per-project files in your other repos refresh next time you run `anti-slop`
(`PROJECT.md` is preserved — never overwritten).

---

## Contributing

This started as a personal tool. The hope is that it becomes a small commons
for anyone who vibecodes and cares about craft.

Every install, every test, every PR sharpens the taste ruler for everyone.
The rules, the critique protocol, the trigger phrases — everything here is up
for refinement.

- **Issues**: file them at [github.com/jferracini/anti-slop-os/issues](https://github.com/jferracini/anti-slop-os/issues)
- **PRs**: open one. Even small wording changes count.

Continuous craft learning with AI as a think partner. That's the bet.

---

<div align="center">

**Built by [@jferracini](https://github.com/jferracini) · For anyone vibecoding**

</div>
