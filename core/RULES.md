# ANTI-SLOP RULES — OPERATIONAL

## TYPOGRAPHY

- PROIBIDO como default: Inter, Roboto, Arial, Space Grotesk, DM Sans
- PROIBIDO: monospace como estética decorativa sem função semântica
- PROIBIDO: body text abaixo de 15px em contextos de leitura
- OBRIGATÓRIO: justificar escolha tipográfica em 1 linha antes de usar
- OBRIGATÓRIO: escala com ratio definido (1.25 / 1.414 / 1.618 — escolha um)
- OBRIGATÓRIO: mínimo 3 pesos com papel semântico distinto
- Fonte display e fonte de texto devem criar tensão entre si, não harmonia

## COLOR

- Máximo: 3 papéis (background / surface / foreground) + 1 accent
- PROIBIDO: gradiente como substituto de cor
- PROIBIDO: glow azul/roxo/verde genérico
- PROIBIDO: glassmorphism sem justificativa narrativa
- OBRIGATÓRIO: definir o que cada cor *comunica*, não apenas onde aparece
- Accent deve criar tensão — não conforto
- Paleta deve ser atemporal: se parecer "AI SaaS 2024", rejeitar

## SPACING

- Sistema baseado em múltiplos de 4pt ou 8pt — nenhum valor arbitrário
- PROIBIDO: margin/padding fora do sistema
- Ritmo vertical deve ser auditável
- Respiro intencional ≠ espaço vazio aleatório

## LAYOUT & COMPOSIÇÃO

- PROIBIDO: centralizar tudo sem intenção declarada
- PROIBIDO: bento grid sem hierarquia de leitura definida
- PROIBIDO: hero section sem decisão visual não-óbvia
- PROIBIDO: cards onde lista resolveria
- OBRIGATÓRIO: definir eixo de tensão da composição antes de montar
- Assimetria controlada > simetria automática
- Grid-breaking com propósito > layout seguro

## MOTION

- PROIBIDO: fade-in como default sem intenção
- PROIBIDO: animações que replicam Framer/Linear/Vercel sem desvio
- OBRIGATÓRIO: cada animação responde "o que isso comunica?"
- Easing deve ter personalidade — não apenas ease-in-out genérico
- OBRIGATÓRIO: respeitar prefers-reduced-motion — toda animação oferece alternativa estática
- 1 momento de animação bem executado > 10 micro-interações medianas

## COMPONENTES

- Nenhum componente existe sem responder: qual problema resolve neste contexto?
- PROIBIDO: copiar padrões de Stripe, Linear, Notion, Vercel como referência direta
- Inspire-se. Não replique.

## ACESSIBILIDADE

- Contraste mínimo 4.5:1 para texto, 3:1 para componentes UI e estados
- PROIBIDO: cor como único diferenciador semântico
- OBRIGATÓRIO: estado de foco visível em todos os elementos interativos
- OBRIGATÓRIO: hierarquia de leitura navegável via teclado
- Assimetria e grid-breaks devem permanecer navegáveis — tensão visual não pode bloquear acesso
- prefers-reduced-motion: toda animação tem alternativa estática ou reduzida

## OUTPUT GATE — obrigatório antes de qualquer entrega

Responda os 3:
1. Qual é a tensão visual desta solução?
2. O que aqui não poderia ser gerado por um modelo sem direção humana?
3. Qual elemento foi intencionalmente NÃO otimizado?

Se não tiver resposta para os 3: não entregue. Reestruture.
