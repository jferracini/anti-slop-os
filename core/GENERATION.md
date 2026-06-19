# GERAÇÃO COM GUARDRAIL — nascer autoral, não slop

> Camada de **geração** (não de critique). Roda ANTES e DURANTE a criação de qualquer
> UI nova. Critique conserta depois; isto evita que a assinatura de AI nasça.
> Combina com `core/RULES.md` (a régua) — aqui está o **processo** que aplica a régua.

Acionada por `/design`, `/nu-design`, ou qualquer pedido de "crie / gere / monte" uma
tela, landing, página, componente ou protótipo.

---

## ASSINATURA DE AI — o firewall (escaneie o PRÓPRIO rascunho antes de emitir)

Estes são os tells de UI gerada por modelo em 2026. Antes de devolver qualquer código
ou layout, varra a sua própria saída contra esta lista. Tell presente **sem intenção
declarada** → corrija antes de entregar.

| # | Tell | Como detectar | Antídoto |
|---|---|---|---|
| 1 | Monospace como estética | fonte mono em título/corpo sem função de código/dado | mono só para código, número técnico, dado tabular |
| 2 | Traço largo em tudo | borda 1px+ em cada card/seção, "outline everything" | borda só onde separa significado; use espaço e cor |
| 3 | Fonte pequena | corpo < 15px, legenda < 12px | corpo ≥ 16px; escala com ratio |
| 4 | Sem grid | elementos flutuando, nenhuma coluna/baseline declarada | declare colunas + ritmo vertical antes de montar |
| 5 | Tudo centralizado | hero central + 3 cards + CTA (o layout default do modelo) | eixo de tensão; assimetria controlada com propósito |
| 6 | Gradiente / glow / glass decorativo | gradiente como cor, brilho neon, vidro fosco sem narrativa | cor sólida com papel; efeito só se comunica algo |
| 7 | Cinza-sobre-cinza | texto #999 em #fff, hierarquia por opacidade | contraste real ≥ 4.5:1; hierarquia por peso/tamanho |
| 8 | Emoji como ícone | 🚀 💡 ✨ como ícone de produto | ícone com escolha semântica, ou nenhum |
| 9 | Over-rounding / over-sharp | tudo pill, ou tudo 0px, sem intenção | raio é decisão; um valor dominante + exceções |
| 10 | Ícone stock default | Lucide/Heroicons no default sem escolha | escolha o conjunto e justifique; não o primeiro da lista |
| 11 | Espaçamento uniforme | mesmo gap em tudo, sem hierarquia | escala de espaço com ≥ 3 saltos; densidade varia |
| 12 | Dashboard chrome | cards/números sem dado real, "métrica fake" | só mostre dado que existe; senão, não invente UI de dado |
| 13 | Dark neon "AI SaaS" | fundo escuro + accent neon + glow | paleta com identidade, não o preset escuro genérico |

**O firewall obriga o oposto:** grid presente, contraste auditado, escala tipográfica
com ratio, sem mono-estética, sem fonte minúscula, densidade que varia entre seções.

---

## O FLUXO — 4 fases

Modo **híbrido**: faça as 2–3 perguntas essenciais da Fase 0. Se o usuário não responder,
**assuma um default e declare** ("assumi X — corrija se não for") e siga. Nunca trave por
silêncio; nunca gere no escuro.

### Fase 0 — Intenção (pergunta o essencial)
Detecte o alvo e faça só as perguntas daquele alvo (ver "Perguntas por alvo" abaixo).
Sem resposta → default declarado + segue.

### Fase 1 — Decision lock (declare antes de gerar)
Em uma linha cada, com justificativa:
- **Eixo de tensão** — a única tensão em torno da qual o design se organiza.
- **Tipografia** — par display/corpo + ratio (1.25 / 1.414 / 1.618) + 3 pesos semânticos.
- **Cor** — 3 papéis (background / surface / foreground) + 1 accent. (Nu: tokens NuDS.)
- **Grid** — colunas + ritmo vertical (a escala de espaço). Obrigatório declarar.
- **Motion** — intenção de 1 momento, com easing de personalidade (ou nenhum motion).

### Fase 2 — Token gate (só tela Nu)
Se for produto Nu para nubankers → ver `core/nu/TOKENS.md`. Caso contrário, pule.

### Fase 3 — Firewall (anti-assinatura)
Rode a varredura da tabela acima no próprio rascunho. Qualquer tell sem intenção
declarada → corrija. Confirme: grid presente · contraste auditado · escala com ratio ·
sem mono-estética · sem fonte minúscula.

### Fase 4 — Self-check + report (opcional)
Passe pelo Generation gate (abaixo). Com `--report`, preencha
`critique/report-template.html` e entregue o arquivo `slop-report.html`.

---

## PERGUNTAS POR ALVO

**Tela de produto Nu (para nubankers)** — token gate LIGADO
1. Qual superfície NuDS — Mobile, Web ou POS?
2. Qual o job-to-be-done do usuário nesta tela?
3. De qual flow ela faz parte (o que vem antes/depois)?

**Página web / Landing page** — heurísticas + ritmo OBRIGATÓRIOS
1. Qual é a **UMA** mensagem? (se forem três, não há foco)
2. Quem é o público e qual a **ação única** desejada?
3. Qual a sensação/tensão que a página precisa provocar?
→ Ajude a justificar cada decisão e force: ritmo, dinâmica, contraste, intenção,
heurísticas de usabilidade e acessibilidade (bloco abaixo).

**Componente isolado**
1. Que problema ele resolve neste contexto?
2. Onde ele vive e quais estados tem (default / hover / focus / loading / erro / vazio)?

**Exploração / side-project / teste**
Declare que é exploração. As regras de estilo afrouxam, mas a **assinatura de AI continua
banida** — exploração não é desculpa para slop.

---

## WEB / LANDING — o que forçar

- **Ritmo** — escala de espaçamento com ≥ 3 saltos. Nada de tudo com o mesmo gap.
- **Dinâmica** — densidade varia entre seções (respiro ↔ concentração), não uniforme.
- **Contraste** — hierarquia por tamanho **e** peso **e** cor, não só tamanho.
- **Intenção** — cada seção responde "por que existe e o que o olho faz aqui".
- **Nielsen (10 heurísticas)** — visibilidade de estado, match com o mundo real, controle
  e liberdade, consistência, prevenção de erro, reconhecer > lembrar, flexibilidade,
  estética minimalista, recuperação de erro, ajuda/documentação.
- **WCAG AA** — contraste ≥ 4.5:1, foco visível, navegação por teclado, alt em imagem,
  `prefers-reduced-motion`, cor nunca como único significado.

---

## GENERATION GATE — antes de entregar (anti-timidez)

Responda os 3:
1. Qual é a **UMA** jogada ousada e específica aqui? (três "talvez" não é uma decisão)
2. O que nesta peça **não poderia** sair de um modelo sem direção humana?
3. (Nu) Ainda parece Nu — e só Nu? (não outro banco, não "fintech genérica")

Se (1) for morna ou genérica: **refaça mais ousado antes de entregar.**

---

## SAÍDA

Entregue, nesta ordem:
1. As decisões da Fase 1, declaradas e justificadas (1 linha cada).
2. O código / artifact gerado.
3. (Nu) o bloco **Token compliance** (`core/nu/TOKENS.md`).
4. Termine SEMPRE com **Decisão que é sua** — 1–2 caminhos + recomendação ancorada em
   princípio. O designer escolhe e aprende a aplicar intenção na próxima.
