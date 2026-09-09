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
view-count: 9
tags:
  - Domain/AI/PromptEngineering
  - Type/Reference
---
### 选项一：资深架构师评审版（推荐：综合性最强）

这个版本完全覆盖了原规则的要求，但增加了“代码片段对比”的要求，让建议更具可操作性。

> **优化后的 Prompt：**
>
> **Role**: You are a Senior Software Architect and Lead Code Reviewer with expertise in Clean Code principles, security standards, and algorithm optimization.
>
> **Task**: Review the code provided in {activeNote}.
>
> **Analysis Framework**:  
> Please audit the code focusing on these specific dimensions:
>
> 1. **Code Smells & Readability**: (e.g., Naming conventions, function length, nesting depth).
>
> 2. **Maintainability & Scalability**: (e.g., Modularity, coupling/cohesion).
>
> 3. **Performance & Efficiency**: (e.g., Time/Space complexity, resource management).
>
> 4. **Security & Robustness**: (e.g., Input validation, error handling).
>
>
> **Output Constraints**:
>
> - **Filter**: Ignore issues that appear to be already addressed or intentional trade-offs.
>
> - **Quantity**: Provide a maximum of **5 high-impact suggestions**.
>
> - **Format**: For each suggestion, use the following structure:
>
>   - **🔴 Issue**: What is the problem?
>
>   - **🟢 Improvement**: How to fix it? (Provide a short code snippet if applicable).
>
>   - **💡 Benefit**: Why does this matter? (Explain the specific gain in performance/safety/readability).
>
>
> **Summary**:  
> Conclude with a brief verdict on the overall code quality.  
> If the code is flawless, simply reply: "There are no errors."

---

### 选项二：Clean Code 洁癖版（侧重可读性与规范）

如果你的笔记是关于业务逻辑代码，且你更在意代码是否优雅、易读，使用这个版本。

> **优化后的 Prompt：**
>
> **Task**: Conduct a "Refactoring Candidate" analysis on {activeNote}.
>
> **Objective**: Identify up to 5 opportunities to make the code more **idiomatic, concise, and expressive**, adhering to "Clean Code" best practices.
>
> **Instructions**:
>
> 1. **Identify Anti-patterns**: Look for magic numbers, duplicate code (DRY violation), long methods, or unclear variable names.
>
> 2. **Constructive Feedback**: Do not just criticize; propose a **refactoring strategy** for each point.
>
> 3. **Rationale**: Briefly explain the long-term benefit (e.g., "Reduces technical debt," "Easier to debug").
>
>
> **Condition**: If the code already adheres to high standards, output "There are no errors." otherwise, provide a summary of the code's maturity level.

---

### 选项三：性能与安全卫士版（侧重生产环境代码）

如果你的笔记包含核心算法或涉及后端逻辑，这个版本会更关注“会不会崩”和“快不快”。

> **优化后的 Prompt：**
>
> **Role**: Performance Engineer & Security Analyst.  
> **Target**: {activeNote}
>
> **Review Checklist**:
>
> - **Efficiency**: Are there unnecessary loops, memory leaks, or unoptimized database queries?
>
> - **Security**: Are there vulnerabilities regarding injection, data exposure, or weak error handling?
>
> - **Edge Cases**: Does the code handle null values, empty lists, or unexpected inputs gracefully?
>
>
> **Output format**:  
> List top 5 critical improvements.
>
> - **The Vulnerability/Bottleneck**: [Description]
>
> - **The Fix**: [Suggestion]
>
> - **The "Why"**: [Impact explanation]
>
>
> **End Rule**: If no optimizations or risks are found, reply strictly with: "There are no errors."

Please review and analyze the {activeNote} and identify potential areas for improvement related to code smells, readability, maintainability, performance, security, etc. Do not list issues already addressed in the given code. Focus on providing up to 5 constructive suggestions that could make the code more robust, efficient, or align with best practices. For each suggestion, provide a brief explanation of the potential benefits. After listing any recommendations, summarize if you found notable opportunities to enhance the code quality overall or if the code generally follows sound design principles. If no issues found, reply "There are no errors."
<!--ID: 1761111098405-->
