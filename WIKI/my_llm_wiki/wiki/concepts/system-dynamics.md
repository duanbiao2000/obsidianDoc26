---
type: concept
title: System Dynamics
created: 2026-06-22
updated: 2026-06-22
tags: [methodology, simulation, feedback, complexity, policy-analysis]
related: [endogenous-perspective, feedback-loops, stocks-and-flows, time-delays-in-systems, causal-loop-diagrams, group-model-building, hybrid-computational-techniques, jay-w-forrester]
sources: ["research-系統動力學-2026-06-22-072011.md"]
---
# System Dynamics

**System Dynamics (SD)** is a computer-aided approach to strategy development, policy analysis, and design. It employs simulation modeling grounded in feedback systems theory to understand and manage complex, dynamic systems characterized by interdependence, mutual interaction, information feedback, and circular causality.

Rather than isolating variables, System Dynamics examines how the internal architecture of a system generates its observed behavior over time. It treats systems as closed causal boundaries where behavior is explained endogenously through interactions among components, rather than as reactions to external exogenous shocks. The discipline bridges engineering, mathematics, and social sciences, providing both qualitative frameworks for mapping causal relationships and quantitative tools for simulating long-term trajectories under varying assumptions. Its primary value lies in exposing counterintuitive behaviors, unintended consequences, and latent feedback structures that conventional linear analysis often overlooks.

## Core Methodology

### Endogenous Perspective
A defining feature of System Dynamics is its commitment to endogenous explanation. System behavior is viewed as emerging from within the system's own structure, particularly through circular causality.

### Feedback Loops
Feedback loops are categorized into:
*   **Reinforcing (Positive) Loops:** Drive exponential growth, collapse, or self-amplification.
*   **Balancing (Negative) Loops:** Pursue goals, seek equilibrium, and regulate deviations, often producing oscillatory behavior when combined with delays.

Loop dominance—the shifting influence of different feedback structures over time—is typically driven by nonlinearities, allowing systems to transition between qualitatively different behavioral regimes.

### Stocks, Flows, and Time Delays
System structure is formally represented through three interdependent elements:
*   **Stocks (Levels):** Accumulations or state variables that record the system's memory (e.g., inventory, population, capital).
*   **Flows (Rates):** Actions that increase or decrease stocks over time, often governed by decision rules and information processing.
*   **Time Delays:** Inherent lags in physical processes, information transmission, or cognitive recognition that frequently cause overshooting, oscillation, and policy resistance.

## Modeling Tools
Methodologically, System Dynamics progresses through iterative stages: problem scoping, qualitative mapping, quantitative formulation, validation, and policy testing. Common graphical representations include:
*   **Causal Loop Diagrams (CLD):** Qualitative maps showing variables and feedback polarities.
*   **Stock-and-Flow Diagrams:** Quantitative architectures specifying accumulations, valves, converters, and auxiliary variables.

Formal models consist of coupled, nonlinear first-order differential or integral equations, solved via discrete-time stepping algorithms (e.g., Euler or Runge-Kutta methods). Specialized software platforms such as Vensim, STELLA, Powersim, and True World facilitate rapid scenario testing and interactive strategy sessions.

## Applications
Initially confined to corporate management and supply chain optimization, System Dynamics has since been applied across numerous sectors:
*   Public Policy & Urban Planning
*   Ecology & Environmental Management
*   Economics & Finance
*   Healthcare & Epidemiology
*   Safety & Organizational Resilience

Modern practice increasingly incorporates participatory Group Model Building (GMB) to align stakeholder mental models, and hybrid integrations with Agent-Based Modeling (ABM), Dynamic Neural Networks, fuzzy logic, and machine learning to address parametric uncertainty and scale limitations.

## Limitations
*   **Qualitative vs. Quantitative Tension:** In socio-economic contexts, achieving precise parameter estimation can be challenging due to data scarcity or behavioral volatility.
*   **Nonlinearity & Validation:** While nonlinear models capture shifting loop dominance, they can introduce computational stiffness and sensitivity to initial conditions. Rigorous testing remains essential but resource-intensive.
