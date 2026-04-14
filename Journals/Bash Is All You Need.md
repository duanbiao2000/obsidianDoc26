本质需求：不是收集脚本大全，而是理解**高级程序员在哪些摩擦点上选择自动化**，以及自动化的思维模式。

---

## 一、项目初始化类

```bash
# ~/bin/mkproject
#!/bin/bash
# 用法: mkproject myapp python|node|go
set -euo pipefail

NAME=$1
TYPE=${2:-python}
BASE=~/projects

mkdir -p $BASE/$NAME && cd $BASE/$NAME

case $TYPE in
  python)
    python -m venv .venv
    echo "source .venv/bin/activate" > .envrc  # direnv 自动激活
    cat > pyproject.toml << EOF
[project]
name = "$NAME"
version = "0.1.0"
EOF
    ;;
  node)
    npm init -y
    echo "node_modules/" > .gitignore
    ;;
  go)
    go mod init github.com/$(whoami)/$NAME
    ;;
esac

git init && git add . && git commit -m "init"
tmux new-session -d -s $NAME -c $BASE/$NAME
tmux switch-client -t $NAME
echo "✓ $NAME created and tmux session ready"
```

> 摩擦点：每次新项目都要重复10步操作。自动化后一条命令，直接进入工作状态。

---

## 二、Git 工作流类

```bash
# ~/bin/save
#!/bin/bash
# 快速暂存+提交，用于频繁保存工作进度
MSG=${1:-"wip: $(date '+%H:%M')"}
git add -A && git commit -m "$MSG"

# ~/bin/sync
#!/bin/bash
# 同步主干到当前分支（rebase 而非 merge）
MAIN=${1:-main}
git fetch origin
git rebase origin/$MAIN
echo "✓ rebased onto origin/$MAIN"

# ~/bin/pr
#!/bin/bash
# 推送当前分支并创建 PR（依赖 gh CLI）
BRANCH=$(git branch --show-current)
git push -u origin $BRANCH
gh pr create --fill --web
```

---

## 三、环境诊断类（最体现经验的一类）

```bash
# ~/bin/port
#!/bin/bash
# 查看端口占用，并可选 kill
PORT=$1
echo "=== Processes on :$PORT ==="
lsof -i :$PORT
echo ""
read -p "Kill? (y/N) " confirm
if [[ $confirm == "y" ]]; then
  lsof -ti :$PORT | xargs kill -9
  echo "✓ killed"
fi

# ~/bin/envcheck
#!/bin/bash
# 检查项目依赖是否齐全
echo "=== Runtime ==="
command -v python && python --version
command -v node && node --version
command -v docker && docker --version

echo "=== Services ==="
pg_isready -q && echo "postgres: ✓" || echo "postgres: ✗"
redis-cli ping 2>/dev/null && echo "redis: ✓" || echo "redis: ✗"

echo "=== Env vars ==="
for var in DATABASE_URL REDIS_URL API_KEY; do
  [ -n "${!var}" ] && echo "$var: ✓" || echo "$var: ✗ MISSING"
done
```

> 注：`${!var}` 是 bash 间接引用，用变量名去取另一个变量的值。这是区分初中高级写法的细节。

---

## 四、日志分析类（生产环境高频）

```bash
# ~/bin/errlog
#!/bin/bash
# 从日志中提取错误，去重，按频率排序
LOG=${1:-/var/log/app.log}
SINCE=${2:-"1 hour ago"}

echo "=== Top errors since $SINCE ==="
journalctl --since "$SINCE" -u myapp 2>/dev/null \
  || grep "ERROR\|CRITICAL" $LOG

# 去重统计
grep "ERROR" $LOG \
  | sed 's/[0-9]\{4\}-[0-9-]* [0-9:,]*//g' \  # 去掉时间戳
  | sort | uniq -c | sort -rn \
  | head -20

# ~/bin/slowq
#!/bin/bash
# 找出慢查询（PostgreSQL）
psql $DATABASE_URL << 'SQL'
SELECT
  round(mean_exec_time::numeric, 2) AS avg_ms,
  calls,
  left(query, 80) AS query
FROM pg_stat_statements
ORDER BY mean_exec_time DESC
LIMIT 20;
SQL
```

