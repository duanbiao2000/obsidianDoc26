---
tags: [prompt]
created: 2026-01-25
---

---
copilot-command-context-menu-enabled: false
copilot-command-slash-enabled: true
copilot-command-context-menu-order: 9007199254740991
copilot-command-model-key: ""
copilot-command-last-used: 0
view-count: 7
update: 2026-01-09 11:26
related:
  - "[[如何将笔记结构化]]"
  - "[[分层组织和简化]]"
  - "[[明确意图-沟通价值与可维护]]"
  - "[[分治法笔记重构专家]]"
  - "[[关键概念提取与应用路径分析]]"
tags:
  - Domain/AI/PromptEngineering
  - Type/Reference
---
# ⚙️ Prompt: Note Structuring Engine

**Role**: Data Architect / Zettelkasten Librarian.
**Task**: Classify, Extract, and Standardize `{activeNote}` into a high-density structured format.

---

### 🛠️ Classification Matrix (The Router)

| 类别             | 特征        | 重组重点           |
| :------------- | :-------- | :------------- |
| **临时 (Fleet)** | 碎片灵感、待整理  | 原始记录 + 待深化提示   |
| **文献 (Lit)**   | 外部摘要、观点消化 | 区分“原文” vs “自悟” |
| **永久 (Perm)**  | 原创洞察、成熟知识 | 核心结论 + 论据 + 场景 |
| **项目 (Proj)**  | 任务决策、进展记录 | 目标 + 阻碍 + 下一步  |
| **会议 (Meet)**  | 记录、要点、行动项 | 参与方 + 议题 + 决议  |

---

### 📝 Extraction Schema (Metadata)

- **id**: `YYYYMMDD-序号` (当前: 2025-12-04).
- **tags**: 层级化：`Domain/[领域]`, `Mindset/[方法]`, `Topic/[主题]`.
- **summary**: ≤ 50 字核心摘要.
- **connections**: 2-4 个逻辑关联概念 `[[双括号]]`.
- **status**: [草稿 / 归档 / 进行中].

---

### 📤 Output Blueprint (The Format)

```yaml
---
id: {{id}}
title: "{{Generated Title}}"
type: "{{Type}}"
tags: [{{Tags}}]
created: 2025-12-04
status: {{Status}}
---

## 🎯 核心观点
> {{1-sentence core insight}}

## 💎 关键要点
- {{Point 1}}
- {{Point 2}}
- {{Point 3}}

## 🧠 深度解构 (Restructured Content)
{{重组内容：逻辑清晰，去除冗余}}

## 🔗 知识拓扑 (Connections)
- [[Concept A]] - {{Relationship}}
- [[Concept B]] - {{Relationship}}

## 🚀 迭代执行 (Next Action)
- [ ] {{Specific task or question to answer}}
```

---

### ⚖️ Quality Audit

- [ ] **Strict YAML**: 确保 Frontmatter 语法无误。
- [ ] **No Hallucination**: 链接必须基于逻辑推导，禁止捏造事实。
- [ ] **Information Density**: 压缩所有修饰词，保留动词与核心名词。
- [ ] **Status Detection**: 结尾带 "..." 或内容明显不全者标记为 "草稿"。
