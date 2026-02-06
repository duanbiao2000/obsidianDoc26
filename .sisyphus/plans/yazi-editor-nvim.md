# Change yazi default editor to nvim

## TL;DR

> **Quick Summary**: Modify `export EDITOR="nano"` to `export EDITOR="nvim"` in the exports.sh module to make yazi use Neovim as default text editor.
>
> **Deliverables**:
>
> - Modified `/home/danny/.config/zsh/exports.sh` (line 11): `EDITOR="nano"` → `EDITOR="nvim"`
>
> **Estimated Effort**: Quick
> **Parallel Execution**: NO - sequential single task
> **Critical Path**: Task 1 (single task)

---

## Context

### Original Request

Change yazi's default document editor from "note" to "nvim" (Neovim).

### Interview Summary

**Key Discussions**:

- User uses WSL Ubuntu with Zsh shell
- Zsh configuration is modularized in `$HOME/.config/zsh/`
- User emphasized keeping structure well-organized with clear categorization
- Preferred environment variable method over yazi.toml configuration

**Research Findings**:

- Yazi defaults to using `$EDITOR` environment variable for text editor (Linux/macOS)
- User's zshrc uses modular structure: exports.sh, aliases.sh, functions.sh, keybindings.sh
- EDITOR already exists in exports.sh (line 11) set to "nano"
- Best practice: modify existing line rather than add duplicate

### Metis Review

**Identified Gaps** (addressed):

- Shell type confirmed (Zsh) - determines which config file to modify
- Configuration structure understood (modular in ~/.config/zsh/)
- Existing EDITOR variable located in exports.sh line 11

---

## Work Objectives

### Core Objective

Make yazi use nvim as default editor by changing the EDITOR environment variable in the appropriate module.

### Concrete Deliverables

- Modified `/home/danny/.config/zsh/exports.sh` line 11: `export EDITOR="nvim"`

### Definition of Done

- [ ] `export EDITOR="nvim"` line exists in exports.sh (line 11)
- [ ] No duplicate EDITOR entries
- [ ] Change follows existing file structure and format

### Must Have

- Change `export EDITOR="nano"` to `export EDITOR="nvim"` in exports.sh
- Preserve the modular structure and clear categorization
- Maintain existing file formatting and comments

### Must NOT Have (Guardrails)

- No modification to yazi.toml or other yazi config files
- No modification to other shell config files (.zshrc, aliases.sh, functions.sh, etc.)
- No adding duplicate EDITOR entries
- No changes to other environment variables

---

## Verification Strategy (MANDATORY)

> **UNIVERSAL RULE: ZERO HUMAN INTERVENTION**
>
> ALL tasks in this plan MUST be verifiable WITHOUT any human action.
> This is NOT conditional — it applies to EVERY task, regardless of test strategy.
>
> **FORBIDDEN** — acceptance criteria that require:
>
> - "User manually tests..." / "사용자가 직접 테스트..."
> - "User visually confirms..." / "사용자가 눈으로 확인..."
> - "User interacts with..." / "사용자가 직접 조작..."
> - "Ask user to verify..." / "사용자에게 확인 요청..."
> - ANY step where a human must perform an action
>
> **ALL verification is executed by the agent** using tools (Playwright, interactive_bash, curl, etc.). No exceptions.

### Test Decision

- **Infrastructure exists**: NO
- **Automated tests**: NO (shell configuration - not applicable for TDD)
- **Framework**: none

### Agent-Executed QA Scenarios (MANDATORY — ALL tasks)

> Since this is a shell configuration change without automated tests, the agent will directly verify changes by:
>
> - Checking the exact line modification in exports.sh
> - Verifying no duplicate EDITOR entries exist
> - Confirming the EDITOR variable is set to nvim in a new shell session

**Verification Tool:**

- **Shell/Configuration**: interactive_bash (WSL bash)

---

## Execution Strategy

### Parallel Execution Waves

> Single task - no parallelization needed.

```
Wave 1 (Start Immediately):
└── Task 1: [Modify EDITOR=nvim in exports.sh]

Critical Path: Task 1 (single task)
Parallel Speedup: N/A - sequential only
```

