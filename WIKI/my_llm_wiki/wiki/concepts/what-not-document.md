---
type: concept
title: What Not Document
tags: [documentation, software-engineering, product-management, scope-management]
related: [architecture-decision-records-adr, l7-level-technical-documentation-priority-model, onboarding-roi, search-oriented-operation, system-mental-model-documentation-engineering]
created: 2026-06-21
updated: 2026-06-21
sources: ["Journals/What not 文档.md"]
---

# What Not Document

A **What Not Document** is a documentation artifact that explicitly states what a project, product, or system deliberately does not do, does not support, or excludes. It uses a "negative list" to define boundaries, transforming open-ended questions into binary yes/no decisions.

## Core Purpose

The primary purpose of a What Not document is to prevent [[feature creep]] by providing an authoritative, pre-agreed list of exclusions. This reduces repetitive discussions, clarifies team priorities, and accelerates new employee onboarding by providing quick answers to "why don't we use X?" questions.

## Three Forms

1. **Product What Not:** Lists features the product deliberately excludes (e.g., "We do not support offline mode because our core is cloud sync").
2. **Technical Architecture What Not:** Documents technology choices by listing rejected alternatives and the reasons (e.g., "We chose PostgreSQL over MongoDB because our data is highly structured").
3. **API Design What Not:** Specifies protocols, methods, and patterns the API does not support (e.g., "We do not support SOAP or GraphQL").

## Template Structure

A typical What Not document includes:

- **Core Unsupported Features:** List of features not supported, with reasons and alternatives.
- **Technology Stack Limitations:** Technologies deliberately not used, with rationale and replacements.
- **Service Scope Boundaries:** Scenarios not supported, with impact and recommended directions.
- **Maintenance & Updates:** Last review date, next review date, and owner.

## Relationship to Other Documentation

- [[architecture-decision-records-adr]] — What Not documents are complementary to ADRs. ADRs record *why* a decision was made; What Not documents aggregate *what was rejected* for a broader audience.
- [[l7-level-technical-documentation-priority-model]] — What Not documents serve strategic-level documentation needs (defining product philosophy, preventing scope creep) while also having operational value (onboarding, customer communication).
- [[onboarding-roi]] — The document accelerates onboarding by providing quick answers to "why don't we use X?" questions.
- [[search-oriented-operation]] — The document serves as the authoritative answer source for users searching "do we support X?".
- [[system-mental-model-documentation-engineering]] — The document helps build a correct mental model of the system by explicitly stating what is NOT part of it.

## Key Tensions

- **Negativity vs. Focus:** The document's structure is inherently negative ("we don't do X"). The recommended framing ("we focus on A and B, therefore we don't do C") is not structurally enforced.
- **Stability vs. Currency:** The document should provide stable, long-term guidance (like a "constitution") but also requires regular review (quarterly/annually) to remain relevant.

## Open Questions

- How does a What Not document differ from a simple "FAQ" or "Known Limitations" page?
- What is the maintenance burden of a What Not document?
- How does a What Not document interact with a product roadmap when a roadmap item contradicts a What Not item?
- Is the "30+ hours saved" claim realistic, or is it a rhetorical device?