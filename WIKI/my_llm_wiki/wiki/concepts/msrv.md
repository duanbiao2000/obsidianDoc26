---
type: concept
title: Minimum Supported Rust Version (MSRV)
created: 2026-06-22
updated: 2026-06-22
tags: [rust, software-engineering, compatibility, policy]
related: [rust, semantic-versioning]
sources: ["Journals/Comprehensive Analysis of rathole-org-rathole.md"]
---
# Minimum Supported Rust Version (MSRV)

**Minimum Supported Rust Version (MSRV)** is a policy defined by Rust library and application authors that specifies the oldest version of the Rust compiler (`rustc`) with which the project is guaranteed to compile and function correctly.

## Purpose

- **Compatibility:** Ensures that users on older stable Rust toolchains can still use the crate or application.
- **Reproducibility:** Provides a known baseline for CI/CD pipelines and dependency resolution.
- **Dependency Management:** Helps in managing transitive dependencies that may have higher Rust version requirements.

## Implementation

In a Rust project, the MSRV is typically declared in the `Cargo.toml` file:

```toml
[package]
name = "my-crate"
version = "0.1.0"
rust-version = "1.70"
```

## Best Practices

- **CI Enforcement:** Include a CI job that builds and tests the project using the specified MSRV toolchain.
- **Documentation:** Clearly state the MSRV in the README and crate documentation.
- **Bumping Policy:** When bumping the MSRV, treat it as a breaking change if it affects library users, or document it clearly in the changelog for applications.
- **Tooling:** Use tools like `cargo-msrv` to automatically determine the lowest supported Rust version.

## Relation to Semantic Versioning

While [[semantic-versioning]] handles API compatibility, MSRV handles compiler compatibility. A change in MSRV does not necessarily require a major version bump for libraries unless it breaks the public API, but it should be communicated clearly to consumers.