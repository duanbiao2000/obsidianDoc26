---
type: concept
title: 标准化 Worktree 创建流程
tags: [git, worktree, workflow, automation, team-conventions]
related: [git-worktree, 工作树-任务隔离, ai-编码代理核心循环, 代理团队]
created: 2026-06-21
updated: 2026-06-21
sources: ["Journals/Clippings/标准化worktree创建流程.md"]
---

# 标准化 Worktree 创建流程

标准化 Worktree 创建流程是一套可落地的团队级规则，用于规范 [[Git Worktree]] 的创建、命名、使用和清理。其核心约束是「退到主仓库上一级目录创建 worktree」，以规避 Git 禁止 worktree 嵌套的技术限制。

## 核心原则

- **退到上一级**：所有 worktree 必须与主仓库处于同级目录，禁止嵌套
- **命名强绑定**：worktree 目录名与分支名通过约定格式关联
- **及时清理**：任务完成后 24 小时内删除 worktree

## 目录结构

总根目录（如 `/opt/dev-workspaces/`）下放置主仓库和所有 worktree，保持同一层级。

## 命名规范

| 任务类型 | 分支名 | worktree 目录名 |
|----------|--------|----------------|
| 常规任务 | `task/[ID]-[描述]` | `project-task-[ID]` |
| 热修复 | `hotfix/[ID]-[描述]` | `project-hotfix-[ID]` |
| 迭代开发 | `develop/[迭代号]-[模块]` | `project-develop-[迭代号]` |

## 自动化校验

通过 Shell 脚本 `check_worktree_rule.sh` 验证创建操作是否符合规则，特别适用于多 Agent 自动化场景。

## 与现有概念的关系

- 是 [[Git Worktree]] 概念的操作化实现
- 为 [[工作树-任务隔离]] 提供具体实施方案
- 支撑 [[AI 编码代理核心循环]] 中的任务隔离需求
