---
description: Generate UI with anti-AI-signature guardrails — intent gate, grid, contrast, no slop
argument-hint: "[screen | landing | component to design] [--report]"
---

Generate, with guardrails, for: $ARGUMENTS

Use the `anti-slop-os` skill. Load `core/GENERATION.md` (the generation flow) +
`core/RULES.md` (the ruler). Do not read everything up front.

Run the 4-phase flow:
1. **Intent (hybrid)** — ask the 2–3 essential questions for the target. If unanswered,
   assume a default, declare it, and proceed. Never block on silence.
2. **Decision lock** — declare tension axis, type (pairing + ratio + weights), color
   (3 roles + accent), GRID (columns + vertical rhythm), motion. One justified line each.
3. **AI-signature firewall** — scan your own draft against the tell table in
   `core/GENERATION.md`. Any tell without declared intent → fix before emitting. Confirm:
   grid present, contrast audited, scale with a ratio, no mono-aesthetic, no tiny fonts.
4. **Generation gate** — the ONE bold move; not generatable without direction. If
   lukewarm, redo bolder.

If this is a Nu / NuDS product (or `PROJECT.md` has `Contexto Nu: [x] sim`), behave as
`/nu-design` instead (adds the NuDS token gate).

For a web page / landing: force rhythm, dynamics, contrast, intent, Nielsen heuristics and
WCAG AA — and help justify each decision.

End with "Your call": 1–2 paths + recommendation anchored in a principle.
With `--report`, fill `critique/report-template.html` and save `slop-report.html`.
