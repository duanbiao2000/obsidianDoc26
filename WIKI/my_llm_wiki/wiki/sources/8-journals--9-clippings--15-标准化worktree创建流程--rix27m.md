---
type: source
title: 标准化 Worktree 创建流程
tags: [git, worktree, workflow, automation, team-conventions]
related: [git-worktree, 工作树-任务隔离, ai-编码代理核心循环, 代理团队]
created: 2026-06-21
updated: 2026-06-21
sources: ["Journals/Clippings/标准化worktree创建流程.md"]
authors: []
year: 2026
url: ""
venue: ""
---

# 标准化 Worktree 创建流程

本文档定义了一套标准化的 [[Git Worktree]] 创建流程，旨在解决多任务/多分支开发中的目录混乱、嵌套错误和团队协作问题。核心规则是「退到主仓库上一级目录创建 worktree」，以规避 Git 的技术限制并统一目录结构。

## 核心规则

1. **退到上一级创建**：所有 worktree 必须创建在主仓库的**同级目录**（总根目录），禁止嵌套在主仓库子目录内。这是非协商的技术基础，违反会触发 `fatal: inside a git repository` 错误。
2. **分支与 worktree 命名强绑定**：worktree 目录名必须与分支名关联，格式为 `project-{任务类型}-{ID}`（如 `project-task-123` 对应分支 `task/123-user`）。
3. **24 小时清理规则**：任务合并完成后，必须在 24 小时内清理对应的 worktree 和本地/远程分支，防止目录膨胀。

## 标准化目录结构

```
/opt/dev-workspaces/          # 总根目录（团队统一）
├── project-main/             # 主仓库（仅用于分支管理，不直接开发）
├── project-task-123/         # 任务 worktree
├── project-task-456/         # 任务 worktree
└── project-hotfix-789/       # 热修复 worktree
```

## 命名规范

| 任务类型 | 分支名格式 | worktree 目录名格式 | 示例 |
|----------|-----------|-------------------|------|
| 常规任务 | `task/[ID]-[描述]` | `project-task-[ID]` | `task/123-user` → `project-task-123` |
| 热修复 | `hotfix/[ID]-[描述]` | `project-hotfix-[ID]` | `hotfix/789-payment` → `project-hotfix-789` |
| 迭代开发 | `develop/[迭代号]-[模块]` | `project-develop-[迭代号]` | `develop/v2.1-order` → `project-develop-v2.1` |

## 自动化校验脚本

本文档提供了一个完整的 Shell 校验脚本 `check_worktree_rule.sh`，用于验证 worktree 创建是否符合规则，特别适用于多 Agent 自动化创建 worktree 的场景。脚本检查三项规则：

1. worktree 必须在总根目录下
2. 禁止嵌套在主仓库内
3. 目录名必须符合命名规范

## 与现有维基的关联

- 直接操作化 [[Git Worktree]] 概念，提供团队级实践指南
- 是 [[工作树-任务隔离]] 的具体实现方案
- 适用于 [[AI 编码代理核心循环]] 和 [[代理团队]] 中的自动化工作流
