---
description: Anti-slop design critique (quick by default; --full for the full report)
argument-hint: "[screen | url | file] [--full]"
---

Run an anti-slop critique on: $ARGUMENTS

Use the `anti-slop-os` skill. Load on demand — do not read everything up front:

1. If the target is a Figma URL, web URL, PDF, slides, or image, route it first via
   `critique/INPUT.md` (or `.anti-slop/critique/INPUT.md` if present). Never invent
   content — if you cannot see the real artifact, ask for it and stop.
2. Load `core/RULES.md` (the rules) + `critique/PROTOCOL.md` (how to critique).
3. If Nu context applies (`PROJECT.md` has `Contexto Nu: [x] sim`, or this is a Nu / NuDS
   product), behave as `/nu-critique` instead.
4. Quick mode by default: lead with the decision, mark OK layers `CHECK`, no full table.
   Use `--full` only when the argument includes `--full`.
