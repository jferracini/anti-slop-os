# DESIGN CRITIQUE PROTOCOL

## Uso

Envie uma tela, slide, frame ou componente com o comando:
`/critique [contexto opcional]`

A entrada pode ser Figma, web, PDF, slides ou imagem — veja `critique/INPUT.md`
para rotear antes de criticar.

---

## Modos de saída

**Quick (default).** Lidere pela decisão, não pela tabela. É o que `/critique`
entrega por padrão e o que `/slop-check` sempre faz.

`/slop-check` = só o essencial, em 3 linhas:
```
Slop Score: X/10 — [o item que mais pesa]
Decisão: [a única correção mais importante, específica]
```
Sem tabela, sem audit camada a camada. Se o usuário quiser o resto, ele pede.

`/critique` quick = First read (2 linhas) + Slop Score + os 1–3 problemas reais
(pule camadas CHECK) + Direção. Sem tabela completa a menos que ajude.

**Full (`--full`).** O laudo completo abaixo: audit camada a camada em tabela,
top 3 com causa raiz, direção e o que preservar. Use só quando pedido.

**Report (`--report`).** Renderize o resultado como página visual: preencha
`critique/report-template.html` com os dados reais (nunca invente score) e salve
`slop-report.html`. Ver comando `/report`.

Em ambos os modos: marque camadas OK como `CHECK` e não as detalhe.

> **Gerar novo design (não criticar)?** Use `/design` — roda o firewall anti-assinatura
> de AI antes de emitir (ver `core/GENERATION.md`). Critique conserta depois; geração com
> guardrail evita o slop nascer.

---

## O que analisar (em ordem)

### 1. FIRST READ — impressão sem análise
O que a peça comunica em 3 segundos?
O que não comunica e deveria?

### 2. AI SLOP SCAN
Identifique padrões da lista proibida presentes.
Dê o AI SLOP SCORE com justificativa por item.

### 3. AUDIT POR CAMADA

Para cada camada, use **CHECK / 🟡 / 🔴** (ou Yellow / Red em texto).

- **CHECK** = está OK, não precisa mexer. Só marque CHECK e siga para a próxima camada.
- **Yellow** = atenção, considerar mexer (descreva o porquê em 1 linha).
- **Red** = problema real, precisa mexer (descreva o problema em 1-2 linhas).

Não detalhe camadas CHECK. O ponto é direcionar atenção para o que precisa mudar.


**Tipografia**
- Qual fonte? Justificada?
- Tamanho mínimo respeitado?
- Hierarquia legível?
- Ratio consistente?
- Monospace: tem função ou é decorativo?

**Cor**
- Quantos papéis? Definidos?
- Accent cria tensão ou conforto?
- Paleta tem identidade ou parece temporal?

**Spacing**
- Sistema identificável?
- Algum valor arbitrário?
- Ritmo vertical consistente?

**Layout**
- Eixo de tensão presente?
- Centralização justificada?
- Grid-break ou assimetria intencional?

**Motion (se aplicável)**
- Easing: padrão ou autoral?
- Cada animação tem intenção declarada?
- prefers-reduced-motion considerado?

**Acessibilidade**
- Contraste texto ≥4.5:1? Componentes UI ≥3:1?
- Cor é único diferenciador semântico em algum ponto?
- Estado de foco visível em todos os interativos?
- Hierarquia navegável via teclado?

### 4. DIAGNÓSTICO
3 problemas críticos, ordenados por impacto.
Cada um com: problema → causa raiz → correção específica.

### 5. DIREÇÃO DE CORREÇÃO
Não apenas "melhore isso".
Entregue a decisão: o que substituir, por quê, e qual direção tomar.

### 6. O QUE PRESERVAR
O que está funcionando e não deve ser tocado.
