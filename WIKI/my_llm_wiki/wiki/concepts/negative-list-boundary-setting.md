---
type: concept
title: Negative List / Boundary Setting
tags: [documentation, product-management, scope-management, decision-making]
related: [what-not-document, architecture-decision-records-adr]
created: 2026-06-21
updated: 2026-06-21
sources: ["Journals/What not 文档.md"]
---

# Negative List / Boundary Setting

**Negative List / Boundary Setting** is a documentation and decision-making technique that uses a list of explicit exclusions to define the boundaries of a product, architecture, or API. It is the core mechanism behind the [[what-not-document]].

## Mechanism

Instead of defining what a system *is* (which can be open-ended), a negative list defines what it *is not*. This transforms ambiguous questions ("Can we support X?") into binary decisions ("Is X on our negative list?").

## Value

- **Clarity:** Provides unambiguous boundaries for scope.
- **Efficiency:** Reduces repetitive discussions by providing pre-agreed answers.
- **Focus:** Reinforces team priorities by explicitly stating what is not a priority.

## Relationship to ADRs

While [[architecture-decision-records-adr]] record the *why* behind a specific decision, a negative list aggregates multiple rejections into a single, accessible document for a broader audience. The negative list is the output; ADRs are the supporting rationale.