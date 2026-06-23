---
type: entity
title: Agent Teams Skill
tags: [ai-tool, claude-code, multi-agent]
related: [claude-code, decentralized-collaboration, assumption-competition, five-to-seven-person-golden-rule, collaboration-patterns]
created: 2026-06-22
updated: 2026-06-22
sources: ["Journals/AGENT_TEAMS_COMPLETION_REPORT.md"]
---
# Agent Teams Skill

**Agent Teams Skill** is a specialized configuration package (v1.0.0) for [[Claude Code]] that enables multi-agent collaboration. It transforms the AI coding assistant into a coordinator of diverse agent roles, facilitating complex problem-solving through structured teamwork.

## Core Architecture

The skill implements a **decentralized collaboration** model, moving away from a single leader/orchestrator to a peer-to-peer role complementarity ecosystem. This design enhances robustness and flexibility, reducing the risk of single-point failures in agent workflows.

## Key Features

*   **Role Ecosystem**: Four primary role types—Builder, Critic, Improver, and Synthesizer—each with distinct cognitive styles and responsibilities.
*   **Assumption Competition**: A mechanism where all roles engage in hypothetical competitive dialogue to challenge premises, preventing groupthink and improving decision quality.
*   **Collaboration Patterns**: Support for Parallel, Pipeline, DAG (Dependency-Aware), and Critical collaboration modes.
*   **Team Size Optimization**: Adherence to the **5-7 person golden rule** to balance communication efficiency and coverage.

## Usage

The skill supports three interaction modes:

1.  **Interactive**: Natural language prompts to instantiate teams.
2.  **Declarative**: YAML configuration files for precise control over team structure and dynamics.
3.  **Template-based**: Pre-defined templates for common tasks like research, code review, and analysis.

## Documentation

The skill includes extensive documentation:
*   `SKILL.md`: Main guide and best practices.
*   `schema.md`: Configuration specifications.
*   `patterns.md`: Detailed explanation of collaboration modes.
*   `examples.md`: Practical usage examples.

## Related Concepts

*   [[Claude Code]]: The execution environment.
*   [[Decentralized Collaboration]]: The underlying architectural principle.
*   [[Assumption Competition]]: The critical thinking mechanism.
*   [[Five-to-Seven Person Golden Rule]]: The team size guideline.