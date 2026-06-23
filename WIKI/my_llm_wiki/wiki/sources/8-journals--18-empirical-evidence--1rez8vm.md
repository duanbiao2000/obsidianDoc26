---
type: source
title: "Empirical Evidence in Engineering: Definition, Application, and Methodology"
created: 2026-06-22
updated: 2026-06-22
tags: [software-engineering, performance, methodology, decision-making]
related: [empirical-evidence-in-engineering, rust, a-b-testing-framework, system-mental-models-documentation-engineering, critical-thinking]
sources: ["Journals/Empirical evidence.md"]
---
# Empirical Evidence in Engineering: Definition, Application, and Methodology

This source defines **Empirical Evidence** in the context of advanced programming and system design as evidence based on real measurement, experimental data, and production observation, rather than theory, assumption, or industry trends. It argues that technical decisions—ranging from micro-optimizations to architectural patterns—must be grounded in measurable data to be valid and effective.

## Core Definition

**Empirical Evidence** is characterized by three core features:
*   **Measurable and Reproducible:** Results can be verified through repeated experiments.
*   **Fact-Based:** Derived from actual data (benchmarks, logs, metrics) rather than intuition.
*   **Bias-Resistant:** Designed to exclude subjective judgment and cognitive biases.

## The Three Layers of Empirical Evidence

The source proposes a hierarchy of evidence reliability, balancing cost and rigor:

1.  **Micro Level (Single Function Benchmarks):**
    *   **Tools:** `go test -bench`, Rust `criterion`.
    *   **Cost:** Low.
    *   **Credibility:** Medium. Useful for algorithm selection but may not reflect system-wide behavior.
2.  **Macro Level (Full Application Profiling):**
    *   **Tools:** `perf`, `pprof`, flame graphs, load testing (`wrk`, `k6`).
    *   **Cost:** Medium.
    *   **Credibility:** High. Captures interactions between components, network overhead, and resource contention.
3.  **Production Level (Real Traffic Experiments):**
    *   **Tools:** A/B testing, canary deployments, feature flags.
    *   **Cost:** High.
    *   **Credibility:** Highest. Reflects real-world hardware, network conditions, and user behavior.

## Key Applications and Case Studies

### Performance Optimization
The source contrasts intuitive optimization with data-driven optimization. For example, assuming an algorithm is faster without benchmarking often leads to wasted effort. It provides examples using Go benchmarks (`go test -benchmem`) to quantify improvements (e.g., 21.7% reduction in execution time).

### Architectural Decision-Making (Monolith vs. Microservices)
A case study illustrates how empirical data resolves architectural debates:
*   **Hypothesis:** Microservices will improve deployment speed.
*   **Data:**
    *   Monolith: 2h deploy time, 8min build time, 450ms P99 latency.
    *   Microservice Experiment: 15min deploy time, 1min build time, **+120ms network latency**.
*   **Conclusion:** A hybrid approach was chosen, splitting only non-latency-sensitive modules, based on the trade-off revealed by data.

### Language Feature Selection (Rust Generics vs. Trait Objects)
*   **Context:** Choosing between static dispatch (Generics) and dynamic dispatch (Trait Objects).
*   **Data:**
    *   Generics: 1.2ns/op (monomorphized).
    *   Trait Objects: 1.8ns/op (virtual call overhead, ~50% slower).
*   **Decision:** Use Generics in hot paths for performance; use Trait Objects in API layers for flexibility.

### Concurrency Models (Go Goroutines vs. Rust Async/Await)
*   **Data:**
    *   Go: 100k goroutines ~50MB memory, <1μs context switch.
    *   Rust: 100k tasks ~100MB memory, <0.5μs polling overhead.
*   **Insight:** Choice depends on specific latency requirements and memory constraints, not just popularity.

## Common Pitfalls

The source identifies four common errors in technical decision-making:
1.  **Subjective Judgment:** Replacing data with "I feel this is faster."
2.  **Micro-Optimization Trap:** Optimizing functions that contribute negligibly to total latency (ignoring the Pareto principle).
3.  **Static Analysis Reliance:** Assuming code review alone guarantees performance or correctness without dynamic testing.
4.  **Generalization Error:** Assuming local test results (e.g., on a laptop) apply to production environments with different hardware and network conditions.

## The Empirical Workflow

A six-step process for senior engineers:
1.  **Define Hypothesis:** "X is faster/more scalable than Y."
2.  **Design Experiment:** Determine metrics, tools, and control variables.
3.  **Collect Data:** Run benchmarks, profiling, or A/B tests.
4.  **Analyze Results:** Check for statistical significance and confidence intervals.
5.  **Conclude:** Make a decision based on the data.
6.  **Document:** Record the decision, the data, and the rationale (linking to [[system-mental-models-documentation-engineering]]).

## Connections to Existing Wiki

*   **[[A/B測試框架]]**: This source extends the concept of A/B testing beyond product features to include infrastructure and code-level experiments.
*   **[[Rust]]**: The specific benchmarks for Generics vs. Trait Objects provide concrete performance data for the Rust entity page.
*   **[[系統心智模型-文檔工程]]**: Emphasizes that decision records must include the empirical data that supported the choice.
*   **[[批判性思維]]**: The empirical workflow is a practical application of critical thinking in engineering contexts.