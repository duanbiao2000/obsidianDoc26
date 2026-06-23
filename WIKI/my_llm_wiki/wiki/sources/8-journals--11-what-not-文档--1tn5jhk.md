---
type: source
title: "What Not Document: A Guide to Defining Project Boundaries"
tags: [documentation, software-engineering, product-management, scope-management]
related: [what-not-document, architecture-decision-records-adr, l7-level-technical-documentation-priority-model, onboarding-roi, search-oriented-operation, system-mental-model-documentation-engineering]
created: 2026-06-21
updated: 2026-06-21
sources: ["Journals/What not 文档.md"]
---

# What Not Document: A Guide to Defining Project Boundaries

This source is a prescriptive guide on the "What Not" document, a documentation practice for software engineering teams. It defines the document as a formal artifact that explicitly states what a project or product deliberately does not do, does not support, or excludes. The core argument is that using a "negative list" to define boundaries prevents feature creep, reduces repetitive discussions, clarifies team priorities, and accelerates new employee onboarding.

## Key Concepts Introduced

- **What Not Document:** A document that uses a list of exclusions to define the boundaries of a product, architecture, or API.
- **Negative List / Boundary Setting:** The core mechanism of transforming open-ended questions into binary yes/no decisions.
- **Feature Creep Prevention:** The primary claimed benefit of the document.
- **Focus Framing:** Reframing "we don't do X" as "we focus on A and B, therefore we don't do C" to avoid a negative tone.

## Three Forms

The source identifies three common forms of What Not documents:

1.  **Product What Not:** Lists features the product deliberately excludes (e.g., Slack not doing end-to-end encryption, GitHub not building a code editor).
2.  **Technical Architecture What Not:** Documents technology choices by listing rejected alternatives and the reasons (e.g., choosing PostgreSQL over MongoDB, MySQL, or Cassandra).
3.  **API Design What Not:** Specifies protocols, methods, and patterns the API does not support (e.g., not supporting SOAP, GraphQL, or custom HTTP verbs).

## Practical Applications

The source provides three scenarios demonstrating the document's value:

- **Requirements Meeting:** A product manager's proposal for offline editing is quickly rejected by referencing the What Not document, saving weeks of design work.
- **New Employee Onboarding:** A new engineer's question about GraphQL support is answered in one minute by pointing to the document.
- **Customer Communication:** A salesperson uses the document to professionally explain why local deployment is not supported, offering an alternative.

## Template Structure

The source provides a template with sections for core unsupported features, technology stack limitations, service scope boundaries, and maintenance/update information.

## Relationship to Other Documents

The source explicitly links What Not documents to:

- **Product Planning Documents:** Together they form a complete product scope definition.
- **Technical Decision Documents (ADRs):** What Not documents explain the "why" behind rejections, complementing ADRs.
- **Roadmaps:** Together they represent strategic commitments — what will be done and what will not be done.

## Evidence Strength

The source is a prescriptive guide, not an empirical study. Its evidence is weak to moderate, relying on hypothetical examples and logical reasoning. The claim of "saving 30+ hours of meeting time" is an unsubstantiated rhetorical estimate.

## Internal Tensions

- **Negativity vs. Focus:** The document warns against being "too negative" but its structure is inherently negative. The suggested resolution ("we focus on A and B, therefore we don't do C") is not structurally enforced in the templates.
- **Stability vs. Currency:** The document advocates for regular review (quarterly/annually) but also positions the What Not as a "constitution" providing stable, long-term guidance.

## Connections to Existing Wiki

- [[architecture-decision-records-adr]] — What Not documents are positioned as complementary artifacts that record the causality of design decisions.
- [[l7-level-technical-documentation-priority-model]] — The What Not document serves strategic-level documentation needs (defining product philosophy, preventing scope creep) while also having operational value (onboarding, customer communication).
- [[onboarding-roi]] — The document explicitly claims to accelerate onboarding by providing quick answers to "why don't we use X?" questions.
- [[search-oriented-operation]] — The document implicitly assumes users will search for "do we support X?" — the What Not document serves as the authoritative answer source.
- [[system-mental-model-documentation-engineering]] — The document helps build a correct mental model of the system by explicitly stating what is NOT part of it.