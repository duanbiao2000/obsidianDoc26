---
type: concept
title: "L6-L7 Documentation Model"
created: 2026-06-22
updated: 2026-06-22
tags: [engineering-management, documentation, cognitive-load]
related: [documentation-value-pyramid, common-failure-guides, staff-engineer, cognitive-load-management, onboarding-roi]
sources: ["Journals/L7级技术文档优先级模型.md"]
---
# L6-L7 Documentation Model

The **L6-L7 Documentation Model** is a framework for senior and staff engineers that redefines technical documentation as a tool for **cognitive cost reduction** and organizational scaling. Unlike junior documentation which records implementation details ("what I did"), this model focuses on preventing repetitive inquiries and enabling autonomous problem-solving ("how to stop 1,000 people from asking the same question").

## Core Principles

*   **Cognitive Cost Reduction**: The primary metric for documentation value is the mental effort saved by the reader, not the completeness of the code description.
*   **Documentation as Interface**: High-quality documentation functions like an API, providing predictable, self-service answers that reduce reliance on synchronous communication (e.g., Slack).
*   **Scale-Oriented Writing**: Documents are written for future scale (1,000+ users) rather than immediate clarity for the current team.

## The Documentation Value Pyramid

The model structures documentation into five tiers, prioritized by return on investment (ROI) and impact on system reliability:

1.  **Getting Started**: Highest priority. Ensures new users can achieve a "hello world" or initial success within 30 minutes. Directly impacts [[onboarding-roi]].
2.  **Task Execution Docs**: Procedural, search-optimized guides for frequent actions. Must be copy-paste runnable.
3.  **Common Failure Guides**: The hallmark of mature engineering teams. Focuses on debugging, anti-patterns, and error resolution. Addresses the reality that users fail more often than they succeed.
4.  **System Mental Models**: Conceptual diagrams and explanations of system behavior (e.g., data flow, consistency models). Enables users to reason about problems independently.
5.  **Strategic Decision Docs**: Includes [[architecture-decision-records-adr]] and tradeoff analyses. Preserves organizational memory and context for future leadership.

## Prioritization Formula

To decide what to write next, the model uses the **Doc Priority Score**:

$$ \text{Score} = \frac{\text{Frequency} \times \text{Blast Radius} \times \text{Time Saved}}{\text{Cognitive Load to Write}} $$

This formula helps engineers identify high-leverage documentation opportunities, such as fixing a common error that blocks development daily, versus optimizing a rarely used feature.

## L6 vs. L7 Focus

*   **L6 (Senior)**: Focuses on team efficiency, reducing repetitive questions, and creating playbooks for the current system.
*   **L7 (Staff)**: Focuses on organizational scaling, changing thinking patterns, and establishing principles for future systems.

## See Also

*   [[Documentation Value Pyramid]]: The structural hierarchy of this model.
*   [[Common Failure Guides]]: The most undervalued yet impactful documentation type.
*   [[Staff Engineer]]: The career level where this model becomes critical.