---

## 五、部署与发布类

```bash
# ~/bin/deploy
#!/bin/bash
set -euo pipefail

ENV=${1:-staging}
BRANCH=$(git branch --show-current)

echo "Deploying $BRANCH to $ENV..."

# 前置检查
[ -z "$(git status --porcelain)" ] || { echo "Dirty working tree"; exit 1; }
npm test || { echo "Tests failed"; exit 1; }

# 构建
docker build -t myapp:$(git rev-parse --short HEAD) .

# 推送
case $ENV in
  staging)
    kubectl set image deployment/myapp myapp=myapp:$(git rev-parse --short HEAD) -n staging
    kubectl rollout status deployment/myapp -n staging
    ;;
  prod)
    read -p "Deploy to PRODUCTION? (yes/N) " confirm
    [[ $confirm == "yes" ]] || exit 1
    # ... prod 逻辑
    ;;
esac

echo "✓ Deployed to $ENV"

# 自动打 git tag
git tag -a "deploy-$ENV-$(date +%Y%m%d-%H%M)" -m "Deploy to $ENV"
git push --tags
```

---

## 六、数据库操作类

```bash
# ~/bin/dbdump
#!/bin/bash
# 带时间戳的数据库备份
DB=${1:-myapp_development}
FILE="dumps/${DB}_$(date +%Y%m%d_%H%M%S).sql"
mkdir -p dumps
pg_dump $DB > $FILE
gzip $FILE
echo "✓ Saved to ${FILE}.gz"

# ~/bin/dbcopy
#!/bin/bash
# 把生产数据库复制到本地开发（脱敏）
set -euo pipefail
echo "Dumping production..."
heroku pg:pull DATABASE_URL myapp_development --app myapp-prod

echo "Anonymizing sensitive data..."
psql myapp_development << 'SQL'
UPDATE users SET
  email = 'user_' || id || '@example.com',
  phone = '000-0000',
  name  = 'Test User ' || id
WHERE email NOT LIKE '%@yourcompany.com';
SQL
echo "✓ Local DB ready with anonymized data"
```

> 注：把生产数据脱敏后导到本地，这个脚本在任何有真实用户数据的项目里都是刚需，但很少有人提前写好。

---

## 七、开发体验类（最个人化）

```bash
# ~/bin/todo
#!/bin/bash
# 扫描项目中所有技术债
rg "TODO|FIXME|HACK|XXX|DEPRECATED" \
  --type-add 'code:*.{py,ts,js,go,rs}' \
  --type code \
  -n \
  | sort -t: -k1,1 \
  | column -t -s: 2>/dev/null \
  | head -50

# ~/bin/changed
#!/bin/bash
# 快速了解最近改了什么（代码 review 前）
DAYS=${1:-3}
echo "=== Files changed in last $DAYS days ==="
git log --since="$DAYS days ago" --name-only --pretty=format: \
  | sort -u | grep -v "^$"

echo ""
echo "=== Summary ==="
git log --since="$DAYS days ago" --oneline

# ~/bin/size
#!/bin/bash
# 项目代码量统计（排除 vendor/node_modules）
echo "=== Code size by language ==="
fd -e py -e ts -e js -e go -e rs \
  --exclude node_modules \
  --exclude vendor \
  | xargs wc -l \
  | sort -rn \
  | head -20
```

---

## 八、通用脚本设计模式（最重要）

高级程序员写脚本时遵循的隐性规范：

