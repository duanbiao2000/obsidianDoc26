---
type: entity
title: C++
created: 2026-06-22
updated: 2026-06-22
tags: [programming-language, systems-programming, cpp]
related: [rust, iso-cpp-standards-committee, zero-cost-abstraction, think-cell]
sources: ["Journals/C++零成本抽象原则.md"]
---
# C++

**C++** is a general-purpose programming language created by Bjarne Stroustrup as an extension of the C language. It is widely used in systems programming, game development, high-performance computing, and embedded systems due to its efficiency, flexibility, and extensive standard library.

## Philosophy and Core Principles

### Zero-Cost Abstraction
A defining principle of C++ is **[[zero-cost-abstraction]]**, which ensures that language features do not impose runtime overhead unless they are explicitly used. This allows developers to write high-level, expressive code that compiles down to machine code as efficient as hand-optimized C.

### Backward Compatibility
C++ places a high premium on backward compatibility, allowing code written decades ago to often compile and run on modern compilers with minimal changes. This "compatibility premium" makes it a preferred choice for large-scale enterprise systems in finance, infrastructure, and aerospace, where rewriting legacy code is prohibitively risky and expensive.

## Ecosystem and Governance

The language is standardized by the **[[iso-cpp-standards-committee]]**, an open and democratic body that reviews proposals through specialized sub-groups. This rigorous process ensures that new features are well-vetted and align with the language's core principles.

## Industry Adoption

C++ remains dominant in sectors requiring precise hardware control and low-latency performance:
*   **Embedded Systems:** Automotive, aerospace, and IoT devices.
*   **High-Performance Computing (HPC):** Scientific simulations and data analysis.
*   **Game Development:** Major game engines (e.g., Unreal Engine) are built in C++.
*   **Financial Services:** High-frequency trading platforms.

Companies like **[[think-cell]]** exemplify a culture of deep technical mastery in C++, prioritizing code quality and optimization over rapid iteration.

## Comparison with Rust

While **[[rust]]** offers memory safety by default, C++ provides greater flexibility and backward compatibility. C++ allows for **[[incremental-modernization]]** of existing codebases, whereas adopting Rust often requires a complete rewrite. This makes C++ more suitable for maintaining large, legacy-heavy systems, while Rust is often chosen for new projects where safety is the primary concern.