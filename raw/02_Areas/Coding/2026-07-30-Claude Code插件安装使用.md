---
title:
date:
tags:
aliases:
cssclasses:
status: in-progress
rating:
due:
source:
domain:
core_concepts:
---
建议你在 **WSL2 的项目目录**中先用 **Claude Code 插件方式**安装 ECC；它最简单，也最适合先试用。**不要同时执行插件安装和全量脚本安装**，否则 skills、hooks、commands 可能重复加载。 [github](https://github.com/affaan-m/ECC/discussions/2015)

## 安装前准备

确保已经安装并能运行 Claude Code；ECC 的故障排查文档要求 Claude Code 2.0 及以上。 [github](https://github.com/affaan-m/ECC/blob/main/TROUBLESHOOTING.md)

```bash
claude --version
```

建议项目放在 WSL 的 Linux 文件系统，例如：

```bash
mkdir -p ~/projects/my-app
cd ~/projects/my-app
git init
claude
```

## 方式一：Claude Code 插件

在 **Claude Code 交互界面**中输入：

```text
/plugin marketplace add https://github.com/affaan-m/ECC
/plugin install ecc@ecc
```

安装完成后，ECC 的 commands、agents、skills 和 hooks 会通过插件提供；之后可通过带命名空间的命令调用，例如 `/ecc:plan`。 [github](https://github.com/affaan-m/ECC/blob/main/docs/zh-TW/README.md)

检查是否已安装：

```text
/plugin list ecc@ecc
```

如果更新：

```text
/plugin update ecc@ecc
```

## 安装规则

插件不会自动为你配置所有项目规则。推荐只复制 **公共规则 + 当前技术栈规则**，避免不相关规则长期占用上下文。官方建议不要一开始复制全部规则目录。 [github](https://github.com/affaan-m/ECC/discussions/2015)

先把仓库克隆到本地：

```bash
cd ~
git clone https://github.com/affaan-m/ECC.git
```

假设你主要做 Python 和 JavaScript/TypeScript，可在 WSL 中创建个人级规则目录并选择性复制：

```bash
mkdir -p ~/.claude/rules/ecc

cp -r ~/ECC/rules/common ~/.claude/rules/ecc/
cp -r ~/ECC/rules/python ~/.claude/rules/ecc/
cp -r ~/ECC/rules/typescript ~/.claude/rules/ecc/
```

若你希望规则**只影响当前仓库**，而不是所有项目，改用：

```bash
cd ~/projects/my-app
mkdir -p .claude/rules/ecc

cp -r ~/ECC/rules/common .claude/rules/ecc/
cp -r ~/ECC/rules/python .claude/rules/ecc/
```

全局规则位于 `~/.claude/rules/...`；项目级规则位于 `.claude/rules/...`。二选一更清晰：个人默认习惯放全局，具体框架或严格约束放项目内。 [github](https://github.com/affaan-m/ECC/discussions/2015)

## 方式二：手动精细安装

如果你不想使用 Claude Code plugin，或要完全手工控制组件，可只使用手动安装路径。**此时不要再运行 `/plugin install`。** [github](https://github.com/affaan-m/ECC/discussions/856)

先克隆并预览安装计划：

```bash
git clone https://github.com/affaan-m/ECC.git ~/ECC
cd ~/ECC
npm install

node scripts/install-apply.js --dry-run \
  --profile developer \
  --with lang:python \
  --with lang:typescript \
  --with capability:security
```

确认预览内容后，去掉 `--dry-run` 执行实际安装：

```bash
node scripts/install-apply.js \
  --profile developer \
  --with lang:python \
  --with lang:typescript \
  --with capability:security
```

这比旧式的“一个语言参数就全装”的方式更适合按能力和技术栈选择安装内容。 [github](https://github.com/affaan-m/ECC/discussions/856)

## 最小使用示例

### 先规划，再编码

进入项目后启动 Claude Code：

```bash
cd ~/projects/my-app
claude
```

让 ECC 把需求拆分成可验证的计划：

```text
/ecc:plan "为 FastAPI 项目增加 JWT 登录、注册和受保护的 /me 接口；先分析现有目录、依赖与测试，再给出分阶段计划，不要立刻改代码"
```

然后确认计划后：

```text
按刚才计划实施。先补充测试；每完成一个阶段运行相关测试。涉及数据库迁移前先解释变更。
```

ECC 的 `search-first` 工作流强调在编码前查阅现有代码和相关 API，以减少凭空猜测依赖接口的情况。 [explainx](https://explainx.ai/skills/aradotso/trending-skills/everything-claude-code-harness)

### 代码审查与安全检查

完成修改后可直接要求：

```text
请审查当前未提交改动：检查逻辑错误、边界条件、测试缺口、性能问题和安全风险；不要修改文件，按严重程度给出问题与修复建议。
```

或使用 ECC 提供的安全审查工作流：

```text
/ecc:security-review
```

其安全能力包括 OWASP Top 10 检查、密钥检测与安全编码模式；同时，AgentShield 可用于审计 Agent 配置和会话相关风险。 [ecc](https://ecc.tools/)

### 研究优先的 Python 自动化任务

这个提示适合你的抓取/整理类项目：

```text
先研究现有代码、README 和依赖文档。
目标：把多个网页来源抓取为 Markdown，保存到 Obsidian vault。
约束：不覆盖已有文件；先用 --dry-run 输出计划；为网络请求设置 timeout、重试和日志；
实现后用样例 HTML 写 pytest 测试。
```

这里无需背诵所有 ECC 命令；核心是把“先研究、最小改动、可测试、可审查”的约束交给 harness 持续执行。

## 维护与排错

若插件未正确加载，依次运行：

```bash
ecc list-installed
ecc doctor
ecc repair
```

然后再检查 Claude Code 插件缓存：

```bash
ls -la ~/.claude/plugins/cache/
```

ECC 官方排错文档建议优先用 `doctor` 和 `repair` 恢复，不要一开始就手动删除插件缓存。 [github](https://github.com/affaan-m/ECC/blob/main/TROUBLESHOOTING.md)

## 建议的起步配置

| 内容 | 建议 |
|---|---|
| 安装路径 | Claude Code plugin |
| Rules | `common` + `python`；需要时再加 `typescript` |
| Skills | `search-first`、规划、测试、代码审查、安全审查 |
| Hooks | 仅格式化、测试提示、危险 Git 命令确认 |
| MCP | 从 1 个开始；ECC 文档建议每项目启用的 MCP server 控制在 10 个以内，以限制上下文成本。  [github](https://github.com/affaan-m/ECC/blob/main/docs/token-optimization.md) |
| 后续再加 | Memory、multi-agent 编排、worktree lifecycle、MCP inventory |

对你而言，先在一个小型 Python 自动化仓库安装并验证一周，再决定是否将规则放到 `~/.claude` 全局目录，会比直接部署全量 ECC 更稳。

