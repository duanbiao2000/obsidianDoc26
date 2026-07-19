# Final Structure Guide

**Version**: 1.0  
**Date**: 2026-07-01  
**Purpose**: 本文档总结当前 Wiki 的最终目录结构、设计理念和使用方式，供长期参考。

---

## 1. 当前目录结构（最终版）

```
wiki/
├── Architecture.md                    # 顶层架构说明（显眼位置）
├── MOC-Wiki.md                        # 整个 Wiki 的总入口（Graph View 核心）
│
├── areas/                             # 领域级内容
│   ├── MOC-Areas.md
│   ├── English.md
│   └── Career.md
│
├── concepts/                          # 核心概念（抽象、可迁移）
│   └── MOC-Concepts.md
│
├── methods/                           # 操作方法与流程
│
├── meta/                              # Wiki 自我管理
│   ├── Changelog.md
│   ├── Onboarding.md                  # 新人入口文档
│   ├── MOC-Meta.md
│   ├── MOC-PKM.md                     # 预留
│   ├── MOC-Thinking.md                # 预留
│   ├── guidelines/                    # 所有规范与指南
│   ├── skills/                        # Agent Skill
│   ├── templates/                     # 页面模板
│   ├── quickref/                      # 速查表
│   ├── scripts/                       # 维护脚本
│   └── tracking/                      # 追踪与日志
│
└── ...
```

---

## 2. 设计理念

- **单一事实来源**：类型定义、流程、约束均有明确文档归属
- **MOC 导航优先**：通过 MOC 构建清晰的层级结构
- **知识爆炸**：支持一篇笔记拆解为多个不同粒度的页面
- **Agent 友好**：所有规则通过文档和 Skill 明确定义

---

## 3. 核心 MOC 节点

| MOC | 作用 | 路径 |
|-----|------|------|
| `MOC-Wiki` | 总入口 | `wiki/MOC-Wiki.md` |
| `MOC-Concepts` | 概念聚合 | `wiki/concepts/MOC-Concepts.md` |
| `MOC-Meta` | 方法/模板/Skill 聚合 | `wiki/meta/MOC-Meta.md` |
| `MOC-Areas` | 领域聚合 | `wiki/areas/MOC-Areas.md` |

---

## 4. 新人推荐阅读路径

1. `meta/Onboarding.md`（最友好入口）
2. `MOC-Wiki.md`
3. `Architecture.md`
4. `meta/guidelines/Knowledge-Explosion-Workflow.md`

---

## 5. 常用维护操作

### 更新 MOC

```bash
python wiki/meta/scripts/update-moc.py
```

### 知识爆炸操作

参考：`wiki/meta/guidelines/Knowledge-Explosion-Workflow.md`

### 新建页面规范

- 使用对应模板（`meta/templates/`）
- 填写完整 frontmatter
- 添加至少 2 个有意义的 wikilink
- 考虑是否需要更新对应 MOC

---

## 6. 目录职责说明

| 目录 | 职责 | 典型内容 |
|------|------|----------|
| `areas/` | 领域知识 | English、Career |
| `concepts/` | 抽象概念 | 第一性原理、表达块思维 |
| `methods/` | 操作方法 | 跟读复述、外部视角反思 |
| `meta/` | 管理类内容 | Skill、指南、模板、脚本 |

---

*本指南为 Wiki 的最终结构总结，建议与 `Architecture.md` 配合阅读。*
