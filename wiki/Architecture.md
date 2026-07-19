# Wiki Architecture

**Version**: 1.0  
**Date**: 2026-07-01  
**Purpose**: 说明整个 Wiki 的设计理念、目录职责和知识组织结构。

---

## 1. 设计理念

本 Wiki 遵循 **Karpathy LLM Wiki** 模式，核心目标是：

- **编译式知识管理**：将原始笔记（`raw/`）编译为结构化、可查询的知识网络（`wiki/`）
- **多粒度知识表示**：同一内容可拆解为不同抽象层级的页面（概念、方法、模板、速查等）
- **可维护的知识图谱**：通过 MOC（Map of Content）构建清晰的导航结构
- **Agent 友好**：所有规则、类型、流程均通过文档和 Skill 明确定义，便于 Agent 执行

---

## 2. 目录结构与职责

```
wiki/
├── MOC-Wiki.md                    # 整个 Wiki 的总入口（Graph View 核心）
├── INDEX.md                       # 辅助导航（已弱化）
│
├── areas/                         # 领域级内容（English、Career、PKM 等）
│   ├── MOC-Areas.md
│   ├── English.md
│   └── Career.md
│
├── concepts/                      # 核心概念（抽象、可迁移的知识）
│   └── MOC-Concepts.md
│
├── methods/                       # 方法论与操作流程
│
├── meta/                          # Wiki 自身维护类内容
│   ├── MOC-Meta.md
│   ├── guidelines/                # 规范与指南
│   ├── skills/                    # Agent Skill
│   ├── templates/                 # 页面模板
│   ├── quickref/                  # 速查表
│   ├── scripts/                   # 维护脚本
│   └── tracking/                  # 追踪与日志
│
└── ...
```

### 各目录职责说明

| 目录 | 职责 | 典型内容 |
|------|------|----------|
| `areas/` | 领域知识入口 | English、Career、PKM 等 |
| `concepts/` | 抽象概念 | 第一性原理、表达块思维、元认知等 |
| `methods/` | 可操作的方法 | 跟读复述、外部视角反思等 |
| `meta/` | Wiki 自我管理 | Skill、指南、模板、脚本、追踪 |

---

## 3. 知识组织原则

- **概念优先**：优先提取高抽象、可迁移的 `concept`
- **多类型拆解**：一篇原始笔记可生成多个不同类型的 Wiki 页面
- **MOC 导航**：通过 MOC 构建清晰的层级结构，便于 Graph View 浏览
- **单一事实来源**：类型定义、流程、约束均有明确文档归属

---

## 4. 主要 MOC 节点

| MOC | 作用 | 路径 |
|-----|------|------|
| `MOC-Wiki` | 总入口 | `wiki/MOC-Wiki.md` |
| `MOC-Concepts` | 概念聚合 | `wiki/concepts/MOC-Concepts.md` |
| `MOC-Meta` | 方法/模板/Skill 聚合 | `wiki/meta/MOC-Meta.md` |
| `MOC-Areas` | 领域聚合 | `wiki/areas/MOC-Areas.md` |

---

## 5. 维护机制

- 使用 `update-moc.py` 辅助发现未收录页面
- 遵循 `MOC-Maintenance-Guide.md` 进行更新
- 知识爆炸操作需严格遵守 `Knowledge-Explosion-Workflow.md`

---

*本文档为 Wiki 的顶层架构说明，建议新成员或 Agent 优先阅读。*