### Dependency Matrix

| Task | Depends On | Blocks | Can Parallelize With |
|------|------------|--------|---------------------|
| 1 | None | None | None (single task) |

### Agent Dispatch Summary

| Wave | Tasks | Recommended Agents |
|------|-------|-------------------|
| 1 | 1 | delegate_task(category="quick", load_skills=[], run_in_background=false) |

---

## TODOs

> Implementation + Test = ONE Task. Never separate.
> EVERY task MUST have: Recommended Agent Profile + Parallelization info.

- [ ] 1. Modify EDITOR variable to nvim in exports.sh

  **What to do**:
  - Read `/home/danny/.config/zsh/exports.sh`
  - Locate line 11: `export EDITOR="nano"`
  - Change to: `export EDITOR="nvim"`
  - Verify no other EDITOR entries exist in the file
  - Preserve existing file structure, formatting, and comments

  **Must NOT do**:
  - No modification to yazi.toml or other yazi config files
  - No modification to other shell config files (.zshrc, aliases.sh, functions.sh, keybindings.sh)
  - No adding new EDITOR line (modify existing one only)
  - No changes to other environment variables

  **Recommended Agent Profile**:
  > Select category + skills based on task domain. Justify each choice.
  - **Category**: `quick`
    - Reason: Simple line modification task - change one variable value in a config file. Well-understood, no complex dependencies.
  - **Skills**: `[]`
    - No specialized skills needed for shell file modification.

  **Parallelization**:
  - **Can Run In Parallel**: NO
  - **Parallel Group**: Sequential (single task)
  - **Blocks**: None
  - **Blocked By**: None (can start immediately)

  **References** (CRITICAL - Be Exhaustive):

  > The executor has NO context from your interview. References are their ONLY guide.
  > Each reference must answer: "What should I look at and WHY?"

  **Pattern References** (existing code to follow):
  - `\\wsl$\Ubuntu\home\danny\.config\zsh\exports.sh:11` - Existing EDITOR line to modify
  - `\\wsl$\Ubuntu\home\danny\.config\zsh\exports.sh` - File structure and formatting patterns

  **API/Type References** (contracts to implement against):
  - N/A (shell configuration)

  **Test References** (testing patterns to follow):
  - N/A (no automated tests for shell config)

  **Documentation References** (specs and requirements):
  - Yazi FAQ: <https://yazi-rs.github.io/docs/faq/> - Documents that yazi uses `$EDITOR` variable
  - User's zshrc structure: Modular configuration pattern

  **External References** (libraries and frameworks):
  - Official docs: Yazi documentation on $EDITOR variable usage

  **WHY Each Reference Matters** (explain the relevance):
  - exports.sh:11: Target line to modify - contains existing EDITOR="nano"
  - exports.sh: Understand the file's structure to preserve formatting

  **Acceptance Criteria**:

  > **AGENT-EXECUTABLE VERIFICATION ONLY** — No human action permitted.
  > Every criterion MUST be verifiable by running a command or using a tool.
  > REPLACE all placeholders with actual values from task context.

  **Agent-Executed QA Scenarios (MANDATORY — per-scenario, ultra-detailed):**

  > Write MULTIPLE named scenarios per task: happy path AND failure cases.
  > Each scenario = exact tool + steps with real selectors/data + evidence path.

  **Example — Shell Configuration (interactive_bash):**

  \`\`\`
  Scenario: EDITOR line is correctly modified in exports.sh
    Tool: interactive_bash (tmux with WSL)
    Preconditions: WSL Ubuntu is accessible
    Steps:
      1. Start WSL bash: wsl -d Ubuntu -u danny
      2. Read exports.sh line 11: sed -n '11p' ~/.config/zsh/exports.sh
      3. Assert: Output equals "export EDITOR=\"nvim\""
      4. Verify no duplicates: grep -c "export EDITOR" ~/.config/zsh/exports.sh
      5. Assert: Count is exactly 1
      6. Verify no "nano" reference: grep -i "nano" ~/.config/zsh/exports.sh | grep EDITOR
      7. Assert: No output (empty, meaning EDITOR is not set to nano)
    Expected Result: exports.sh line 11 is "export EDITOR=\"nvim\"" with no duplicates
    Evidence: Terminal output captured to .sisyphus/evidence/task-1-exports-check.log
  \`\`\`

  \`\`\`
  Scenario: EDITOR variable is set to nvim in new Zsh session
    Tool: interactive_bash (tmux with WSL)
    Preconditions: exports.sh has been modified
    Steps:
      1. Start new Zsh session: wsl -d Ubuntu -u danny -- zsh -l -c 'echo $EDITOR'
      2. Assert: Output equals "nvim"
      3. Verify nvim is installed: wsl -d Ubuntu -u danny -- which nvim
      4. Assert: Command returns nvim path (not empty)
    Expected Result: EDITOR variable is set to "nvim" in new Zsh session
    Evidence: Terminal output captured to .sisyphus/evidence/task-1-env-var-check.log
  \`\`\`

  \`\`\`
  Scenario: File structure and formatting are preserved
    Tool: interactive_bash (tmux with WSL)
    Preconditions: exports.sh has been modified
    Steps:
      1. Read file: cat ~/.config/zsh/exports.sh
      2. Check line 11: sed -n '11p' ~/.config/zsh/exports.sh
      3. Assert: Line matches format "export EDITOR=\"nvim\""
      4. Verify file integrity: wc -l ~/.config/zsh/exports.sh
      5. Assert: Line count equals 33 (original length)
      6. Check for trailing whitespace on line 11: sed -n '11p' ~/.config/zsh/exports.sh | cat -A
      7. Assert: No trailing whitespace or unexpected characters
    Expected Result: File structure preserved, line 11 correctly formatted
    Evidence: Terminal output captured to .sisyphus/evidence/task-1-structure-check.log
  \`\`\`

  \`\`\`
  Scenario: No other config files modified
    Tool: interactive_bash (tmux with WSL)
    Preconditions: exports.sh has been modified
    Steps:
      1. Check .zshrc: grep "EDITOR" ~/.zshrc || echo "No EDITOR in .zshrc"
      2. Assert: No EDITOR references in .zshrc (output is "No EDITOR in .zshrc")
      3. Check aliases.sh: grep "EDITOR" ~/.config/zsh/aliases.sh || echo "No EDITOR in aliases.sh"
      4. Assert: No EDITOR references in aliases.sh
      5. Check functions.sh: grep "EDITOR" ~/.config/zsh/functions.sh || echo "No EDITOR in functions.sh"
      6. Assert: No EDITOR references in functions.sh
    Expected Result: Only exports.sh contains EDITOR configuration
    Evidence: Terminal output captured to .sisyphus/evidence/task-1-no-other-mods.log
  \`\`\`

  **Evidence to Capture:**
  - [ ] Terminal output for all scenarios
  - [ ] Each evidence file named: task-{N}-{scenario-slug}.log

  **Commit**: NO (shell config change - not tracked by git in this context)
  - Message: N/A

---

## Commit Strategy

N/A - This is a user-local shell configuration file, not typically version-controlled.

---

## Success Criteria

### Verification Commands

```bash
# Verify EDITOR is set in exports.sh
wsl -d Ubuntu -u danny -- sed -n '11p' ~/.config/zsh/exports.sh
# Expected output: export EDITOR="nvim"

# Verify EDITOR in new shell session
wsl -d Ubuntu -u danny -- zsh -l -c 'echo $EDITOR'
# Expected output: nvim

# Verify no duplicates
wsl -d Ubuntu -u danny -- grep -c "export EDITOR" ~/.config/zsh/exports.sh
# Expected output: 1

# Verify nvim is installed
wsl -d Ubuntu -u danny -- which nvim
# Expected output: /usr/bin/nvim (or path to nvim)
```

### Final Checklist

- [ ] `export EDITOR="nvim"` exists in `/home/danny/.config/zsh/exports.sh` line 11
- [ ] No duplicate EDITOR entries
- [ ] EDITOR variable is set to "nvim" in new Zsh session
- [ ] nvim is installed and accessible
- [ ] File structure and formatting preserved
- [ ] No other config files modified
