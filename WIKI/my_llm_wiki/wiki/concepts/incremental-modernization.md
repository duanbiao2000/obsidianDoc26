---
type: concept
title: Incremental Modernization
created: 2026-06-22
updated: 2026-06-22
tags: [software-engineering, legacy-systems, cpp, refactoring]
related: [cpp, backward-compatibility-premium, architecture-decision-records-adr]
sources: ["Journals/C++零成本抽象原则.md"]
---
# Incremental Modernization

**Incremental Modernization** is a software engineering strategy that involves updating legacy systems gradually, rather than through a complete rewrite. This approach is particularly relevant for large codebases written in **[[cpp]]**, where backward compatibility allows for seamless integration of old and new code.

## Methodology

1.  **Adopt Modern Compilers:** Upgrade to the latest compiler versions that support newer language standards (e.g., C++20, C++23).
2.  **Identify Pain Points:** Locate sections of code that use dangerous C-style patterns (e.g., raw pointers, manual memory management).
3.  **Replace Piece-by-Piece:** Refactor these sections to use modern C++ features (e.g., smart pointers, RAII, standard library algorithms).
4.  **Continuous Integration:** Ensure that each change is tested and integrated without breaking existing functionality.

## Benefits

*   **Reduced Risk:** Avoids the "big bang" rewrite scenario, which often leads to project failure.
*   **Continuous Value Delivery:** The system remains operational and valuable throughout the modernization process.
*   **Improved Maintainability:** Gradually improves code quality and safety without disrupting business operations.

## Relation to Architectural Decisions

This strategy aligns with the principles of **[[architecture-decision-records-adr]]**, where decisions to retain or refactor legacy components are documented and justified based on business value and technical debt. It acknowledges that legacy code often contains critical business logic that is too risky to discard.