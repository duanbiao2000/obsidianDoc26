---
tags: ["Domain/AI/PromptEngineering", "Type/Template"]
  - 
  - 
related:
  - "[[Copilot提示词分类索引]]"
update: 2026-01-24
copilot-command-context-menu-enabled: true
copilot-command-slash-enabled: true
copilot-command-context-menu-order: 9007199254740991
copilot-command-model-key: ""
copilot-command-last-used: 0
---
# Dataview 查询模板

> 本文件包含各种用于检索 Copilot 提示词的 Dataview 查询示例。

## 📋 基础查询

### 按分类查询

#### 知识管理类 (KM)

\`\`\`dataview
TABLE file.link as "提示词"
FROM "5.Misc/copilot-custom-prompts"
WHERE contains(file.name, "KM-")
SORT file.name ASC
\`\`\`

#### 思维框架类 (TH)

\`\`\`dataview
TABLE file.link as "提示词"
FROM "5.Misc/copilot-custom-prompts"
WHERE contains(file.name, "TH-")
SORT file.name ASC
\`\`\`

#### 角色扮演类 (RL)

\`\`\`dataview
TABLE file.link as "提示词"
FROM "5.Misc/copilot-custom-prompts"
WHERE contains(file.name, "RL-")
SORT file.name ASC
\`\`\`

#### 技术开发类 (TD)

\`\`\`dataview
TABLE file.link as "提示词"
FROM "5.Misc/copilot-custom-prompts"
WHERE contains(file.name, "TD-")
SORT file.name ASC
\`\`\`

#### 写作表达类 (WR)

\`\`\`dataview
TABLE file.link as "提示词"
FROM "5.Misc/copilot-custom-prompts"
WHERE contains(file.name, "WR-")
SORT file.name ASC
\`\`\`

#### 学习记忆类 (LR)

\`\`\`dataview
TABLE file.link as "提示词"
FROM "5.Misc/copilot-custom-prompts"
WHERE contains(file.name, "LR-")
SORT file.name ASC
\`\`\`

---

## 📊 统计查询

### 分类统计

\`\`\`dataview
TABLE length(rows) as "数量"
FROM "5.Misc/copilot-custom-prompts"
WHERE !contains(file.name, "MOC") AND !contains(file.name, "分类索引") AND !contains(file.name, "Dataview")
FLATTEN file.name AS name
GROUP BY substring(name, 0, 2) AS category
\`\`\`

### 按使用频率排序

\`\`\`dataview
TABLE
  file.link as "提示词",
  view-count as "使用次数"
FROM "5.Misc/copilot-custom-prompts"
WHERE view-count AND !contains(file.name, "MOC")
SORT view-count DESC
LIMIT 20
\`\`\`

### 最近更新的提示词

\`\`\`dataview
TABLE
  file.link as "提示词",
  update as "更新日期"
FROM "5.Misc/copilot-custom-prompts"
WHERE update AND !contains(file.name, "MOC")
SORT update DESC
LIMIT 20
\`\`\`

---

## 🔍 高级查询

### 搜索特定关键词

\`\`\`dataview
TABLE file.link as "提示词"
FROM "5.Misc/copilot-custom-prompts"
WHERE contains(file.name, "关键词")
SORT file.name ASC
\`\`\`

### 组合分类查询 (多个分类)

\`\`\`dataview
TABLE file.link as "提示词"
FROM "5.Misc/copilot-custom-prompts"
WHERE contains(file.name, "KM-") OR contains(file.name, "TH-")
SORT file.name ASC
\`\`\`

### 排除特定文件

\`\`\`dataview
TABLE file.link as "提示词"
FROM "5.Misc/copilot-custom-prompts"
WHERE !contains(file.name, "MOC") AND !contains(file.name, "索引") AND !contains(file.name, "Dataview")
SORT file.name ASC
\`\`\`

---

## 📑 列表查询

### 简洁列表 - 所有知识管理类

\`\`\`dataview
LIST
FROM "5.Misc/copilot-custom-prompts"
WHERE contains(file.name, "KM-")
SORT file.name ASC
\`\`\`

### 带分组的列表

\`\`\`dataview
LIST rows.file.link
FROM "5.Misc/copilot-custom-prompts"
WHERE !contains(file.name, "MOC") AND !contains(file.name, "索引")
GROUP BY substring(file.name, 0, 2)
\`\`\`

---

## 📝 任务查询

### 查找待办事项 (如果有)

\`\`\`dataview
TASK
FROM "5.Misc/copilot-custom-prompts"
WHERE !completed
GROUP BY file.link
\`\`\`

---

## 🔗 相关链接查询

### 显示有相关链接的提示词

\`\`\`dataview
TABLE
  file.link as "提示词",
  related as "相关链接"
FROM "5.Misc/copilot-custom-prompts"
WHERE related AND !contains(file.name, "MOC")
SORT file.name ASC
\`\`\`

---

## 🎯 快速查询示例

### 查找所有角色类提示词

\`\`\`dataview
LIST
FROM "5.Misc/copilot-custom-prompts"
WHERE contains(file.name, "Role") OR contains(file.name, "RL-")
\`\`\`

### 查找所有写作类提示词

\`\`\`dataview
LIST
FROM "5.Misc/copilot-custom-prompts"
WHERE contains(file.name, "WR-") OR contains(file.name, "写作") OR contains(file.name, "writing")
\`\`\`

### 查找所有闪卡相关

\`\`\`dataview
LIST
FROM "5.Misc/copilot-custom-prompts"
WHERE contains(file.name, "Anki") OR contains(file.name, "闪卡") OR contains(file.name, "LR-")
\`\`\`

---

## 💡 使用说明

1. 复制需要的查询代码块
2. 粘贴到你的笔记中
3. 替换关键词(如"关键词"、"KM-"等)
4. Obsidian 会自动执行查询并显示结果

### 修改查询参数

| 参数 | 说明 | 示例 |
|------|------|------|
| `WHERE` | 筛选条件 | `contains(file.name, "KM-")` |
| `SORT` | 排序方式 | `SORT file.name ASC` |
| `LIMIT` | 限制数量 | `LIMIT 20` |
| `GROUP BY` | 分组 | `GROUP BY category` |

---

## 🔗 相关链接

- [[Copilot提示词分类索引]] - 主分类索引
- [[MOC_知识管理类提示词]] - 知识管理 MOC
- [[MOC_思维框架类提示词]] - 思维框架 MOC
