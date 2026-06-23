---
type: concept
title: Program Structure Interface (PSI)
created: 2026-06-22
updated: 2026-06-22
tags: [ide-architecture, compiler, static-analysis, jetbrains]
related: [intellij-idea, abstract-syntax-tree, source-code-as-data]
sources: ["Journals/IntelliJ 平台成功背后的软件工程哲学.md"]
---
# Program Structure Interface (PSI)

The **Program Structure Interface (PSI)** is a core architectural component of the **IntelliJ Platform**. It represents source code as a structured, semantic data model rather than a simple text stream.

## Technical Definition

PSI extends the concept of an **Abstract Syntax Tree (AST)** by incorporating symbol resolution and cross-file references. While an AST represents the syntactic structure of a single file, PSI provides a unified view of the entire project’s codebase, including:

*   **Semantic Context:** Understanding what a variable, method, or class refers to across the project.
*   **Type Information:** Resolving types for accurate code completion and error checking.
*   **Cross-File Links:** Enabling navigation and refactoring across file boundaries.

## Why It Matters

PSI is the "load-bearing fact" behind IntelliJ’s superior refactoring and navigation capabilities. By treating code as a graph of semantic relationships, the IDE can perform operations that are safe and context-aware. For example, renaming a method in PSI updates all references accurately, whereas text-based editors might miss occurrences or incorrectly replace similar strings.

## Comparison with Text-Based Editors

*   **Text-Based Editors:** Rely on regular expressions or simple tokenization. Refactoring is risky and often requires manual verification.
*   **PSI-Based IDEs:** Use a full semantic model. Refactoring is a graph operation, ensuring fidelity and safety.

## Role in AI Validation

In the era of Generative AI, PSI serves as the deterministic backbone for validating AI-generated code. It allows the IDE to check whether AI-suggested changes are semantically correct, type-safe, and consistent with the rest of the codebase.

## Related Concepts

*   [[Abstract Syntax Tree]]
*   [[Source Code as Data]]
*   [[Static Analysis]]
*   [[IntelliJ IDEA]]