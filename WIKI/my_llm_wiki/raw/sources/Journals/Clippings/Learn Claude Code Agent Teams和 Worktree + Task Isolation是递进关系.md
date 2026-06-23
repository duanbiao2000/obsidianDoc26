---
title: "Learn Claude Code"
source: "https://learn.shareai.run/en/"
author:
published:
created: 2026-03-20
description: "Build a nano Claude Code-like agent from 0 to 1, one mechanism at a time"
tags:
  - "clippings"
---
Build a nano Claude Code-like agent from 0 to 1, one mechanism at a time

[Start Learning](https://learn.shareai.run/en/timeline/)

## The Core Pattern

Every AI coding agent shares the same loop: call the model, execute tools, feed results back. Production systems add policy, permissions, and lifecycle layers on top.

```
while True:
    response = client.messages.create(messages=messages, tools=tools)
    if response.stop_reason != "tool_use":
        break
    for tool_call in response.content:
        result = execute_tool(tool_call.name, tool_call.input)
        messages.append(result)
```


## Learning Path

12 progressive sessions, from a simple loop to isolated autonomous execution[s0184 LOC](https://learn.shareai.run/en/s01/)


[View original](https://learn.shareai.run/en/s08/)
### ==Agent Teams==

s09348 LOC

==When one agent can't finish, delegate to persistent teammates via async mailboxes==

[View original](https://learn.shareai.run/en/s09/)
### ==Team Protocols==

s10419 LOC

==One request-response pattern drives all team negotiation==

[View original](https://learn.shareai.run/en/s10/)
### ==Autonomous Agents==

s11499 LOC

==Teammates scan the board and claim tasks themselves; no need for the lead to assign each one==

[View original](https://learn.shareai.run/en/s11/)
### ==Worktree + Task Isolation==

s12694 LOC

==Each works in its own directory; tasks manage goals, worktrees manage directories, bound by ID==

[View original](https://learn.shareai.run/en/s12/)

## Architectural Layers

Five orthogonal concerns that compose into a complete agent

### Tools & Execution

2 versions

### Planning & Coordination

4 versions

### Memory Management

1 versions

[s06: Compact](https://learn.shareai.run/en/s06/)

### Concurrency

1 versions

[s08: Background Tasks](https://learn.shareai.run/en/s08/)

### ==Collaboration==

4 versions

结合 `Learn Claude Code` 里的设计思路，**Agent Teams（s09）** 和 **Worktree + Task Isolation（s12）** 是递进关系：前者解决「多智能体怎么协作分工」，后者解决「多任务/多智能体执行时怎么互不干扰」。下面是直接对比与使用场景。

---

## 一、核心定位一句话总结
- **Agent Teams**：多智能体协作机制，负责**任务委派、角色分工、异步通信**，让多个 AI agent 像团队一样配合干活。
- **Worktree + Task Isolation**：执行环境隔离机制，负责**目录隔离、任务ID绑定、执行沙箱化**，让不同任务/agent 在独立空间运行，互不污染。

---

## 二、详细对比
| 维度 | Agent Teams (s09) | Worktree + Task Isolation (s12) |
|------|-------------------|----------------------------------|
| **架构层** | 协作层 | 协作 + 执行隔离层 |
| **核心目标** | 多人/多AI协同、任务 delegation | 环境隔离、安全并行、状态不串扰 |
| **关键机制** | 异步 mailbox、任务委托、持久化队友 | 独立工作目录、task ID 绑定、文件空间隔离 |
| **解决问题** | 单个 agent 能力/算力不足，需要分工 | 文件冲突、状态污染、并行执行不安全 |
| **代码量级** | 348 LOC | 694 LOC（更重、更工程化） |
| **依赖前置** | 需要基础 agent loop + tools | 需要 teams + tasks + background 等整套机制 |
| **关注点** | 谁来做、怎么沟通 | 在哪做、如何互不干扰 |

---

## 三、典型使用场景

### 1. Agent Teams 适用场景
适合**需要分工协作、复杂流程拆解、多角色配合**的场景：
- 单个 AI 处理不了超大任务（比如完整项目开发）
- 需要明确角色：产品 agent、编码 agent、测试 agent、文档 agent
- 任务之间有依赖，需要异步消息传递
- 主 agent 只做统筹，把子任务丢给专门队友处理
- 长时间会话，需要 persistent 队友保持状态

**简单说：任务复杂到「一个AI干不完」，就用 Agent Teams。**

---

### 2. Worktree + Task Isolation 适用场景
适合**强隔离、高并行、安全性/稳定性要求高**的场景：
- 同时跑多个用户任务，防止文件互相覆盖、环境冲突
- 代码执行、文件修改、构建项目等有副作用的操作
- 多 agent 并行写文件、修改工程结构
- 生产环境：需要任务可追溯、可回滚、可清理
- 避免上下文污染，保证每个任务独立生命周期

**简单说：怕「任务互相干扰、文件乱套、执行不安全」，就用 Worktree + Task Isolation。**

---

## 四、实际工程中的关系
两者不是二选一，而是**上下游配合**：
1. 先用 **Agent Teams** 做分工：谁负责规划、谁负责编码、谁负责测试。
2. 再用 **Worktree + Task Isolation** 做执行：每个任务/agent 进入独立目录，安全运行。

典型流程：
- Lead agent 拆分任务 → 发给 team 里的 coding agent
- Coding agent 拿到任务 → 进入专属 worktree
- 在隔离目录里写代码、执行、测试
- 完成后提交结果，不影响其他任务环境

---

## 五、快速选择口诀
- 只需要**多人AI配合**：用 **Agent Teams**
- 只需要**执行安全、不冲突**：用 **Worktree + Task Isolation**
- 做**真实可用的多AI工程系统**：两者一起用

如果你需要，我可以基于这份教程的风格，给你写一段两者配合使用的伪代码示例。


结合 Git Worktree + Task Isolation 的使用场景，**最终合并本质是「隔离任务分支向主分支合并」**，冲突处理则需要遵循「先隔离验证、再逐步合并、手动解决核心冲突」的原则。下面是完整的实操流程，包含合并步骤、冲突处理方法，以及适配多任务/多Agent场景的最佳实践。

---

## 一、核心前提：Worktree 合并的本质
Git Worktree 是「多目录映射多分支」的工具，每个隔离的 worktree 对应一个独立的 **任务分支**（比如 `task/agent-1-feature`、`task/agent-2-fix`）。因此，worktree 的合并本质就是：
将**任务分支**的修改，合并到主分支（如 `main`/`develop`），并解决分支间的代码冲突。

---

## 二、完整合并流程（含冲突处理）
### 步骤 1：准备工作（避免合并基础不一致）
先确保当前任务 worktree 的修改已完成、提交，且主分支是最新的。

#### 1.1 进入目标任务 worktree 目录，校验修改
```bash
# 进入该任务的隔离目录（比如 agent-1 的 worktree）
cd /path/to/your/worktree/task-agent-1

# 1. 检查是否有未跟踪/未提交的文件（必须全部提交/忽略）
git status

# 2. 若有修改，提交所有变更（message 要明确任务ID/内容）
git add .
git commit -m "task-123: 完成用户模块开发（agent-1）"

# 3. 确认当前分支（比如 task/agent-1-feature）
git branch
```

#### 1.2 同步主分支最新代码（关键：预防不必要的冲突）
为了让任务分支基于最新的主分支合并，先在任务分支拉取主分支的最新修改：
```bash
# 在任务分支中，拉取远程主分支（如 origin/main）的最新代码
git fetch origin main

# 将主分支最新代码合并到当前任务分支（先解决本地冲突，再推到主分支）
git merge origin/main
# 👉 若此时出现冲突，先在**隔离的 worktree 中解决**（不影响主分支），再继续
```

### 步骤 2：切换到主分支目录，执行合并
主分支建议用「单独的 worktree」或「本地主目录」管理，避免直接在任务 worktree 操作主分支。

#### 2.1 进入主分支目录，拉取最新
```bash
# 进入主分支的 worktree 目录（或本地仓库根目录）
cd /path/to/your/repo/main-worktree

# 拉取远程主分支最新代码，确保本地主分支是最新的
git checkout main
git pull origin main
```

#### 2.2 合并任务分支到主分支
```bash
# 合并目标任务分支（如 task/agent-1-feature）到 main
git merge task/agent-1-feature

# 👉 情况1：无冲突 → Git 自动完成 Fast-forward 或三方合并，直接到步骤 4
# 👉 情况2：有冲突 → Git 提示 "Automatic merge failed; fix conflicts and then commit the result"
```

### 步骤 3：处理合并冲突（核心操作）
冲突的本质是「同一文件的同一位置，主分支和任务分支做了不同修改」，需要手动确认最终保留的代码。

#### 3.1 识别冲突文件
先查看哪些文件有冲突：
```bash
# 查看冲突文件列表
git status
# 输出示例：
# Unmerged paths:
#   (use "git add <file>..." to mark resolution)
#         both modified:   src/user/service.py
#         both added:      src/user/model.py
```

#### 3.2 手动解决冲突
打开冲突文件（如 `src/user/service.py`），Git 会用特殊标记标出冲突区域：
```python
def get_user_info(user_id):
    # 主分支的代码
<<<<<<< HEAD
    user = db.query(User).filter_by(id=user_id).first()
    if not user:
        return {"code": 404, "msg": "用户不存在"}
=======
    # 任务分支（agent-1）的代码
    user = UserModel.get_by_id(user_id)
    if not user:
        raise UserNotFoundError("用户ID不存在：{}".format(user_id))
>>>>>>> task/agent-1-feature
    return user.to_dict()
```

**解决规则（适配 Task Isolation 场景）**：
1. 保留**符合业务逻辑**的代码（优先主分支的基础逻辑，融合任务分支的新功能）；
2. 若为多 Agent 协作，先确认冲突代码的归属（比如 Agent1 负责用户查询，Agent2 改了同文件的其他逻辑）；
3. 解决后删除 Git 冲突标记（`<<<<<<< HEAD`、`=======`、`>>>>>>> 分支名`）。

**解决后示例**：
```python
def get_user_info(user_id):
    # 融合后：保留 Task 分支的模型调用，主分支的返回格式
    user = UserModel.get_by_id(user_id)
    if not user:
        return {"code": 404, "msg": "用户不存在"}
    return user.to_dict()
```

#### 3.3 验证冲突解决并完成合并
```bash
# 1. 标记冲突文件已解决
git add src/user/service.py src/user/model.py

# 2. 完成合并提交（Git 会自动生成合并提交信息，可补充说明）
git commit -m "merge task-123: 合并用户模块开发（解决service.py冲突：融合模型调用+返回格式）"

# 3. 推送合并后的主分支到远程
git push origin main
```

### 步骤 4：清理隔离 worktree（可选）
合并完成后，若任务不再需要，可删除对应的 worktree 和分支：
```bash
# 1. 回到主目录，删除任务 worktree（会保留分支）
git worktree remove /path/to/your/worktree/task-agent-1

# 2. 若确认分支无用，删除本地+远程分支
git branch -d task/agent-1-feature
git push origin --delete task/agent-1-feature
```

---

## 三、多 Task/Agent 场景的冲突预防最佳实践
在 Worktree + Task Isolation 下，多 Agent 并行处理任务时，冲突概率更高，可提前规避：
1. **按目录/模块隔离任务**：让不同 Agent 负责不同目录（如 Agent1 改 `src/user/`，Agent2 改 `src/order/`），从根源减少文件冲突；
2. **频繁同步主分支**：每个任务分支每天同步一次 `origin/main` 的最新代码，提前在隔离 worktree 中解决小冲突，避免合并时堆积大冲突；
3. **先合并到开发分支**：不直接合并到 `main`，先合并到 `develop` 分支做集成测试，确认无冲突后再合到 `main`；
4. **冲突记录与复盘**：记录每次冲突的文件/原因，优化 Agent 的任务拆分规则（比如避免多个 Agent 改同一个配置文件）。

---

### 总结
1. **Worktree 合并核心**：本质是任务分支向主分支的合并，需先确保任务分支基于主分支最新代码，再执行合并；
2. **冲突处理关键**：在隔离的 worktree 中提前解决部分冲突，合并时手动处理核心冲突，解决后标记文件并完成提交；
3. **多 Agent 场景优化**：按模块拆分任务、频繁同步主分支，可大幅降低冲突概率，提升合并效率。

如果需要适配 Agent Teams 自动合并的场景（比如让 Lead Agent 自动检测冲突、提示解决），我可以补充对应的伪代码逻辑。

[[标准化worktree创建流程]]