# REGLAS ANTI-SLOP — OPERATIVAS

> Fuente única de las reglas de craft. No duplicar en SKILL.md, .cursorrules o CLAUDE.md — esos archivos solo apuntan aquí.

## TIPOGRAFÍA

- PROHIBIDO como default: Inter, Roboto, Arial, Space Grotesk, DM Sans
- PROHIBIDO: monospace como estética decorativa sin función semántica
- PROHIBIDO: cuerpo de texto por debajo de 15px en contextos de lectura
- OBLIGATORIO: justificar la elección tipográfica en 1 línea antes de usar
- OBLIGATORIO: escala con ratio definido (1.25 / 1.414 / 1.618 — elige uno)
- OBLIGATORIO: mínimo 3 pesos con rol semántico distinto
- Fuente display y fuente de texto deben crear tensión entre sí, no armonía

## COLOR

- Máximo: 3 roles (background / surface / foreground) + 1 accent
- PROHIBIDO: gradiente como sustituto de una decisión de color
- PROHIBIDO: glow azul/púrpura/verde genérico
- PROHIBIDO: glassmorphism sin justificación narrativa
- OBLIGATORIO: definir qué *comunica* cada color, no solo dónde aparece
- El accent debe crear tensión — no comodidad
- La paleta debe ser atemporal: si parece "AI SaaS 2024", rechazar

## SPACING

- Sistema basado en múltiplos de 4pt u 8pt — ningún valor arbitrario
- PROHIBIDO: margin/padding fuera del sistema
- El ritmo vertical debe ser auditable
- Respiro intencional ≠ espacio vacío aleatorio

## LAYOUT Y COMPOSICIÓN

- PROHIBIDO: centrar todo sin intención declarada
- PROHIBIDO: bento grid sin jerarquía de lectura definida
- PROHIBIDO: hero section sin una decisión visual no obvia
- PROHIBIDO: cards donde una lista resolvería
- OBLIGATORIO: declarar el eje de tensión de la composición antes de montar
- Asimetría controlada > simetría automática
- Romper el grid con propósito > layout seguro

## MOTION

- PROHIBIDO: fade-in como default sin intención
- PROHIBIDO: animaciones que replican Framer/Linear/Vercel sin desviarse
- OBLIGATORIO: cada animación responde "¿qué comunica esto?"
- El easing debe tener personalidad — no solo ease-in-out genérico
- OBLIGATORIO: respetar prefers-reduced-motion — toda animación tiene alternativa estática
- 1 momento de animación bien ejecutado > 10 micro-interacciones mediocres

## COMPONENTES

- Ningún componente existe sin responder: ¿qué problema resuelve en este contexto?
- PROHIBIDO: copiar patrones de Stripe, Linear, Notion, Vercel como referencia directa
- Inspírate. No repliques.

## ACCESIBILIDAD

- Contraste mínimo 4.5:1 para texto, 3:1 para componentes UI y estados
- PROHIBIDO: color como único diferenciador semántico
- OBLIGATORIO: estado de foco visible en todos los elementos interactivos
- OBLIGATORIO: jerarquía de lectura navegable mediante teclado
- La asimetría y las rupturas de grid deben seguir siendo navegables — la tensión visual no puede bloquear el acceso
- prefers-reduced-motion: toda animación tiene alternativa estática o reducida

## OUTPUT GATE — obligatorio antes de cualquier entrega

Responde las 3:
1. ¿Cuál es la tensión visual de esta solución?
2. ¿Qué hay aquí que no podría generarse sin dirección humana?
3. ¿Qué elemento fue intencionalmente NO optimizado?

Si no tienes respuesta para las 3: no entregues. Reestructura.
