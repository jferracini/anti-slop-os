<div align="center">

![anti-slop-os — a flat-lay of analog design-craft tools: a loupe, a floppy disk, a vintage mouse, a notebook, a Rotring pencil and printer's rulers](./assets/hero.png)

# anti-slop-os

**The Creative Director that lives inside your AI agent.**
Catches the "AI look" before the design ships.

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

And when you generate from scratch, `/design` runs the same ruler **at generation
time** — an anti-AI-signature firewall (intent gate → grid → contrast → self-scan) so
the slop never gets born, instead of only being caught after.

It does not replace formal design critique. It runs **before** that — in the
moment you're prototyping fast and don't even know yet what will become a Figma.

---

## Not a developer? You're fine.

You only need **three things**:

1. A **terminal** open (Mac: open the "Terminal" app; Windows: "PowerShell")
2. **git** installed ([download here](https://git-scm.com/downloads) if you don't have it)
3. **Cursor** or **Claude Code** — that's where the magic happens

Copy each code block below, paste in the terminal, press Enter. Done.

---

## Install in 3 steps

### Step 1 — Download anti-slop-os to your machine

Paste this in the terminal and press Enter:

```bash
git clone https://github.com/jferracini/anti-slop-os.git ~/anti-slop-os
```

> **What does this do?** Downloads the whole project to a folder called `anti-slop-os` in your home directory.
> Already have that folder and want to start clean? Run first: `rm -rf ~/anti-slop-os`

### Step 2 — Give the scripts permission to run

```bash
chmod +x ~/anti-slop-os/scripts/*.sh
```

> **What does this do?** Tells your system that those `.sh` files are executable.
> Without this, the next step fails.

### Step 3 — Install the Skill in Cursor and Claude Code

```bash
bash ~/anti-slop-os/scripts/install-skill.sh
```

> **What does this do?** Hooks anti-slop-os into your Cursor and Claude Code.
> From now on, any chat in those agents can run `/critique`.

You should see something like:

```
→ Anti-Slop OS — Skill install

  ✓ Cursor: symlinked → ~/.cursor/skills/anti-slop-os/SKILL.md
  ✓ Claude Code: symlinked → ~/.claude/skills/anti-slop-os/SKILL.md

  Skill is now installed for Cursor and Claude Code.
```

### Step 4 (optional, recommended) — Create a shortcut command

```bash
echo 'alias anti-slop="bash ~/anti-slop-os/scripts/init.sh"' >> ~/.zshrc
source ~/.zshrc
```

> **What does this do?** Creates a short command called `anti-slop` you can use
> inside any project (next section). Without it, you'd have to type the full path
> every time.
>
> Using bash instead of zsh? Replace `~/.zshrc` with `~/.bashrc` in both commands.

---

## How to use it

### Restart Cursor and Claude Code

Quit and reopen them. That makes the Skill show up.

### Try it in any chat

Open any project in Cursor or Claude Code. In the chat, type:

```
/critique

Imagine a SaaS landing page with centered hero, purple-pink gradient,
Inter font, three identical feature cards, "Get Started" button in the middle.
```

You'll get back:

- An **AI Slop Score** from 0 to 10
- A layer-by-layer audit (typography, color, spacing, layout, motion)
- The top 3 worst problems with concrete fixes
- A clear direction to resolve them

Items that are OK come back as `CHECK` — no filler.

### Other commands

| Command | What it does |
|---|---|
| `/critique` | Full structured critique (Slop Score + audit + top 3 + direction) |
| `/critique-figma <frame-url>` | Pulls the frame via Figma MCP and audits it |
| `/slop-check` | Quick — just the Slop Score, no full analysis |
| `/design [screen \| landing \| component]` | Generate new UI through the anti-AI-signature guardrail |
| `/report` | Turn any critique into a friendly, shareable visual HTML report |

Natural-language triggers also work: *"review this design"*, *"is this AI slop?"*, *"audit this UI"*.

### Generate, don't just critique

`/critique` catches slop after the fact. `/design` stops it from being born:

```
/design a pricing page for a developer tool
```

It runs a 4-phase flow — an intent gate (asks the 2–3 essential questions), a decision
lock (type, color, grid, motion — one justified line each), an **anti-AI-signature
firewall** it runs on its own draft, and a final "one bold move" gate — then hands you
the result plus the decisions behind it. Add `--report` to also get a visual report.

### Turn a critique into a visual report

Want something you can share or drop into a deck? After any critique, run:

```
/report
```

It renders the critique as a clean, friendly **HTML page** — the AI Slop Score, the audit
layers (Type, Color, Spacing, Layout, Motion, A11y), and the top fixes — and saves it as
`slop-report.html` in your project. Open it with `open slop-report.html`.

The report never invents a score: it only renders what the critique actually produced.
You can also trigger it inline with `/critique --report`.

---

## Use it inside a specific project

The Skill already works in any chat. But if you want **the project itself** to
carry the rules (so collaborators inherit them, and the agent reads the protocol
from disk), run it inside the project folder:

```bash
cd ~/path/to/your/project
anti-slop
```

This creates:

```
your-project/
├── .cursorrules              ← rules for Cursor and VS Code
├── .claude/
│   └── CLAUDE.md             ← rules for Claude Code
├── .anti-slop/
│   ├── core/                 ← philosophy + rules + checklist
│   └── critique/             ← protocol + template
└── PROJECT.md                ← project brief (preserved if it already exists)
```

Fill out `PROJECT.md` once. The Skill reads it on every `/critique`.

---

## Claude.ai (web/desktop)

There's no local installer for Claude.ai. Setup is one-time copy-paste:

1. Open [claude.ai](https://claude.ai) and create a new **Project**
2. Go to **Project instructions**
3. Paste the content of [`templates/CLAUDE.md`](./templates/CLAUDE.md)
4. Save

From now on, every conversation in that Project follows the anti-slop rules.

---

## Keep it up to date

Whenever you want to pull improvements from the repo:

```bash
cd ~/anti-slop-os && git pull
```

The Skill was installed via symlink — it auto-updates in Cursor and Claude Code.
Per-project files in your other repos refresh next time you run `anti-slop`.
`PROJECT.md` is never overwritten.

---

## Languages

Rules, critique protocol, and docs are localized:

| Language | Core | Critique | README |
|---|---|---|---|
| Portuguese (PT) | [`core/`](./core/) | [`critique/`](./critique/) | [README.pt.md](./README.pt.md) |
| English (EN) | [`core/en/`](./core/en/) | [`critique/en/`](./critique/en/) | this file |
| Spanish (ES) | [`core/es/`](./core/es/) | [`critique/es/`](./critique/es/) | [README.es.md](./README.es.md) |

The agent picks the language from your conversation context. Write the brief in
Portuguese, the critique comes back in Portuguese. Mixing is fine.

---

## Repo structure

```
anti-slop-os/
├── SKILL.md                 Skill entry point (read by the agent)
├── commands/
│   ├── critique.md          /critique — full structured critique
│   ├── slop-check.md        /slop-check — quick Slop Score only
│   ├── design.md            /design — generate UI through the guardrail
│   └── report.md            /report — render a critique as a visual report
├── core/
│   ├── PHILOSOPHY.md        the "why". read once.
│   ├── RULES.md             operational rules (type, color, space, motion)
│   ├── CHECKLIST.md         pre-delivery quality gate
│   ├── GENERATION.md        the generation guardrail + anti-AI-signature firewall
│   ├── en/                  English versions
│   └── es/                  Spanish versions
├── critique/
│   ├── PROTOCOL.md          how a Design Critique is conducted
│   ├── TEMPLATE.md          critique output format
│   ├── INPUT.md             routes Figma / web / image / PDF inputs
│   ├── report-template.html the HTML report /report fills in
│   ├── en/                  English versions
│   └── es/                  Spanish versions
├── templates/
│   ├── .cursorrules         goes to the project root
│   ├── CLAUDE.md            goes to .claude/ in each project
│   └── PROJECT.md           project brief (filled once)
└── scripts/
    ├── init.sh              sets up a project (creates the files above)
    ├── install-skill.sh     installs the Skill in Cursor + Claude Code
    └── test-setup.sh        validates the install
```

---

## Documentation

| File | What you'll find |
|---|---|
| [docs/TEST-GUIDE.md](./docs/TEST-GUIDE.md) | 15-min hands-on test (no programming) |
| [core/PHILOSOPHY.md](./core/PHILOSOPHY.md) | The "why" — operational truths behind the Skill |
| [core/RULES.md](./core/RULES.md) | All anti-slop rules (typography, color, spacing, layout, motion, components) |
| [core/CHECKLIST.md](./core/CHECKLIST.md) | Pre-delivery quality gate (AI Slop Score) |
| [core/GENERATION.md](./core/GENERATION.md) | The generation guardrail + anti-AI-signature firewall (used by `/design`) |
| [critique/PROTOCOL.md](./critique/PROTOCOL.md) | How a Design Critique is conducted |
| [critique/report-template.html](./critique/report-template.html) | The HTML template `/report` fills with real critique data |

---

## Common issues

**`fatal: destination path '...' already exists and is not an empty directory.`**
You cloned before. Run `rm -rf ~/anti-slop-os` and try `git clone` again.

**`/critique` doesn't show up in Cursor / Claude Code.**
Quit and reopen the app entirely. Skills only appear after a restart.

**`bash: ...install-skill.sh: No such file or directory`**
Your clone is outdated. Run `cd ~/anti-slop-os && git pull`.

**Want to uninstall?**
Remove the symlinks: `rm -rf ~/.cursor/skills/anti-slop-os ~/.claude/skills/anti-slop-os`.
Then remove the folder: `rm -rf ~/anti-slop-os`.

---

## Quick reference

| Situation | Command |
|---|---|
| First time on a machine | `git clone` + `install-skill.sh` |
| New project | `cd project && anti-slop` |
| Existing project | `cd project && anti-slop` + fill PROJECT.md |
| Update rules | `cd ~/anti-slop-os && git pull` |
| Design Critique | `/critique` in Cursor or Claude |
| Figma critique | `/critique-figma <url>` in Cursor or Claude |
| Generate new UI | `/design <screen \| landing \| component>` |
| Visual report | `/report` (or `/critique --report`) |
| Sync another machine | Steps 1, 2, and 3 there too |

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