```bash
#!/bin/bash
set -euo pipefail                    # 1. 永远加这行

# 2. 用法说明
usage() {
  echo "Usage: $(basename $0) <arg1> [optional]"
  exit 1
}
[ $# -lt 1 ] && usage

# 3. 颜色输出（人看的）
RED='\033[0;31m'; GREEN='\033[0;32m'; NC='\033[0m'
ok()   { echo -e "${GREEN}✓${NC} $1"; }
fail() { echo -e "${RED}✗${NC} $1" >&2; exit 1; }

# 4. 幂等性（可以重复执行）
[ -d "output" ] || mkdir output      # 不是 mkdir output（已存在会报错）

# 5. 清理 trap（出错时善后）
cleanup() { rm -f /tmp/myapp.lock; }
trap cleanup EXIT

# 6. 锁文件（防止并发执行）
[ -f /tmp/myapp.lock ] && fail "Already running"
touch /tmp/myapp.lock

# 7. 干跑模式
DRY_RUN=${DRY_RUN:-0}
run() {
  if [ $DRY_RUN -eq 1 ]; then
    echo "[DRY RUN] $@"
  else
    "$@"
  fi
}

run rm -rf old_build/
run docker build .
```

---

## 脚本放在哪，如何管理

```bash
# 目录结构
~/bin/           # 个人脚本，加入 PATH
~/.local/bin/    # XDG 标准位置

# .zshrc 里
export PATH="$HOME/bin:$PATH"

# 用 git 管理（dotfiles 仓库）
~/dotfiles/
  bin/           # 脚本
  .zshrc
  .tmux.conf
  nvim/
```

**最后的认知**：高级程序员不是记住了更多命令，而是对**重复摩擦有条件反射**——同一件事做第二次就开始想"能不能写成脚本"，做第三次就一定会写。脚本库是经验的沉淀，不是提前设计出来的。


```bash
#!/bin/bash

# 1. Create hello.py
cat > hello.py << 'EOF'
print("Hello, World!")
EOF

# 2. List all Python files
find . -name "*.py"

# 3. Current git branch
git branch --show-current

# 4. Create directory and write 3 files
mkdir -p test_output
echo "File 1 content" > test_output/file1.txt
echo "File 2 content" > test_output/file2.txt
echo "File 3 content" > test_output/file3.txt
```



本质需求：理解 Claude Code 用 bash 作为"手"操作文件系统和进程，你需要掌握的不是 bash 全集，而是**agent 视角下最高频的操作模式**。

---

## 初级：文件系统感知（agent 的眼睛）

**查看与导航**

```bash
pwd                          # agent 确认自己在哪
ls -la                       # 看全部，包括隐藏文件
tree -L 2                    # 项目结构快照，agent 最爱用
find . -name "*.py" -type f  # 精确搜索，比 ls 强
```

**读文件**

```bash
cat file.py                  # 小文件直接读
head -n 50 file.py           # 只看前50行，大文件必备
tail -f app.log              # 实时跟踪日志输出
wc -l file.py                # 快速知道文件有多少行
```

> 注：agent loop 里每次 bash 调用都有 token 成本，`head` 比 `cat` 更经济。

---

## 初级：文件操作（agent 的手）

```bash
mkdir -p src/utils/helpers    # -p 连父目录一起建，不报错
cp -r src/ backup/            # 递归复制整个目录
mv old_name.py new_name.py    # 重命名即移动
rm -rf test_output/           # 危险但 agent 常用，无确认提示

# 写文件的两种方式
echo "content" > file.txt     # 覆盖写
echo "content" >> file.txt    # 追加写

# heredoc 写多行（agent 生成代码文件的标准姿势）
cat > main.py << 'EOF'
def hello():
    print("Hello")
EOF
```

> 注：`<< 'EOF'` 单引号防止变量展开，agent 写代码文件必须用这个，否则 `$variable` 会被意外替换。

---

## 中级：文本处理（agent 的分析能力）

**grep — 搜索**

```bash
grep -rn "TODO" .             # 递归搜索，显示行号
grep -l "import pandas" *.py  # 只显示文件名
grep -v "test" requirements.txt  # 反向：不包含的行
grep -E "def .+\(.*self" .    # 正则搜索类方法
```

**sed — 替换**

