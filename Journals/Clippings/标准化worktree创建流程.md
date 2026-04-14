# 标准化worktree创建流程
在实际开发中，“退回到代码仓库上一级目录创建 worktree” 的核心目的是**避免 worktree 嵌套（Git 禁止/不推荐）、统一目录结构、降低多任务/多分支管理的混乱风险**。以下是可落地的**标准化规则**（含目录设计、创建流程、团队约定、自动化校验），适配个人开发和团队协作场景。

---

## 一、先明确：为什么要定“退到上一级创建”的规则？
Git worktree 的核心限制是：**不能在原仓库的子目录中创建 worktree**（会触发 `fatal: '/xxx/project-main' is inside a git repository` 报错），且嵌套目录会导致：
1. Git 识别异常，无法正确区分主仓库和 worktree；
2. 多任务目录混杂，团队成员难以定位对应任务的 worktree；
3. 误操作风险高（比如在主仓库目录下直接开发，破坏主分支纯净性）。

因此，“退到上一级创建”本质是**规避嵌套 + 统一目录层级**的基础规则。

---

## 二、现实开发中的标准化规则设计
### 1. 基础目录结构规则（核心）
先统一所有仓库/ worktree 的根目录，让主仓库和所有任务 worktree 处于**同一层级**（非嵌套），示例如下：
```
# 推荐的目录结构（所有开发者统一遵循）
/opt/dev-workspaces/          # 【固定】所有项目的总根目录（可自定义，如 ~/workspaces）
├── project-main/             # 【主仓库】仅用于分支管理（不直接开发），对应 main/develop 分支
├── project-task-123/         # 【任务worktree】任务ID-123（用户模块开发），对应分支 task/123-user
├── project-task-456/         # 【任务worktree】任务ID-456（订单修复），对应分支 task/456-order-fix
└── project-hotfix-789/       # 【热修复worktree】热修复ID-789，对应分支 hotfix/789-payment
```
**规则要点**：
- 总根目录（如 `/opt/dev-workspaces/`）：团队统一路径（或个人固定路径），所有 worktree 都放在这里；
- 主仓库（`project-main/`）：仅克隆一次，用于管理分支、合并代码，**禁止在主仓库内直接开发**；
- worktree 目录命名：`项目前缀-任务类型-任务ID`（如 `project-task-123`），与分支名强关联（分支名：`task/123-user`），一眼能识别对应任务。

### 2. 标准化的 worktree 创建流程（团队统一命令）
所有开发者必须按以下步骤创建 worktree，避免目录混乱：

#### 步骤 1：初始化总根目录（仅首次执行）
```bash
# 1. 创建总根目录（团队统一路径，比如公司内网约定 /data/workspaces）
mkdir -p /opt/dev-workspaces
cd /opt/dev-workspaces

# 2. 克隆主仓库（仅克隆一次，作为分支管理的核心）
git clone git@github.com:your-team/project.git project-main
```

#### 步骤 2：退到总根目录，创建任务 worktree（核心规则落地）
```bash
# 关键：必须回到总根目录（主仓库的上一级/同级），而非主仓库内部
cd /opt/dev-workspaces

# 创建 worktree 命令模板（团队统一）
# 格式：git worktree add -b 分支名 worktree目录名 远程主分支
git worktree add -b task/123-user project-task-123 origin/main

# 示例解释：
# -b task/123-user：创建并切换到分支 task/123-user
# project-task-123：worktree 目录名（与分支名关联）
# origin/main：基于远程主分支创建，保证基线一致
```

#### 步骤 3：进入 worktree 开发（隔离任务）
```bash
cd /opt/dev-workspaces/project-task-123
# 后续开发、提交、测试都在这个隔离目录中，不影响主仓库和其他 worktree
```

### 3. 团队协作的补充规则（避免混乱）
#### 规则 1：分支与 worktree 命名强绑定
| 任务类型       | 分支名格式          | worktree 目录名格式       | 示例                          |
|----------------|---------------------|---------------------------|-------------------------------|
| 常规任务       | task/[任务ID]-[描述] | project-task-[任务ID]     | task/123-user → project-task-123 |
| 热修复         | hotfix/[修复ID]-[描述] | project-hotfix-[修复ID]   | hotfix/789-payment → project-hotfix-789 |
| 迭代开发       | develop/[迭代号]-[模块] | project-develop-[迭代号]  | develop/v2.1-order → project-develop-v2.1 |

