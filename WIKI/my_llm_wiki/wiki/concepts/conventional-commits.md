---
type: concept
title: Conventional Commits
created: 2026-06-22
updated: 2026-06-22
tags: [git, version-control, software-engineering, best-practices]
related: [semantic-versioning, git]
sources: ["Journals/Comprehensive Analysis of rathole-org-rathole.md"]
---
# Conventional Commits

**Conventional Commits** is a lightweight specification for adding human and machine-readable meaning to commit messages. It provides a simple set of rules for creating an explicit commit history.

## Format

A conventional commit message consists of a header, an optional body, and an optional footer:

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

## Types

Common types include:
- `feat`: A new feature
- `fix`: A bug fix
- `docs`: Documentation only changes
- `style`: Changes that do not affect the meaning of the code (white-space, formatting, etc.)
- `refactor`: A code change that neither fixes a bug nor adds a feature
- `perf`: A code change that improves performance
- `test`: Adding missing tests or correcting existing tests
- `chore`: Changes to the build process or auxiliary tools and libraries

## Benefits

- **Automated Changelogs:** Tools can parse commit history to generate `CHANGELOG.md` files automatically.
- **Semantic Versioning:** Determines when to bump major, minor, or patch versions based on commit types (e.g., `feat` triggers minor, `fix` triggers patch, `BREAKING CHANGE` triggers major).
- **Clarity:** Makes the commit history easier to read and understand for collaborators.

## Enforcement

Projects often enforce Conventional Commits using CI checks (e.g., `action-semantic-pull-request` in GitHub Actions) or git hooks (e.g., `commitlint`).