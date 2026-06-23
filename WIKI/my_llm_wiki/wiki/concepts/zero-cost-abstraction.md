---
type: concept
title: Zero-Cost Abstraction
created: 2026-06-22
updated: 2026-06-22
tags: [programming, performance, cpp, systems-design]
related: [cpp, rust]
sources: ["Journals/C++零成本抽象原则.md"]
---
# Zero-Cost Abstraction

**Zero-Cost Abstraction** is a design principle in programming languages, most notably associated with **[[cpp]]**, where high-level abstractions do not incur runtime performance overhead compared to equivalent low-level code.

## Definition

The principle states that:
1.  If you do not use a particular language feature, you pay no cost for it.
2.  If you do use it, the resulting code is as efficient as if you had written the low-level implementation manually.

## Mechanism

This is typically achieved through compile-time optimizations, such as:
*   **Inline Expansion:** Functions are expanded at the call site to eliminate call overhead.
*   **Template Metaprogramming:** Code generation happens at compile time, avoiding runtime polymorphism costs where possible.
*   **Move Semantics:** Efficient transfer of resources without unnecessary copying.

## Importance in Systems Programming

Zero-cost abstractions allow developers to write clean, maintainable, and expressive code without sacrificing the performance required for critical systems. This makes C++ indispensable in domains like:
*   **Real-time systems** (e.g., gaming, robotics)
*   **High-frequency trading**
*   **Embedded systems** with limited resources

## Comparison with Other Languages

While **[[rust]]** also employs zero-cost abstractions, C++'s long history and extensive library ecosystem mean that many complex problems have already been solved using this principle. In contrast, languages that rely heavily on garbage collection or runtime reflection often incur inherent performance costs that cannot be fully optimized away.