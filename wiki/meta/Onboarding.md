# Wiki Onboarding Guide

**Purpose**: 新人快速上手指南，帮助你理解这个 Wiki 的目的、结构和使用方法。

---

## 1. 这个 Wiki 是做什么的？

这是一个基于 **Karpathy LLM Wiki** 模式的个人知识库，核心目标是：

- 将原始笔记（`raw/`）编译为结构化、可查询、可链接的知识网络
- 支持**知识爆炸**：一篇笔记可拆解为多个不同粒度的 Wiki 页面
- 构建清晰的知识图谱，便于长期维护和检索

---

## 2. 核心入口（MOC 系统）

这个 Wiki 通过以下几个 MOC（Map of Content）进行导航：

| MOC | 作用 | 路径 |
|-----|------|------|
| **MOC-Wiki** | 整个 Wiki 的总入口 | `wiki/MOC-Wiki.md` |
| **MOC-Concepts** | 所有核心概念的聚合 | `wiki/concepts/MOC-Concepts.md` |
| **MOC-Meta** | 方法、模板、Skill 的聚合 | `wiki/meta/MOC-Meta.md` |
| **MOC-Areas** | 领域级内容聚合 | `wiki/areas/MOC-Areas.md` |

**推荐从 `MOC-Wiki.md` 开始浏览**。

---

## 3. 目录结构说明

```
wiki/
├── MOC-Wiki.md              # 总入口（Graph View 核心）
├── areas/                   # 领域知识（English、Career 等）
├── concepts/                # 抽象概念
├── methods/                 # 操作方法
└── meta/                    # Wiki 自我管理
    ├── guidelines/          # 规范与指南
    ├── skills/              # Agent Skill
    ├── templates/           # 页面模板
    ├── quickref/            # 速查表
    ├── scripts/             # 维护脚本
    └── tracking/            # 追踪与日志
```

### 各目录职责

| 目录 | 存放内容 | 典型页面类型 |
|------|----------|--------------|
| `areas/` | 领域知识 | English、Career |
| `concepts/` | 核心概念 | 第一性原理、表达块思维 |
| `methods/` | 操作方法 | 跟读复述、外部视角反思 |
| `meta/` | 管理类内容 | Skill、指南、模板、脚本 |

---

## 4. 常用操作

### 查看需要更新到 MOC 的页面

```bash
python wiki/meta/scripts/update-moc.py
```

### 知识爆炸操作

参考文档：`wiki/meta/guidelines/Knowledge-Explosion-Workflow.md`

### 新建页面时的注意事项

1. 使用对应模板（位于 `meta/templates/`）
2. 填写完整的 frontmatter
3. 添加至少 2 个有意义的 wikilink
4. 考虑是否需要更新对应 MOC

---

## 5. 推荐阅读顺序

1. `MOC-Wiki.md`（总览）
2. `meta/Wiki-Architecture.md`（架构说明）
3. `meta/Onboarding.md`（本指南）
4. `meta/guidelines/Knowledge-Explosion-Workflow.md`（核心流程）

---

*本指南旨在降低新人理解成本，建议在 Graph View 中与 MOC 配合使用。*
