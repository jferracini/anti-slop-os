---
description: Fast slop gut-check — score + 1 sentence + 1 fix, no tables
argument-hint: "[screen | url | file]"
---

Run a fast slop check on: $ARGUMENTS

Use the `anti-slop-os` skill, Quick mode only. Load just `critique/PROTOCOL.md`
(Output modes -> Quick) and, if the input is a Figma/web/PDF/slides/image, route via
`critique/INPUT.md` first.

Return exactly this, nothing more:
```
Slop Score: X/10 — [the single heaviest item]
Decision: [the one most important, specific fix]
```
No audit table, no layer-by-layer. Never invent content — if you can't see it, ask.