#### 规则 2：禁止违规操作（团队公约）
1. 禁止在主仓库（`project-main/`）内直接修改代码、提交变更；
2. 禁止在 worktree 目录内再创建子 worktree（嵌套）；
3. 任务合并完成后，必须在 24 小时内清理对应的 worktree（避免目录膨胀）：
   ```bash
   # 清理命令（总根目录执行）
   cd /opt/dev-workspaces
   git worktree remove project-task-123  # 删除 worktree 目录
   git branch -d task/123-user          # 删除本地分支
   git push origin --delete task/123-user # 删除远程分支（确认无需保留）
   ```

#### 规则 3：权限与访问规则（多人协作）
- 总根目录 `/opt/dev-workspaces/`：团队成员可读可写（通过权限组配置）；
- 每个 worktree 目录：仅任务负责人可修改（避免误改他人任务）；
- 主仓库：仅技术负责人/架构师有权限合并代码到 `main/develop` 分支。

### 4. 自动化校验（可选，强制规则落地）
为避免团队成员违规创建 worktree（比如嵌套创建），可编写简单的校验脚本，集成到团队开发流程中：

```bash
#!/bin/bash
# check_worktree_rule.sh - 校验 worktree 创建是否符合规则
# 使用方式：bash check_worktree_rule.sh 要创建的worktree目录名

# 配置项（团队统一）
MAIN_REPO_DIR="/opt/dev-workspaces/project-main"
TOTAL_WORKSPACE="/opt/dev-workspaces"

# 入参检查
if [ $# -ne 1 ]; then
    echo "用法：$0 <要创建的worktree目录名>"
    echo "示例：$0 project-task-123"
    exit 1
fi

WORKTREE_DIR="$1"
ABS_WORKTREE_DIR=$(realpath "$WORKTREE_DIR" 2>/dev/null || echo "$TOTAL_WORKSPACE/$WORKTREE_DIR")

# 规则1：worktree 必须在总根目录下
if [[ "$ABS_WORKTREE_DIR" != "$TOTAL_WORKSPACE"/* ]]; then
    echo "❌ 错误：worktree 必须创建在总根目录 $TOTAL_WORKSPACE 下！"
    exit 1
fi

# 规则2：禁止嵌套在主仓库内
if [[ "$ABS_WORKTREE_DIR" == "$MAIN_REPO_DIR"/* ]]; then
    echo "❌ 错误：禁止在主仓库 $MAIN_REPO_DIR 内创建 worktree！"
    echo "✅ 正确做法：退到 $TOTAL_WORKSPACE 目录后再执行创建命令"
    exit 1
fi

# 规则3：目录名必须符合命名规范（project-任务类型-数字）
if ! [[ "$WORKTREE_DIR" =~ ^project-(task|hotfix|develop)-[0-9a-zA-Z-]+$ ]]; then
    echo "❌ 错误：worktree 目录名不符合规范！"
    echo "✅ 规范示例：project-task-123、project-hotfix-789"
    exit 1
fi

echo "✅ 校验通过，可创建 worktree：$WORKTREE_DIR"
exit 0
```

**使用方式**：
```bash
# 合法创建（校验通过）
bash check_worktree_rule.sh project-task-123

# 非法创建（嵌套在主仓库，校验失败）
bash check_worktree_rule.sh /opt/dev-workspaces/project-main/task-123
```

---

### 总结
1. **核心规则**：所有 worktree 必须创建在主仓库的**同级目录**（总根目录），禁止嵌套，本质是规避 Git 限制+统一目录结构；
2. **落地关键**：标准化目录命名（关联任务ID/分支名）+ 统一创建命令 + 团队公约（禁止主仓库开发、及时清理）；
3. **进阶保障**：通过自动化脚本校验违规操作，确保所有开发者遵循规则，尤其适合多任务/多Agent协作的隔离场景。

如果是多Agent自动化创建 worktree 的场景，可将上述规则封装为工具函数（如 Python/Shell），让 Agent 调用时自动遵循目录和命名规则，避免人工失误。