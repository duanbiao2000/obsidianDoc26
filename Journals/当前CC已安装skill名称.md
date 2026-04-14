
| Skill 名称                      | 一句话概述                                                     |
| ----------------------------- | --------------------------------------------------------- |
| address-github-comments       | 使用 GitHub CLI 解决 PR 评论和 issue 反馈                          |
| agent-manager-skill           | 通过 tmux 会话管理多个本地 CLI agents（启动/停止/监控/分配任务）                |
| agent-teams                   | 多 Agent 协同编排系统，支持并行任务调度、团队状态监控和预定义模板                      |
| brainstorming                 | 在创建功能、构建组件或修改行为前进行头脑风暴                                    |
| claude-code-guide             | Claude Code 使用的综合指南（配置、提示策略、调试技巧）                         |
| dispatching-parallel-agents   | 面向独立任务的并行调度（无共享状态或顺序依赖）                                   |
| doc-coauthoring               | 文档协作工作流，包括上下文收集、内容优化和读者测试                                 |
| file-organizer                | 智能文件和文件夹整理（理解上下文、查找重复、建议结构）                               |
| find-skills                   | 发现和安装 agent skills                                        |
| git-pushing                   | Stage、commit 和 push git 变更（使用传统提交信息）                      |
| github-kb                     | GitHub 本地仓库知识库管理（优先本地查找 + gh 命令远程搜索）                      |
| github-trending               | 查询 GitHub 综合热门项目（最近30天有更新 + 星标 > 5000）                    |
| github-trending-active        | 查询 GitHub 近期活跃项目（最近30天有更新 + 星标 > 1000）                    |
| github-trending-new           | 查询 GitHub 新崛起项目（最近30天创建 + 星标 > 100）                       |
| github-workflow-automation    | GitHub 工作流自动化（PR 审查、issue 分类、CI/CD 集成）                    |
| ielts-reading-practice        | 雅思阅读互动练习（从真题中随机提取文章进行测试和分析）                               |
| instaclaw                     | AI agents 的照片分享平台（分享图片、浏览动态、点赞评论）                         |
| internal-comms-anthropic      | 撰写 Anthropic 风格的内部沟通文档（状态报告、领导更新、通讯）                      |
| internal-comms-community      | 撰写社区风格的内部沟通文档（状态报告、领导更新、通讯）                               |
| linux-privilege-escalation    | Linux 权限提升（识别和利用配置错误获得 root 访问）                           |
| linux-shell-scripting         | Linux 生产环境 Shell 脚本（备份、监控、用户管理、自动化）                       |
| ljg-xray-book                 | 深度拆书（使用 Epiplexity 原理从书中提取可学习的结构）                         |
| mcp-builder                   | 创建高质量 MCP 服务器（让 LLM 与外部服务交互）                              |
| notebooklm                    | 查询 Google NotebookLM 笔记本（通过 Gemini 获得基于来源的答案）             |
| planning-with-files           | 复杂任务的文件化规划（Manus 风格：task_plan.md、findings.md、progress.md） |
| playwright-skill              | Playwright 浏览器自动化（测试页面、填写表单、截图、检查响应式设计）                   |
| prompt-engineering            | 提示工程模式、最佳实践和优化技术指南                                        |
| scanning-tools                | 安全扫描工具（网络发现、漏洞评估、Web 应用测试）                                |
| ship-learn-next               | 将学习内容转化为可执行的实施计划（Ship → Learn → Next 循环）                  |
| skill-creator                 | 创建有效技能的指南（扩展 Claude 的专业知识和工作流）                            |
| skill-developer               | 创建和管理 Claude Code skills（遵循 Anthropic 最佳实践）               |
| writing-clearly-and-concisely | 清晰简洁写作（应用 Strunk 的规则编写文档、提交信息、错误信息）                       |


## 已安装的 Plugins 及其 Skills

### 统计概览

|Plugin|Skills 数量|主要领域|
|---|---|---|
|claude-hud|0|UI 状态栏|
|obsidian-skills|5|知识管理|
|prompts.chat|4|提示词管理|
|minimalist-entrepreneur|10|创业指导|
|claude-plugins-official|25|开发工具集|
|**总计**|**44 skills**|-|

---

### 1. claude-hud

实时状态栏 HUD，提供 token 使用、上下文窗口等实时状态显示，不包含独立 skills。

---

### 2. obsidian-skills

|Skill 名称|功能描述|
|---|---|
|obsidian-cli|Obsidian 命令行接口（读写笔记、任务管理）|
|json-canvas|创建和编辑 JSON Canvas 文件（思维导图）|
|obsidian-markdown|Obsidian Flavored Markdown 支持|
|obsidian-bases|创建和编辑 Obsidian Bases（数据库视图）|
|defuddle|从网页提取干净的 markdown 内容|

---

### 3. prompts.chat

|Skill 名称|功能描述|
|---|---|
|widget-generator|生成 UI 组件|
|book-translation|书籍翻译|
|prompt-lookup|搜索和发现 AI 提示词|
|skill-lookup|搜索、检索和安装 Agent Skills|

---

### 4. minimalist-entrepreneur

|Skill 名称|功能描述|
|---|---|
|company-values|定义公司价值观和文化|
|find-community|识别和评估创业社区|
|first-customers|获取前 100 个客户的策略|
|grow-sustainably|可持续增长决策评估|
|marketing-plan|通过内容建立受众的营销计划|
|minimalist-review|通过极简主义视角审查业务决策|
|mvp|手动优先的 MVP 构建指南|
|pricing|产品定价策略|
|processize|将产品创意转化为可执行流程|
|validate-idea|验证商业想法框架|

---

### 5. claude-plugins-official

**Development & DevOps**

|Skill 名称|功能描述|
|---|---|
|agent-development|Agent 开发指南|
|build-mcp-server|构建 MCP 服务器（TypeScript/Node）|
|build-mcp-app|构建 MCP 应用|
|build-mcpb|构建 MCP 服务器（Python/FastMCP）|
|mcp-integration|MCP 集成指南|
|plugin-dev|插件开发（包含 8 个子技能）|
|plugin-structure|插件结构|
|skill-development|技能开发|
|skill-creator|技能创建器|
|command-development|命令开发|
|hook-development|Hook 开发|
|plugin-settings|插件设置管理|

**Writing & Documentation**

|Skill 名称|功能描述|
|---|---|
|claude-md-improver|CLAUDE.md 文档改进器|
|writing-rules|写作规则|

**Automation & Setup**

|Skill 名称|功能描述|
|---|---|
|claude-automation-recommender|Claude 自动化推荐器|
|claude-code-setup|Claude Code 设置向导|

**External Integrations**

|Skill 名称|功能描述|
|---|---|
|access ×3|Discord / Telegram / iMessage 访问和配置|
|configure ×3|Discord / Telegram / iMessage 配置|

**Other**

|Skill 名称|功能描述|
|---|---|
|frontend-design|前端设计|
|math-olympiad|数学奥林匹克|
|example-command|示例命令|
|example-skill|示例技能|
|playground|测试环境|

---

> **注意**：Plugins 中的 skills（位于 `~/.claude/plugins/marketplaces/`）与本地 skills（位于 `~/.agents/skills/`）是两套独立系统。