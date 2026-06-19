# GENERATION WITH GUARDRAILS — born authored, not slop

> A **generation** layer (not critique). Runs BEFORE and DURING the creation of any new
> UI. Critique fixes afterwards; this stops the AI signature from being born.
> Combines with `core/RULES.md` (the ruler) — this is the **process** that applies it.

Triggered by `/design`, `/nu-design`, or any "create / generate / build" request for a
screen, landing page, page, component or prototype.

---

## AI SIGNATURE — the firewall (scan YOUR OWN draft before emitting)

These are the 2026 tells of model-generated UI. Before returning any code or layout,
scan your own output against this list. A tell present **without declared intent** → fix
it before delivering.

| # | Tell | How to detect | Antidote |
|---|---|---|---|
| 1 | Monospace as aesthetic | mono font in heading/body with no code/data function | mono only for code, technical number, tabular data |
| 2 | Wide strokes everywhere | 1px+ border on every card/section, "outline everything" | borders only where they separate meaning; use space and color |
| 3 | Tiny fonts | body < 15px, caption < 12px | body ≥ 16px; scale with a ratio |
| 4 | No grid | floating elements, no declared columns/baseline | declare columns + vertical rhythm before laying out |
| 5 | Everything centered | central hero + 3 cards + CTA (the model's default layout) | tension axis; controlled asymmetry with purpose |
| 6 | Decorative gradient / glow / glass | gradient as color, neon glow, frosted glass with no narrative | solid color with a role; effects only if they communicate |
| 7 | Gray-on-gray | #999 text on #fff, hierarchy by opacity | real contrast ≥ 4.5:1; hierarchy by weight/size |
| 8 | Emoji as icon | 🚀 💡 ✨ as product iconography | icon with a semantic choice, or none |
| 9 | Over-rounding / over-sharp | all pill, or all 0px, with no intent | radius is a decision; one dominant value + exceptions |
| 10 | Default stock icons | Lucide/Heroicons at default with no choice | pick the set and justify it; not the first in the list |
| 11 | Uniform spacing | same gap everywhere, no hierarchy | space scale with ≥ 3 steps; density varies |
| 12 | Dashboard chrome | cards/numbers with no real data, "fake metric" | only show data that exists; otherwise don't invent data UI |
| 13 | Dark neon "AI SaaS" | dark background + neon accent + glow | palette with identity, not the generic dark preset |

**The firewall forces the opposite:** grid present, contrast audited, type scale with a
ratio, no mono-as-aesthetic, no tiny fonts, density that varies between sections.

---

## THE FLOW — 4 phases

**Hybrid** mode: ask the 2–3 essential Phase 0 questions. If the user does not answer,
**assume a default and declare it** ("I assumed X — correct me if wrong") and proceed.
Never block on silence; never generate in the dark.

### Phase 0 — Intent (ask the essentials)
Detect the target and ask only that target's questions (see "Questions by target").
No answer → declared default + proceed.

### Phase 1 — Decision lock (declare before generating)
One line each, with justification:
- **Tension axis** — the single tension the design is organized around.
- **Typography** — display/body pairing + ratio (1.25 / 1.414 / 1.618) + 3 semantic weights.
- **Color** — 3 roles (background / surface / foreground) + 1 accent. (Nu: NuDS tokens.)
- **Grid** — columns + vertical rhythm (the space scale). Mandatory to declare.
- **Motion** — intent for 1 moment, with easing that has personality (or no motion).

### Phase 2 — Token gate (Nu screen only)
If it is a Nu product for nubankers → see `core/nu/TOKENS.md`. Otherwise, skip.

### Phase 3 — Firewall (anti-signature)
Run the table scan above on your own draft. Any tell without declared intent → fix.
Confirm: grid present · contrast audited · scale with a ratio · no mono-aesthetic ·
no tiny fonts.

### Phase 4 — Self-check + report (optional)
Pass the Generation gate (below). With `--report`, fill `critique/report-template.html`
and deliver the file `slop-report.html`.

---

## QUESTIONS BY TARGET

**Nu product screen (for nubankers)** — token gate ON
1. Which NuDS surface — Mobile, Web or POS?
2. What is the user's job-to-be-done on this screen?
3. Which flow is it part of (what comes before/after)?

**Web page / Landing page** — heuristics + rhythm REQUIRED
1. What is the **ONE** message? (if there are three, there is no focus)
2. Who is the audience and what is the desired **single action**?
3. What feeling/tension must the page provoke?
→ Help justify every decision and force: rhythm, dynamics, contrast, intent, usability
heuristics and accessibility (block below).

**Isolated component**
1. What problem does it solve in this context?
2. Where does it live and what states does it have (default / hover / focus / loading / error / empty)?

**Exploration / side-project / test**
Declare it is exploration. Style rules loosen, but the **AI signature stays banned** —
exploration is not an excuse for slop.

---

## WEB / LANDING — what to force

- **Rhythm** — spacing scale with ≥ 3 steps. No same-gap-everywhere.
- **Dynamics** — density varies between sections (breathing ↔ concentration), not uniform.
- **Contrast** — hierarchy by size **and** weight **and** color, not size alone.
- **Intent** — each section answers "why it exists and what the eye does here".
- **Nielsen (10 heuristics)** — system status visibility, match with the real world,
  control and freedom, consistency, error prevention, recognition > recall, flexibility,
  minimalist aesthetic, error recovery, help/documentation.
- **WCAG AA** — contrast ≥ 4.5:1, visible focus, keyboard navigation, image alt,
  `prefers-reduced-motion`, color never as the only meaning.

---

## GENERATION GATE — before delivering (anti-timidity)

Answer the 3:
1. What is the **ONE** bold, specific move here? (three "maybes" is not a decision)
2. What in this piece **could not** come from a model with no human direction?
3. (Nu) Does it still look Nu — and only Nu? (not another bank, not "generic fintech")

If (1) is lukewarm or generic: **redo it bolder before delivering.**

---

## OUTPUT

Deliver, in this order:
1. The Phase 1 decisions, declared and justified (1 line each).
2. The generated code / artifact.
3. (Nu) the **Token compliance** block (`core/nu/TOKENS.md`).
4. ALWAYS end with **Your call** — 1–2 paths + recommendation anchored in a principle.
   The designer chooses and learns to apply intent next time.