```bash
sed -i 's/old_func/new_func/g' file.py      # 原地替换
sed -i '1s/^/# Auto-generated\n/' file.py  # 在文件头插入一行
sed -n '10,20p' file.py                     # 只打印第10-20行
```

> 注：`-i` 是原地修改，agent 修 bug 时的核心工具。没有 `-i` 只是预览，不修改文件。

**awk — 结构化提取**

```bash
awk '{print $1}' log.txt           # 提取每行第一列
awk -F',' '{print $2}' data.csv    # CSV 提取第二列
awk '/ERROR/ {print NR, $0}' app.log  # 带行号打印 ERROR 行
ps aux | awk '{print $1, $11}'     # 提取进程用户和命令名
```

---

## 中级：管道组合（agent 的推理链）

```bash
# 找出项目里最大的5个文件
find . -type f | xargs ls -la | sort -k5 -rn | head -5

# 统计代码行数（排除空行和注释）
grep -v "^#\|^$" main.py | wc -l

# 找出所有 import 并去重排序
grep "^import\|^from" *.py | sed 's/.*: //' | sort -u

# 实时监控错误日志
tail -f app.log | grep --line-buffered "ERROR"
```

> 注：管道是 agent loop 的核心模式——每个命令只做一件事，组合起来完成复杂分析。`--line-buffered` 确保实时输出不被缓冲。

---

## 中级：进程与环境

```bash
# 后台运行 + 记录 PID
python server.py > server.log 2>&1 &
echo $! > server.pid          # $! 是最后一个后台进程的 PID

# 之后停止它
kill $(cat server.pid)

# 检查端口占用
lsof -i :8080
ss -tlnp | grep 8080          # 更快

# 环境变量
export API_KEY="xxx"          # 当前 shell 可见
printenv | grep API           # 检查是否生效
```

**重定向**

```bash
command > out.txt 2>&1        # stdout + stderr 都写入文件
command 2>/dev/null           # 静默错误，agent 常用于忽略报错
command | tee output.log      # 同时输出到屏幕和文件
```

> 注：`2>&1` 的顺序不能反。agent 跑长任务时几乎必用，否则看不到 stderr。

---

## 高级：条件判断与错误处理

```bash
# agent 写脚本的标准头
set -euo pipefail
# -e: 任何命令失败立即退出
# -u: 使用未定义变量报错
# -o pipefail: 管道中任一失败都算失败

# 文件存在性检查
[ -f "config.json" ] && echo "exists" || echo "missing"
[ -d "output/" ] || mkdir -p output/

# 命令是否存在
command -v docker &>/dev/null || { echo "docker not found"; exit 1; }

# 捕获错误
if ! python -m pytest tests/; then
    echo "Tests failed, aborting deploy"
    exit 1
fi
```

---

## 高级：xargs 与并行（agent 批处理）

```bash
# 批量操作文件
find . -name "*.pyc" | xargs rm -f
find . -name "*.py" | xargs grep -l "deprecated"

# 并行执行（-P 指定并发数）
cat urls.txt | xargs -P 4 -I{} curl -s {} -o /dev/null

# 带文件名的批量处理
find . -name "*.log" | xargs -I{} sh -c 'echo "Processing: {}"; wc -l {}'
```

> 注：`-I{}` 定义占位符，`-P 4` 4个并发。agent 处理大量文件时，这比循环快4倍。

---

## 高级：jq — JSON 处理（现代 agent 必备）

```bash
# 解析 API 返回
curl -s api/users | jq '.[] | {name, email}'

# 提取嵌套字段
cat package.json | jq '.dependencies | keys[]'

# 过滤条件
cat data.json | jq '.users[] | select(.age > 30) | .name'

# 修改 JSON（agent 改配置文件）
jq '.version = "2.0.0"' package.json > tmp && mv tmp package.json
```

---

## Agent 视角下的优先级总结

```
必须精通（agent 每次 loop 都用）
  cat / find / grep / sed / mkdir / mv / rm / pipe

重要（复杂任务必用）
  awk / xargs / set -euo pipefail / 2>&1 重定向

高频场景专项
  jq（API/config）/ lsof（调试端口）/ tee（日志）
```

