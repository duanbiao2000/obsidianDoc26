---
type: source
title: "L7 Technical Documentation Priority Model"
created: 2026-06-22
updated: 2026-06-22
tags: [documentation, engineering-management, knowledge-management]
related: [l6-l7-documentation-model, common-failure-guides, documentation-value-pyramid, staff-engineer, architecture-decision-records-adr]
sources: ["Journals/L7级技术文档优先级模型.md"]
authors: []
year: 2026
url: ""
venue: ""
---
# L7 Technical Documentation Priority Model

This source outlines a **Documentation Value Pyramid** model for senior (L6) and staff (L7) engineers, shifting the focus of technical documentation from code explanation to **cognitive cost reduction**. It argues that high-level documentation should function as an interface that prevents questions rather than just answering them, thereby scaling engineering efficiency across an organization.

## Core Philosophy: Documentation as Scalable System

The central thesis is that L3–L5 engineers document *what they did*, while L6–L7 engineers document *how to stop 1,000 people from asking the same question*. The goal is to minimize the **Cognitive Cost** of interacting with a system.

> "Write docs for future scale, not present clarity. Optimize for questions that will be asked 1,000 times. Reduce thinking cost, not explanation depth."

## The Documentation Value Pyramid

The model prioritizes documentation types based on their impact on user success and organizational memory, ordered from highest to lowest priority:

1.  **Getting Started** (Highest ROI): Enables new users to run the system successfully within 30 minutes. Includes quickstarts, minimal runnable examples, and environment configuration.
2.  **Task Execution Docs**: Search-oriented, copy-paste runnable guides for frequent tasks (e.g., API calls, deployment, plugin creation).
3.  **Common Failure Guides** (L6 Differentiator): Documents why things fail. Includes debug checklists, anti-patterns, and performance traps. Mature organizations dedicate ~30% of documentation to this, compared to ~5% in average teams.
4.  **System Mental Models** (L6 Layer): Explains how the system "thinks" (e.g., request lifecycle, data flow, cache mechanisms). Goal: Enable independent reasoning and reduce incorrect abstractions.
5.  **Strategic Decision Docs** (L7 Layer): Architecture Decision Records (ADRs), tradeoff analyses, and rejected alternatives. Preserves **Organizational Memory** and context for future leaders.

## Doc Priority Score

To objectively prioritize documentation efforts, the source proposes a scoring formula:

```
Doc Priority Score = (Frequency × Blast Radius × Time Saved) ÷ Cognitive Load to Write
```

*   **Frequency**: How often is this encountered? (Daily=5, Weekly=4, etc.)
*   **Blast Radius**: Impact scope? (Blocks dev=5, Performance=4, etc.)
*   **Time Saved**: Average time saved per user? (5 min=1, 30 min=3, Half-day=5)

Example: A guide on "Token Calculation" might score 100 (5×5×4), while "Emoji DB Optimization" scores 2 (1×1×2), indicating a 50x priority difference.

## L6 vs. L7 Distinctions

| Dimension | L6 (Senior) | L7 (Staff) |
| :--- | :--- | :--- |
| **Focus** | Team Efficiency | Organizational Scaling |
| **Goal** | Reduce Repetitive Questions | Change Thinking Patterns |
| **Time Scale** | Current System | Future System |
| **Output** | Playbooks | Principles |

## Recommended Execution Order

For taking over or improving a project's documentation, the suggested order is:
1.  Quickstart (Must-have)
2.  Top 10 Failures
3.  Debug Flowchart
4.  Mental Model Diagram
5.  ADR History

## Key Insight: Documentation as Interface

The ultimate goal of L7 documentation is to make questions unnecessary. When documentation is effective, it acts like an API:
*   Slack noise decreases.
*   Onboarding time drops.
*   Bug types converge.
*   Architectural consistency improves.

This source challenges the common practice of investing 80% of effort into auto-generated API references, arguing instead for a balanced distribution that heavily favors failure guides and mental models.