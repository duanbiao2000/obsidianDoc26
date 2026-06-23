---
type: concept
title: Soft Delete vs. Hard Delete
created: 2026-06-22
updated: 2026-06-22
tags: [database-design, data-integrity, software-engineering]
related: [product-led-development-principles, data-architect]
sources: ["Journals/Generating executive summary and emulating key points.md"]
---
# Soft Delete vs. Hard Delete

**Soft Delete** and **Hard Delete** are two strategies for removing records from a database. In subscription-based and financial systems, **Soft Delete** is preferred to maintain historical data integrity.

## Definitions

*   **Hard Delete**: Permanently removes the record from the database. This action is irreversible and results in data loss.
*   **Soft Delete**: Marks the record as deleted (e.g., using a `deleted_at` timestamp or `is_active` flag) but retains it in the database. The record is hidden from standard views but remains accessible for reporting and historical context.

## Importance in Subscription Models

In subscription systems, deleting a tier or plan may still have active subscribers. A **Hard Delete** would break references and lose historical data, making it impossible to track past revenue or user activity. **Soft Delete** ensures that:

1.  **Historical Accuracy**: Reports and analytics remain accurate by retaining all transactional history.
2.  **Context Preservation**: Creators can see how many users were subscribed to a deleted tier, providing valuable insights.
3.  **Data Integrity**: Prevents orphaned records and maintains referential integrity in the database.

## Best Practices

*   Always use **Soft Delete** for entities involved in financial transactions or user permissions.
*   Implement backend **Hard Guards** to prevent accidental hard deletes.
*   Ensure frontend UIs respect the soft delete status by filtering out deleted records from standard views while preserving them in admin/analytics contexts.

This strategy is a key component of [[Product-Led Development Principles]] and is critical for [[Data Architect]] roles managing financial data.