核心心法：**bash 命令是 agent 的 tool call**，每一行都是一次世界状态的查询或修改。写 bash 时的思维不是"我要执行什么"，而是"我需要知道什么"或"我需要改变什么"——和 agent loop 本身是同构的。

---

核心问题：Claude Code 的 bash 执行环境继承自你的 shell，但 agent 默认不知道你装了什么武器。关键在于**环境感知**和**提示词中的工具声明**。

---

## 先理解 Agent 的执行环境

Claude Code 用 bash 执行命令时：

- ✅ 继承 `PATH`，所以 `rg`, `fd`, `fzf` 都可以直接调用
- ✅ 继承环境变量
- ❌ **不继承交互式 shell 特性**（`zsh` 的 interactive plugin 不加载）
- ❌ fzf 的交互式 UI 在非 TTY 环境下无效

所以策略是：**用这些工具的非交互模式**，发挥它们的速度和表达力优势。

---

## 工具提升分析

### rg（ripgrep）— 最大收益

Agent 搜索代码是最高频操作，rg 比 grep 快 5-10 倍，且默认忽略 `.gitignore`。

```bash
# grep 写法（agent 默认）
grep -rn "def authenticate" --include="*.py" .

# rg 写法（更快，更精确）
rg "def authenticate" --type py
rg "TODO|FIXME|HACK" --type py -l          # 只输出文件名
rg "class.*Controller" --type py -n --context 3  # 带上下文
rg "import" --type py --stats              # 带统计信息
rg -e "async def" -e "await" --type py     # 多模式
```

**提示词声明：**

```
环境工具：已安装 ripgrep(rg)。搜索代码时优先使用 rg 而非 grep，
使用 --type 过滤文件类型，使用 -l 只返回文件名列表。
```

---

### fd — find 的替代

```bash
# find 写法
find . -name "*.py" -not -path "*/node_modules/*" -type f

# fd 写法
fd -e py                          # 所有 .py 文件，自动忽略 .gitignore
fd -e py -l                       # 带详细信息
fd "controller" -e py             # 文件名包含 controller 的 py 文件
fd -t d "test"                    # 找所有名为 test 的目录
fd -e py --changed-within 1d      # 今天修改过的 py 文件
```

> 注：`--changed-within 1d` 在 debug 时极其有用——agent 可以快速定位最近改动的文件。

---

### zoxide — 对 agent 几乎无用

zoxide 的核心是**学习跳转频率**，需要交互式使用积累数据。agent 在 bash 子进程里调用 `z project` 大概率找不到目标，因为 zoxide 数据库基于你的交互历史。

**结论：跳过，agent 用 `cd` + `fd` 组合代替。**

---

### fzf — 只用非交互模式

```bash
# 交互模式：agent 无法用（需要 TTY）
fzf  # ❌ agent 环境下 hang 住

# 非交互模式：powerful
# 模糊过滤（从 stdin 读，从 stdout 出）
echo -e "foo\nbar\nbaz" | fzf --filter "ba"  # 输出 bar, baz

# 实际用途：从大量文件中精确筛选
fd -e py | fzf --filter "controller"

# 结合 rg 做两阶段搜索
rg -l "authenticate" | fzf --filter "user"  # 先找含关键词的文件，再过滤文件名
```

**提示词声明：**

```
fzf 已安装，但只能使用非交互模式（--filter），不能使用交互式 UI。
```

---

### tmux — agent 的并行执行层
[[Tmux的display-popup]] | [[Tmux操作]]
这是真正的杀手级用法。Claude Code 可以通过 tmux 实现**真正的并行任务**：

```bash
# agent 启动后台任务，不阻塞主 loop
tmux new-session -d -s build "npm run build 2>&1 | tee /tmp/build.log"
tmux new-session -d -s test "pytest tests/ 2>&1 | tee /tmp/test.log"

# 稍后检查结果（非阻塞）
tmux capture-pane -t build -p | tail -20
cat /tmp/build.log | tail -50

# 检查 session 是否还在跑
tmux has-session -t build 2>/dev/null && echo "still running" || echo "done"

# 等待完成
while tmux has-session -t build 2>/dev/null; do sleep 2; done
cat /tmp/build.log
```

