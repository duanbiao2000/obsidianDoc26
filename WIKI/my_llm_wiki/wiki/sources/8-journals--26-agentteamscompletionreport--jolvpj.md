---
type: source
title: "Agent Teams Skill Completion Report"
authors: ["Claude Code", "User"]
year: 2026
url: ""
venue: "Internal Journal"
tags: [ai-agents, claude-code, software-engineering, team-architecture]
related: [agent-teams-skill, decentralized-collaboration, assumption-competition, five-to-seven-person-golden-rule, collaboration-patterns, claude-code]
created: 2026-06-22
updated: 2026-06-22
sources: ["Journals/AGENT_TEAMS_COMPLETION_REPORT.md"]
---
# Agent Teams Skill Completion Report

This source documents the completion and release of **Agent Teams Skill** (v1.0.0), a specialized configuration package for [[Claude Code]] that enables multi-agent collaboration. The report details the architectural shift from centralized orchestration to **decentralized collaboration**, the implementation of **assumption competition** to embed critical thinking, and the adoption of the **5-7 person golden rule** for optimal team size.

## Key Deliverables

The skill is packaged as a 35 KB `.skill` file containing over 4,400 lines of documentation and configuration. Core components include:

*   **SKILL.md**: Main documentation (665 lines).
*   **schema.md**: Configuration specifications (299 lines).
*   **patterns.md**: Detailed collaboration modes (1,985 lines).
*   **examples.md**: 10+ complete usage examples (752 lines).
*   **QUICKSTART.md**: Rapid onboarding guide.

## Architectural Innovations

### Decentralized Collaboration
The skill replaces the traditional single-leader orchestrator model with a **peer-to-peer role complementarity** ecosystem. This design increases robustness by eliminating single points of failure and aligns with modern agile principles. Agents interact as equals, leveraging their specific roles to drive task completion.

### Assumption Competition
To prevent groupthink and stimulate innovation, the skill implements **assumption competition**. All agent roles engage in hypothetical competitive dialogue to challenge premises. Specific roles such as "Devil's Critic" and "Risk Analyst" are introduced alongside builders, with configurable skepticism levels to tune the intensity of critical feedback.

### 5-7 Person Golden Rule
Based on the "Two Pizza Rule" and Dunbar’s Number, the skill recommends maintaining agent teams between 5 and 7 members for medium-sized projects. This range optimizes communication efficiency and decision speed. The report provides validated YAML templates for 5-person (fastest delivery), 6-person (balanced innovation), and 7-person (widest coverage) configurations.

## Collaboration Patterns

The skill supports four distinct modes of agent interaction:

1.  **Parallel Collaboration**: Independent tasks executed simultaneously.
2.  **Pipeline Collaboration**: Sequential hand-offs between agents.
3.  **DAG Collaboration**: Dependency-aware scheduling using Directed Acyclic Graphs.
4.  **Critical Collaboration**: Iterative debate and refinement through assumption competition.

## Usage Modes

Users can interact with the skill in three ways:

*   **Interactive**: Natural language commands (e.g., "Create a 6-person team for product research").
*   **Declarative**: YAML-based configuration files defining team structure, roles, and dynamics.
*   **Template-based**: Pre-built templates for common scenarios like full-stack research, code review, and competitive analysis.

## Implications

This source significantly extends the practical application of [[代理團隊]] (Agent Teams) by providing a concrete, implemented framework. It operationalizes abstract concepts like [[批判性思維]] (Critical Thinking) and [[協作]] (Collaboration) into mechanical agent workflows. The emphasis on decentralized architecture and assumption competition offers a new paradigm for designing resilient AI systems within [[Claude Code]].