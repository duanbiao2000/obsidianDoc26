# Anthropic System Prompts API 参考

本文档提供 Anthropic Claude 模型 System Prompts 的完整 API 和工具参考。

## 目录

- [核心 System Prompt API](#核心-system-prompt-api)
- [工具定义 API](#工具定义-api)
- [功能模块 API](#功能模块-api)
- [工具集成 API](#工具集成-api)

---

## 核心 System Prompt API

### Claude 3.7 Sonnet

#### System Message 格式

```xml
<citation_instructions>
  <!-- 引用规则 -->
</citation_instructions>

<artifacts_info>
  <!-- Artifact 使用说明 -->
</artifacts_info>

<past_chats_tools>
  <!-- 过去对话工具 -->
</past_chats_tools>

<!-- 工具特定指令 -->

<search_instructions>
  <!-- 搜索功能指南 -->
</search_instructions>

<!-- 可用工具定义 -->

<userPreferences>
  <!-- 用户偏好 -->
</userPreferences>

<userStyle>
  <!-- 写作风格 -->
</userStyle>

<!-- 核心系统消息 -->

<!-- 额外提醒 -->
```

#### 版本信息

- **Model ID**: `claude-3-sonnet-4-20240229`
- **Knowledge Cutoff**: 2024年4月
- **Max Tokens**: 200,000
- **Supports**: Code, Artifacts, Search, Memory

### Claude 4.1 Opus Thinking

#### 特殊功能

```xml
<citation_instructions>
  <!-- 引用规则 -->
</citation_instructions>

<artifacts_info>
  <!-- Artifact 使用说明 -->
</artifacts_info>

<!-- Thinking Mode 激活 -->
<thinking_mode>
  - Mode: interleaved
  - Max Thinking Length: 16000 tokens
</thinking_mode>

<past_chats_tools>
  <!-- conversation_search + recent_chats -->
</past_chats_tools>

<!-- 其他核心消息 -->
```

#### Thinking Mode 参数

| 参数 | 类型 | 默认值 | 描述 |
|------|------|--------|------|
| mode | string | interleaved | 思维链输出模式 |
| max_thinking_length | integer | 16000 | 最大思考 tokens 数 |

#### 版本信息

- **Model ID**: `claude-opus-4-1-20250120`
- **Knowledge Cutoff**: 2025年1月底
- **Max Thinking Tokens**: 16,000
- **Supports**: Thinking Mode, Code, Artifacts, Search

### Claude 4.5 Sonnet

#### 学习风格

```xml
<learning_style>
  - Personalization: High
  - Adaptation: Dynamic
  - Context Awareness: Enhanced
</learning_style>

<citation_instructions>
  <!-- 引用规则 -->
</citation_instructions>

<!-- 其他核心消息 -->
```

#### 版本信息

- **Model ID**: `claude-sonnet-4-5-20250929`
- **Knowledge Cutoff**: 2025年1月
- **Max Tokens**: 200,000
- **Supports**: Code, Artifacts, Search, Memory, Learning Style

### Claude Code (CLI)

#### System Prompt 结构

```javascript
// 身份定义
"You are Claude Code, Anthropic's official CLI for Claude."

// 安全边界 (CRITICAL FIRST)
"IMPORTANT: Refuse to write code or explain code that may be used maliciously"

// 语气和风格
"Tone and style: concise, direct, and to the point"

// Proactiveness
"# Proactiveness - Balance between doing right and not surprising user"

// 专业客观性
"# Professional objectivity - Prioritize technical accuracy"

// 遵循约定
"# Following conventions - Mimic code style and use existing libraries"

// 代码风格
"# Code style - DO NOT ADD ANY COMMENTS unless asked"

// 任务管理
"# Task Management - Use TodoWrite tools frequently"

// 执行任务
"# Doing tasks - Use search tools extensively"

// 工具使用策略
"# Tool usage policy - Prefer Task tool for file search"
```

#### 版本信息

- **Version**: 0.2.9
- **Model ID**: `claude-opus-4-1-20250805` (for Opus 4.1)
- **Working Directory**: `/Users/asgeirtj`
- **Platform**: Darwin (macOS)

---

## 工具定义 API

### 文件操作工具

#### Read

读取文件内容。

**参数**:
```yaml
filePath:
  type: string
  required: true
  description: 文件的绝对路径
offset:
  type: integer
  default: 0
  description: 开始读取的行号（0-based）
limit:
  type: integer
  default: 2000
  description: 要读取的行数
```

**示例**:
```json
{
  "filePath": "/path/to/file.txt",
  "offset": 100,
  "limit": 50
}
```

#### Write

写入文件（会覆盖现有文件）。

**参数**:
```yaml
content:
  type: string
  required: true
  description: 要写入的内容
filePath:
  type: string
  required: true
  description: 文件的绝对路径
```

**约束**:
- 如果文件已存在，必须先使用 Read 工具读取
- 总是优先编辑现有文件而不是创建新文件
- 除非明确要求否则不要创建文档文件（*.md, README）

#### Edit

对文件进行精确字符串替换。

**参数**:
```yaml
filePath:
  type: string
  required: true
  description: 文件的绝对路径
oldString:
  type: string
  required: true
  description: 要替换的文本
newString:
  type: string
  required: true
  description: 替换后的文本（必须与 oldString 不同）
replaceAll:
  type: boolean
  default: false
  description: 替换所有出现的 oldString
```

**约束**:
- 必须先使用 Read 工具读取文件
- oldString 必须在文件中唯一存在（除非使用 replaceAll）
- 替换多次出现的 oldString 会报错（除非使用 replaceAll）
- 必须保留 Read 工具输出中的精确缩进（制表符/空格）

### 代码操作工具

#### Bash

执行 bash 命令。

**参数**:
```yaml
command:
  type: string
  required: true
  description: 要执行的命令
description:
  type: string
  required: true
  description: 命令的清晰描述（5-10词）
timeout:
  type: integer
  default: 120000
  description: 超时时间（毫秒）
workdir:
  type: string
  default: /mnt/d/MyDocs/obsidianDoc26/system_prompts_leaks/Anthropic
  description: 工作目录
```

**最佳实践**:
- 使用 `workdir` 参数而不是 `cd` 命令
- 总是用双引号包裹包含空格的文件路径
- 并行执行多个独立的 bash 调用
- 避免 `find`, `grep`, `cat`, `head`, `tail`, `sed`, `awk`, `echo` 命令（使用专门的工具）

#### LSP Diagnostics

在运行构建前获取错误、警告、提示。

**参数**:
```yaml
filePath:
  type: string
  required: true
  description: 文件路径
severity:
  type: string
  enum: [error, warning, information, hint, all]
  default: all
  description: 诊断级别
```

#### LSP Goto Definition

跳转到符号定义。查找某物定义的位置。

**参数**:
```yaml
filePath:
  type: string
  required: true
line:
  type: integer
  required: true
  minimum: 1
character:
  type: integer
  required: true
  minimum: 0
```

#### LSP Find References

在整个工作区查找所有用法/引用。

**参数**:
```yaml
filePath:
  type: string
  required: true
line:
  type: integer
  required: true
  minimum: 1
character:
  type: integer
  required: true
  minimum: 0
includeDeclaration:
  type: boolean
  default: true
```

#### LSP Symbols

从文件（文档）或跨工作区搜索获取符号。

**参数**:
```yaml
filePath:
  type: string
  required: true
scope:
  type: string
  enum: [document, workspace]
  default: document
  description: document 用于文件大纲，workspace 用于项目范围符号搜索
query:
  type: string
  description: 查询字符串
limit:
  type: integer
  description: 结果数量限制
```

#### LSP Rename

在整个工作区重命名符号。应用所有文件的更改。

**参数**:
```yaml
filePath:
  type: string
  required: true
line:
  type: integer
  required: true
  minimum: 1
character:
  type: integer
  required: true
  minimum: 0
newName:
  type: string
  required: true
  description: 新的符号名称
```

### 搜索和检索工具

#### Grep

正则表达式内容搜索。

**参数**:
```yaml
pattern:
  type: string
  required: true
  description: 正则表达式模式
path:
  type: string
  description: 搜索路径
include:
  type: string
  description: 按模式筛选文件（如 *.js）
```

#### Glob

文件模式匹配（支持 glob 模式）。

**参数**:
```yaml
pattern:
  type: string
  required: true
  description: Glob 模式（如 **/*.js, src/**/*.ts）
path:
  type: string
  description: 搜索路径
```

**示例**:
```json
{
  "pattern": "**/*.md",
  "path": "/path/to/project"
}
```

#### AST Grep Search

使用 AST 感知匹配的代码模式搜索（支持25种语言）。

**参数**:
```yaml
pattern:
  type: string
  required: true
  description: AST 模式（必须是完整的 AST 节点，即有效代码）
lang:
  type: string
  enum: [bash, c, cpp, csharp, css, elixir, go, haskell, html, java,
          javascript, json, kotlin, lua, nix, php, python, ruby, rust,
          scala, solidity, swift, typescript, tsx, yaml]
  required: true
paths:
  type: array
  items:
    type: string
  description: 文件路径列表
globs:
  type: array
  items:
    type: string
  description: Glob 模式列表
context:
  type: integer
  description: 上下文行数
```

**元变量**:
- `$VAR` - 单个节点
- `$$$` - 多个节点

**示例**:
```python
# 查找函数定义
pattern: 'async function $NAME($$$) { $$$ }'
lang: 'typescript'

# 查找 useState hooks
pattern: 'useState($$$)'
lang: 'typescript'
```

#### AST Grep Replace

使用 AST 感知重写替换代码模式（默认 dry-run）。

**参数**:
```yaml
pattern:
  type: string
  required: true
rewrite:
  type: string
  required: true
lang:
  type: string
  required: true
paths:
  type: array
globs:
  type: array
dryRun:
  type: boolean
  default: true
  description: 如果为 true，只显示不执行替换
```

**示例**:
```yaml
# 替换 console.log 为 logger.info
pattern: 'console.log($MSG)'
rewrite: 'logger.info($MSG)'
lang: 'javascript'
dryRun: false
```

### 网络工具

#### Web Fetch

获取指定 URL 的内容。

**参数**:
```yaml
url:
  type: string
  required: true
  description: 格式完整的有效 URL
format:
  type: string
  enum: [markdown, text, html]
  default: markdown
  description: 返回内容的格式
timeout:
  type: integer
  default: 120
  maximum: 120
  description: 超时时间（秒）
```

**特性**:
- HTTP URL 自动升级到 HTTPS
- 只读，不修改文件
- 如果内容过大，输出会被截断
- 返回 CommonMark 格式的 markdown

#### Web Search

使用 WebSearch 进行网络搜索。

**参数**:
```yaml
query:
  type: string
  required: true
  description: Websearch 查询
numResults:
  type: integer
  default: 8
  description: 返回结果数量（必须是数字）
livecrawl:
  type: string
  enum: [fallback, preferred]
  default: fallback
  description: Live crawl 模式
type:
  type: string
  enum: [auto, fast]
  default: auto
  description: 搜索类型
contextMaxCharacters:
  type: integer
  default: 10000
  description: LLM 优化的上下文字符串最大字符数（必须是数字）
```

### 任务管理工具

#### Todo Write

创建和管理结构化的任务列表。

**参数**:
```yaml
todos:
  type: array
  required: true
  items:
    type: object
    properties:
      content:
        type: string
        description: 任务的简要描述
      status:
        type: string
        enum: [pending, in_progress, completed, cancelled]
        description: 当前状态
      priority:
        type: string
        enum: [high, medium, low]
        description: 优先级级别
      id:
        type: string
        description: 唯一标识符
    required: [content, status, priority, id]
```

**使用场景**:
- 多步骤任务（2+ 步骤）
- 复杂任务（需要仔细规划）
- 用户请求的多个项目
- 不确定范围时（todos 澄清思路）

#### Delegate Task

使用 category-based 或直接 agent 选择来生成 agent 任务。

**参数**:
```yaml
load_skills:
  type: array
  items:
    type: string
  required: true
  description: 必须传递至少一个 skill 名称
description:
  type: string
  required: true
prompt:
  type: string
  required: true
run_in_background:
  type: boolean
  default: false
  description: true=async（返回 task_id），false=sync（等待结果）
category:
  type: string
  enum: [visual-engineering, ultrabrain, deep, artistry, quick,
          unspecified-low, unspecified-high, writing]
  description: 使用预定义 category 生成 Sisyphus-Junior
subagent_type:
  type: string
  enum: [build, plan, general, explore, prometheus, sisyphus-junior,
          oracle, librarian, multimodal-looker, metis, momus, glm-plan-usage,
          glm-plan-bug, superpowers:code-reviewer, superpowers-chrome:browser-user,
          episodic-memory:search-conversations,
          agents-language-specialists:golang-expert,
          agents-language-specialists:ruby-expert,
          agents-language-specialists:java-developer,
          agents-language-specialists:rust-expert,
          agents-language-specialists:python-expert,
          agents-language-specialists:php-developer,
          agents-language-specialists:typescript-expert,
          agents-language-specialists:c-developer,
          agents-language-specialists:sql-expert,
          agents-language-specialists:cpp-engineer,
          agents-language-specialists:rails-expert,
          agents-language-specialists:javascript-developer,
          agents-development-architecture:nextjs-app-router-developer,
          agents-development-architecture:ios-developer,
          agents-development-architecture:mobile-developer,
          agents-development-architecture:wordpress-developer,
          agents-development-architecture:frontend-developer,
          agents-development-architecture:backend-architect,
          agents-development-architecture:laravel-vue-developer,
          agents-development-architecture:directus-developer,
          agents-development-architecture:drupal-developer,
          agents-development-architecture:react-performance-optimization,
          agents-development-architecture:graphql-architect,
          code-documentation:code-reviewer,
          code-documentation:docs-architect,
          code-documentation:tutorial-engineer]
  description: 直接使用特定的 agent
session_id:
  type: string
  description: 现有任务会话以继续
command:
  type: string
  description: 触发任务的命令（用于 slash command 跟踪）
```

**约束**:
- category 和 subagent_type 互斥（除非继续会话）
- load_skills 是 REQUIRED
- run_in_background=true 仅用于并行探索（5+ 独立查询）

**Available Categories**:

| Category | Domain / Best For |
|----------|-------------------|
| `visual-engineering` | Frontend, UI/UX, design, styling, animation |
| `ultrabrain` | Use ONLY for genuinely hard, logic-heavy tasks. Give clear goals only |
| `deep` | Goal-oriented autonomous problem-solving. Thorough research before action |
| `artistry` | Complex problem-solving with unconventional, creative approaches |
| `quick` | Trivial tasks - single file changes, typo fixes, simple modifications |
| `unspecified-low` | Tasks that don't fit other categories, low effort |
| `unspecified-high` | Tasks that don't fit other categories, high effort |
| `writing` | Documentation, prose, technical writing |

---

## 功能模块 API

### Citation Instructions

#### 引用规则

**必需条件**:
- 如果响应基于 `web_search`, `drive_search`, `google_drive_search`, 或 `google_drive_fetch` 工具返回的内容，必须始终适当引用响应

**引用格式**:

```xml
<antml:cite index="DOC_INDEX-SENTENCE_INDEX">声明内容</antml:cite>
```

**索引格式**:
- **单句**: `DOC_INDEX-SENTENCE_INDEX`
- **连续多句（section）**: `DOC_INDEX-START_SENTENCE_INDEX:END_SENTENCE_INDEX`
- **多个 sections**: `DOC_INDEX-START:END,DOC_INDEX-START:END`（逗号分隔）

**规则**:
1. 使用支持声明的最少句子数
2. 不要添加不必要的引用，除非必要
3. 声明必须用自己的话，不要精确引用原文
4. 引用标签用于归属，不是许可复制原文
5. 不要在 `<antml:cite>` 标签外包含索引值
6. 如果搜索结果不包含相关信息，礼貌告知用户无法在搜索结果中找到答案

**示例**:

```xml
<!-- 正确 -->
<antml:cite index="0-2">评论家热情赞扬了这部电影</antml:cite>

<!-- 错误 -->
评论家称其为 <antml:cite index="0-2">"a delight and a revelation"</antml:cite>
```

### Artifacts

#### Artifact 类型

| 类型 | MIME 类型 | 用途 |
|------|-----------|------|
| Code | `application/vnd.ant.code` | 代码文件 |
| Documents | `text/markdown` | Markdown 文档 |
| HTML | `text/html` | HTML 页面 |
| SVG | `image/svg+xml` | SVG 图形 |
| Mermaid Diagrams | `application/vnd.ant.mermaid` | Mermaid 图表 |
| React Components | `application/vnd.ant.react` | React 组件 |

#### 使用规则

**必须使用 Artifacts**:
- 原创创意写作（故事、剧本、论文）
- 深度长篇分析内容（评论、批评、分析）
- 编写自定义代码解决特定用户问题
- 用于对话外使用的内容（报告、邮件、演示文稿、单页纸、博客文章、广告）

**不应使用 Artifacts**:
- 短片段代码
- 快速修复或简单示例
- 仅在对话内使用的内容
- 不需要独立查看/编辑的内容

### Memory System

#### 记忆应用指令

**选择性应用**:
- 从零记忆（通用问题）到全面个性化（显式个人请求）
- 除非用户询问 Claude 记住什么或请求澄清知识来自过去对话，否则从不解释选择过程

**记忆使用场景**:

**必须应用记忆**:
- 显式请求个性化（如"根据你对我的了解"）
- 直接引用过去对话或记忆内容
- 直接关于用户的问题（who/what/when/where），且答案存在于记忆中
  - 立即陈述事实，无前言或不确定性
  - 仅陈述记忆中立即相关的事实

**不应应用记忆**:
- 不需要个性化的通用技术问题
- 强化不安全、不健康或有害行为的内容
- 个人细节会令人惊讶或无关的上下文
- 可能阻碍诚实反馈、批判性思维或建设性批评的偏好

**敏感属性**:
- 仅在必要、安全、适当且准确时引用存储的敏感属性（种族、民族、身体或心理健康状况、原籍、性取向或性别认同）
- 否则，提供普遍适用的响应

### Search Instructions

#### 搜索工具

| 工具 | 用途 |
|------|------|
| `web_search` | 搜索引擎，返回前10个最高排名的网页结果 |
| `web_fetch` | 获取特定 URL 的内容 |
| `google_drive_search` | 搜索 Google Drive 文件 |
| `google_drive_fetch` | 获取 Google Drive 文件 |

#### 查询复杂度分类

**1. Never Search Category**
- 不需要搜索的简单查询
- 示例："2+2=?", "如何列出目录中的文件?"

**2. Do Not Search But Offer Category**
- 不搜索但提供选项的查询
- 示例："法国的首都是哪里?"（Claude 应该正常回答并主动提供搜索更多细节）

**3. Single Search Category**
- 单次搜索足够的查询
- 示例："Python 中如何使用 list comprehension?"

**4. Research Category**
- 需要多轮搜索的深度研究
- **研究过程**:
  1. 识别未知信息
  2. 搜索缺失信息
  3. 评估搜索结果
  4. 如需要，搜索更多细节
  5. 重复直到满足或达到合理极限

#### 搜索指南

**何时搜索**:
- 需要未知信息时
- 信息可能在知识截止日期后发生变化时

**如何搜索**:
- 缩放工具调用数量以适应查询复杂度
- 使用最佳工具进行查询

**响应指南**:
- 基于搜索结果提供答案
- 必须包含引用
- 如果搜索结果不包含相关信息，礼貌告知用户无法找到答案

#### 版权限制

**严重违规**（适用于每次响应）:
- 从单个来源引用 15+ 词

**引用标签**:
- 每个具体声明必须用 `<antml:cite>` 标签包裹
- 标签内的声明必须用自己的话，不要精确引用
- 引用标签用于归属，不是许可复制原文

### Past Chats Tools

#### conversation_search

基于话题/关键词搜索过去对话。

**参数**:
```yaml
query:
  type: string
  required: true
  description: 实质关键词（名词、特定概念、项目名称）
```

**使用场景**:
- "我们讨论了关于 [specific topic] 的什么"
- "找到我们关于 [X] 的对话"

#### recent_chats

基于时间检索过去对话（1-20次聊天）。

**参数**:
```yaml
n:
  type: integer
  description: 数量
before:
  type: string
  format: datetime
  description: 日期时间过滤器
after:
  type: string
  format: datetime
  description: 日期时间过滤器
sort_order:
  type: string
  enum: [asc, desc]
  description: 排序顺序
```

**使用场景**:
- "我们昨天讨论了什么"
- "显示 [日期] 的聊天"

**多个调用**:
- 允许多次调用获取 >20 结果（停止约5次调用后）

**触发模式**:

**始终使用过去对话工具当看到**:
- 显式引用: "继续我们关于...", "我们讨论了什么...", "我之前提到..."
- 时间引用: "我们昨天讨论了什么", "显示上周的聊天"
- 隐式信号:
  - 过去时态动词: "你建议了", "我们决定"
  - 所有限定词: "我的项目", "我们的方法"
  - 定冠词假设共享知识: "那个bug", "那个策略"
  - 无先行词代词: "帮我修复它", "那个怎么样?"
  - 假设问题: "我提到...", "你记得..."

**高置信度关键词**:
- 可能出现在原始讨论中的名词（如 "movie", "hungry", "pasta"）
- 特定话题、技术或概念（如 "machine learning", "OAuth", "Python debugging"）
- 项目或产品名称（如 "Project Tempest", "customer dashboard"）
- 专有名词（如 "San Francisco", "Microsoft", "Jane's recommendation"）
- 特定领域术语（如 "SQL queries", "derivative", "prognosis"）
- 其他独特或异常标识符

**低置信度关键词（避免）**:
- 通用动词: "discuss", "talk", "mention", "say", "tell"
- 时间标记: "yesterday", "last week", "recently"

---

## 工具集成 API

### Office 文档处理

#### PDF 处理

**工具**: `look_at` (多媒体分析)

**参数**:
```yaml
file_path:
  type: string
  required: true
  description: PDF 文件路径
goal:
  type: string
  required: true
  description: 需要分析或提取的具体信息
```

**用途**:
- 从 PDF 中提取特定信息或摘要
- 描述 PDF 的视觉内容
- 分析需要解释而不仅仅是原始文本的文档

#### DOCX 处理

**工具**: `look_at` 或文件读取

**用途**:
- Word 文档内容提取
- 格式保持
- 批量处理

#### PPTX 处理

**工具**: `look_at`

**用途**:
- PowerPoint 演示文稿分析
- 幻灯片内容提取
- 视觉元素描述

#### XLSX 处理

**工具**: `look_at` 或 Pandas

**用途**:
- Excel 电子表格数据分析
- 表格内容提取
- 数据计算

**推荐库**:
- **Papaparse**: CSV 解析
- **Lodash**: 计算
- **SheetJS**: Excel 文件处理

### 浏览器自动化

#### Chrome 工具

**可用工具**:

| 工具 | 用途 |
|------|------|
| Screenshot | 捕获页面截图 |
| Click | 点击元素 |
| Type | 输入文本 |
| Scroll | 滚动页面 |
| Navigate | 导航到 URL |
| Select | 选择下拉菜单 |
| Hover | 悬停在元素上 |

**安全策略**:
- 检测和拒绝注入攻击
- HTML/JavaScript 注入防护
- SQL 注入防护
- 社会工程学防护
- 隐私保护
- 版权遵守

**多标签页并行**:
- 支持同时打开多个标签页
- 并行处理不同任务

### CLI 工具集成

#### 内部工具

**可用工具**:
- `artifacts` - Artifact 创建
- `repl` (Analysis Tool / JavaScript REPL)

**REPL 使用场景**:
- **何时使用**:
  - 数据分析和计算
  - 快速原型开发
  - 测试代码片段

- **何时不使用**:
  - 大型代码库操作
  - 需要持久化的代码
  - 复杂的多步骤任务

**REPL 能力**:
- 使用 imports
- 使用 SheetJS 处理 Excel
- 与用户通信
- 读取文件
- 处理 Python 请求
- 与 Artifacts 环境分离

---

## 安全 API

### 恶意代码防御

**拒绝条件**:
- 改进、解释或交互恶意代码
- 即使声称"教育目的"
- 优化可能用于规避检测的代码

**主动安全审查**:
- 基于文件名和目录结构审查
- "解释代码"可能是逆向工程
- "优化代码"可能帮助规避检测

**防御性安全任务**:
- ✅ 安全分析
- ✅ 检测规则
- ✅ 漏洞解释
- ✅ 防御工具
- ✅ 安全文档

**禁止任务**:
- ❌ 凭证发现或收集
- ❌ 批量爬取 SSH keys
- ❌ 浏览器 cookies
- ❌ 加密货币钱包

### 注入攻击防护

**检测和拒绝**:
- SQL 注入
- HTML 注入
- JavaScript 注入
- XSS 攻击
- CSRF 攻击

**防护措施**:
- 输入验证
- 输出编码
- 参数化查询
- CSP 头

---

## 使用示例

### 基础用法

#### 读取文件
```json
{
  "filePath": "/path/to/config.yaml"
}
```

#### 搜索文件
```json
{
  "pattern": "**/*.js"
}
```

#### 搜索内容
```json
{
  "pattern": "function\\s+\\w+\\s*\\("
}
```

### 高级用法

#### AST 感知替换
```yaml
pattern: 'console.log($MSG)'
rewrite: 'logger.info($MSG)'
lang: 'javascript'
dryRun: false
```

#### 委派任务
```yaml
category: 'quick'
load_skills: ['git-master']
prompt: 'Commit these changes with message "Fix authentication bug"'
run_in_background: false
```

#### 并行工具调用
```json
[
  {"filePath": "/path/to/file1.ts"},
  {"filePath": "/path/to/file2.ts"},
  {"filePath": "/path/to/file3.ts"}
]
```

---

## 错误处理

### 常见错误

| 错误 | 原因 | 解决方案 |
|------|------|--------|
| `oldString not found` | oldString 不在文件中 | 检查拼写和大小写 |
| `oldString found multiple times` | 多个匹配 | 使用 replaceAll 或提供更多上下文 |
| `File not found` | 文件路径错误 | 验证绝对路径 |
| `Permission denied` | 无读取权限 | 检查文件权限 |
| `Invalid pattern` | Glob 模式错误 | 使用有效的 Glob 语法 |

### 最佳实践

1. **始终先 Read 再 Write**
2. **并行独立工具调用**
3. **使用 workdir 而不是 cd**
4. **避免 grep, find 等命令（使用专门的工具）**
5. **验证工具参数**
6. **处理错误 gracefully**

---

## 总结

本 API 参考提供了 Anthropic Claude System Prompts 的完整工具和功能接口文档，包括：

- **核心 System Prompt API**: Claude 3.7, 4.1, 4.5 等模型版本
- **工具定义 API**: 文件操作、代码操作、搜索、网络工具
- **功能模块 API**: Citation, Artifacts, Memory, Search, Past Chats
- **工具集成 API**: Office 文档、浏览器自动化、CLI 工具
- **安全 API**: 恶意代码防御、注入攻击防护

使用此参考集成 Claude 的强大功能到您的应用中。
