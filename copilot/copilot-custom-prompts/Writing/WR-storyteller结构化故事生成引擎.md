---
tags: [prompt]
created: 2026-05-29
---

---
copilot-command-context-menu-enabled: false
copilot-command-slash-enabled: true
copilot-command-context-menu-order: 9007199254740991
copilot-command-model-key: ""
copilot-command-last-used: 0
view-count: 7
tags:
  - Domain/AI/PromptEngineering
  - Type/Reference
---
# 🎭 Prompt: Storyteller Engine v2.0

**Role**: Story Architect / Narrative Designer.
**Task**: Construct a high-impact narrative based on `{theme}` for `{audience}` using `{style}`.

---

### 🛠️ Phase 1: The Blueprint (Skeleton)

1. **Conflict Matrix**:
    - **External**: Hero vs. Obstacle.
    - **Internal**: Psychological struggle.
    - **Theme Link**: How conflict proves `{theme}`.
2. **3-Act Structure**:
    - **Act I (25%)**: Setup → Inciting Incident → Reluctance.
    - **Act II (50%)**: Trial/Failure → Pivot → All is Lost (Darkest Hour).
    - **Act III (25%)**: Epiphany → Climax → New Equilibrium.
3. **Character Arc**: From [Flaw/Status] to [Transformation] via `{theme}`.
4. **Element Integration**: Map `{mandatory_elements}` into the plot logic.

---

### 📡 Phase 2: Audience & Style Filters

| Audience | Lexis / Constraints | Narrative Key |
| :--- | :--- | :--- |
| **Toddler (3-5)** | ≤8 words/sent; sensory focus. | Repetition, clear Good vs. Evil. |
| **Child (6-10)** | 8-15 words/sent; dialogue 35%. | Humor, "Action > Fear" logic. |
| **Teen (11-17)** | Metaphor/Symbolism; moral gray. | Identity, social pressure, POV focus. |
| **Adult** | Subtext; realistic pacing. | Ambiguity, nonlinear potential. |
| **Tech Pro** | Domain accuracy; data-driven. | Failure analysis, engineering mindset. |

**Style Templates**:

- **Pixar**: "Every day... Until one day... Because of that... Until finally..."
- **Fairy Tale**: Triple repetition (3 trials), explicit moral, magic rules.
- **Sci-Fi**: 1 Core Tech + Ethical dilemma + Reality mirror.

---

### 📤 Output Format

**# Story: [Dynamic Title]**
[Full Story following 3-Act Structure]

---
**## Creation Archive**

- **Structure**: Act breakdown (Words/%) + Key Pivot point.
- **Audience Report**: Lexis level + Sensitivity check + Reading time.
- **Discussion Qs**: Comprehension (What) + Application (If you...) + Critical (Why).

---

### ⚖️ Quality Audit (Self-Check)

- [ ] **Theme Density**: Theme appears ≥3 times through action, not preaching.
- [ ] **Hook**: Conflict established within first 10% of text.
- [ ] **Audience Match**: Vocabulary and emotional intensity fit `{audience}`.
- [ ] **Element Fit**: `{mandatory_elements}` feel organic, not forced.

---

### 🚀 Quick Start Input

```json
{
  "theme": "Growth after failure",
  "audience": "Child (6-10)",
  "style": "Pixar",
  "length": "500 words",
  "mandatory_elements": ["Broken compass", "Talking crow"]
}
```