**提示词声明：**

```
tmux 已安装。执行耗时任务（build, test, server）时，
使用 tmux new-session -d 后台运行，用 tmux capture-pane 轮询结果，
避免单个 bash call 阻塞超时。
```

---

### jq + yq — 结构化数据处理

```bash
# API 开发中的标准操作
curl -s https://api.example.com/users \
  | jq '[.[] | select(.role == "admin") | {id, email}]'

# 修改配置文件（agent 改 package.json / tsconfig）
jq '.scripts.dev = "vite --port 3001"' package.json | sponge package.json

# yq 处理 YAML（k8s / docker-compose）
yq '.services.api.image' docker-compose.yml
yq '.replicas = 3' deployment.yaml | kubectl apply -f -
```

---

## 商业开发中的实战 SYSTEM PROMPT 模板

```
# 执行环境
Shell: zsh, PATH 包含以下增强工具：
- rg (ripgrep): 代码搜索，优先于 grep
- fd: 文件查找，优先于 find  
- fzf: 仅用 --filter 非交互模式
- tmux: 后台任务执行和结果轮询
- jq/yq: JSON/YAML 处理
- gh (GitHub CLI): PR/Issue 操作
- docker/kubectl: 容器操作

# 工具使用规则
1. 搜索代码 → rg --type [ext]
2. 查找文件 → fd -e [ext] 或 fd -t d
3. 耗时任务 → tmux new-session -d + capture-pane 轮询
4. 解析响应 → jq，不要用 grep/awk 处理 JSON
5. 修改配置 → jq/yq 保证格式，不要 sed JSON

# 项目上下文
monorepo 结构，apps/ 下有 api(FastAPI) 和 web(Next.js)
主要语言：TypeScript, Python
测试：pytest + vitest
```

---

## 真正的效率提升：工具链组合模式

商业开发中最有价值的不是单个工具，是**组合模式**：

```bash
# 模式1：影响分析（改一个函数，找所有调用方）
rg "authenticateUser" --type ts -l \
  | xargs rg -l "import.*auth" \
  | fd -t f -e ts \
  | head -20

# 模式2：快速 code review 上下文
git diff --name-only HEAD~1 \
  | xargs -I{} sh -c 'echo "=== {} ===" && rg "TODO|FIXME" {}'

# 模式3：并行测试 + 实时监控
tmux new-session -d -s api-test "cd apps/api && pytest -x 2>&1 | tee /tmp/api-test.log"
tmux new-session -d -s web-test "cd apps/web && vitest run 2>&1 | tee /tmp/web-test.log"
# ... agent 继续做其他工作 ...
wait; cat /tmp/api-test.log | tail -30; cat /tmp/web-test.log | tail -30

# 模式4：依赖审计
fd -e json -g "package.json" --exclude node_modules \
  | xargs jq -r '.dependencies | keys[]' \
  | sort | uniq -c | sort -rn \
  | head -20  # 找出 monorepo 中最多被依赖的包
```

---

## 优先级结论

```
立即收益（今天就配置）
  rg > grep          搜索速度和精度质变
  fd > find          语法简洁，自动 .gitignore
  tmux 后台执行       解锁并行，避免超时

中期收益（理解后配置）
  jq/yq              结构化数据操作，生产环境必备
  gh CLI             PR/Issue 自动化，CI 集成

跳过
  zoxide             只对人类交互有价值
  fzf 交互模式        agent 环境不可用
```

核心认知：**提示词中的工具声明本质是在给 agent 扩充词汇表**。你不声明，agent 会用它知道的最保守方案（grep/find）。你声明了，agent 会选择更锋利的工具——但前提是你的环境真的装了它们，否则 agent 会在 bash 里碰壁后自动降级。