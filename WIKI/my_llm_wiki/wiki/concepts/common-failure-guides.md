---
type: concept
title: "Common Failure Guides"
created: 2026-06-22
updated: 2026-06-22
tags: [documentation, debugging, reliability, engineering-best-practices]
related: [documentation-value-pyramid, l6-l7-documentation-model, system-mental-models]
sources: ["Journals/L7级技术文档优先级模型.md"]
---
# Common Failure Guides

**Common Failure Guides** are a specific type of technical documentation focused on explaining why and how systems fail, rather than just how they succeed. They are considered the most undervalued yet impactful documentation asset in senior engineering practices.

## Importance

In real-world usage, user failures significantly outnumber successes. By documenting common failure modes, teams can:
*   Reduce debugging time for users and support engineers.
*   Prevent recurring incidents.
*   Improve overall system reliability perception.

Mature engineering organizations (e.g., Google, Stripe) dedicate approximately **30-40%** of their documentation effort to failure guides, whereas average teams often allocate less than 5%.

## Typical Content

*   **Common Error Causes**: Explanations for frequent error codes or messages.
*   **Debug Checklists**: Step-by-step procedures to isolate issues.
*   **Anti-Patterns**: Code or configuration patterns that lead to failures.
*   **Performance Traps**: Scenarios where the system degrades or fails under load.
*   **Rate Limit Solutions**: Guidance on handling throttling and quotas.

## Role in the Documentation Value Pyramid

In the [[Documentation Value Pyramid]], Common Failure Guides sit at the third level, above Task Execution Docs but below Getting Started. They represent the **L6 Differentiator**—the point where documentation shifts from merely enabling tasks to actively reducing friction and cognitive load during troubleshooting.

## Best Practices

*   **Search-Oriented**: Titles and content should match the error messages or symptoms users see.
*   **Actionable**: Provide immediate steps to resolve or workaround the issue.
*   **Contextual**: Link to relevant [[System Mental Models]] to help users understand the root cause.

## See Also

*   [[L6-L7 Documentation Model]]
*   [[Documentation Value Pyramid]]