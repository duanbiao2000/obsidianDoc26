# Anthropic System Prompts 架构文档

## 概述

本文档描述 Anthropic Claude 模型的 System Prompts 库的架构和组织结构。

## 目录结构

```
Anthropic/
├── claude-3.7-sonnet-full-system-message-humanreadable.md  (126K)
├── claude-3.7-sonnet-w-tools.md                      (112K)
├── claude-3.7-sonnet-w-tools.xml                       (112K)
├── claude-4.1-opus-thinking.md                          (116K)
├── claude-4.5-sonnet.md                               (140K)
├── claude-4.5-sonnet-learning-style                     (4K)
├── claude-sonnet-4.md                                  (124K)
├── claude-sonnet-4.txt                                 (104K)
├── claude-opus-4.5                                     (92K)
├── claude.txt                                           (112K)
├── claude-code.js                                       (16K)
├── claude-code.md                                       (32K)
├── claude-code-2025-11-1.md                             (28K)
├── claude-code-plan-mode.md                              (12K)
├── calude_code_cli_tools.md                              (52K)
├── claude-in-chrome.md                                  (52K)
├── claude-ai-memory-system.md                            (48K)
├── claude_works.md                                     (72K)
├── pdf.md                                              (8K)
├── docx.md                                             (12K)
├── pptx.md                                             (20K)
├── xlsx.md                                             (12K)
├── past_chats_tools.md                                  (12K)
├── search_instructions                                   (24K)
├── claude.ai-injections.md                              (4K)
├── end-conversation-tool.md                             (4K)
├── readme.md                                            (8K)
└── old/
    └── claude-3.7-full-system-message-with-all-tools.md  (111K)
```

## 文件分类架构

### 1. 模型版本 System Prompts

#### Claude 3.7 Sonnet 系列

- `claude-3.7-sonnet-full-system-message-humanreadable.md`
- `claude-3.7-sonnet-w-tools.md`
- `claude-3.7-sonnet-w-tools.xml`

**特点**：

- 完整系统消息
- 带工具定义
- 人类可读版本（带中文注释）

#### Claude 4.1 Opus

- `claude-4.1-opus-thinking.md`

**特点**：

- Thinking Mode (interleaved 模式)
- 最大思考长度: 16000 tokens
- 知识截止日期: 2025年1月底

#### Claude 4.5 Sonnet

- `claude-4.5-sonnet.md`
- `claude-4.5-sonnet-learning-style`

**特点**：

- 学习风格定制
- 支持引用和搜索功能
- 记忆系统集成

#### Claude Sonnet 4

- `claude-sonnet-4.md`
- `claude-sonnet-4.txt`
- `claude-opus-4.5`

**特点**：

- 通用模型版本
- TXT 和 Markdown 双格式
- 核心系统提示词

#### 基础系统消息

- `claude.txt`

**特点**：

- 基础 Claude 系统消息
- 通用行为准则
- 工具使用指导

### 2. 功能特定 Prompts

#### Claude Code 系列

**CLI 工具专用 System Prompts**

- `claude-code.js` - JavaScript 格式系统提示词
- `claude-code.md` - Markdown 格式系统提示词 (v0.2.9)
- `claude-code-2025-11-1.md` - 2025年11月版本
- `claude-code-plan-mode.md` - Plan Mode 模式
- `calude_code_cli_tools.md` - CLI 工具技术参考

**核心功能**：

- 软件工程任务辅助
- 文件操作和代码编辑
- Git 集成
- 测试和构建支持
- 安全策略（零容忍）

**Plan Mode 特性**：

- 两阶段执行模型（规划→执行）
- 用户确认机制
- 透明度提升
- 减少返工迭代

#### Claude in Chrome

- `claude-in-chrome.md`

**核心功能**：

- 浏览器自动化
- Screenshot, Click, Type, Scroll 工具
- 多标签页并行处理
- 安全强化（注入攻击防护）
- 隐私保护和版权遵守

#### Claude AI Memory System

- `claude-ai-memory-system.md`

**核心功能**：

- 跨会话记忆
- 个性化响应
- 无缝集成（隐形记忆）
- 定期后台更新
- Incognito 模式禁用

**记忆系统原则**：

- "隐形"记忆：像人类同事自然回忆
- 避免元评论：不说"我记得..."
- 边界意识：不暗示过深的人际关系
- 不完整性：记忆是派生的、动态的

#### Claude Works

- `claude_works.md`

**核心功能**：

- 工作流管理
- 任务执行
- 集成工具使用

### 3. 工具集成文档

#### Office 文档处理

- `pdf.md` - PDF 文档处理
- `docx.md` - Word 文档处理
- `pptx.md` - PowerPoint 文档处理
- `xlsx.md` - Excel 文档处理

**共同特点**：

- 文档解析
- 内容提取
- 格式保持
- 批量处理支持

#### 过去对话工具

- `past_chats_tools.md`

**核心工具**：

- `conversation_search` - 基于话题/关键词搜索
- `recent_chats` - 基于时间检索

**触发模式**：

- 显式引用："继续我们关于..."
- 时间引用："我们昨天讨论了什么"
- 隐式信号：
  - 过去时态动词："你建议了"
  - 限定词："我的项目"
  - 代词无先行词："帮我修复它"

#### 搜索功能

- `search_instructions` - 搜索功能指南

**搜索工具**：

- `web_search` - 网页搜索
- `web_fetch` - 网页抓取
- `google_drive_search` - Google Drive 搜索
- `google_drive_fetch` - Google Drive 抓取

**查询复杂度分类**：

1. **Never Search Category** - 不需要搜索
2. **Do Not Search But Offer Category** - 不搜索但提供选项
3. **Single Search Category** - 单次搜索
4. **Research Category** - 深度研究（多轮搜索）

**版权限制**：

- 单次引用不超过15词（严格限制）
- 必须使用 `<antml:cite>` 标签引用
- 索引格式：`DOC_INDEX-SENTENCE_INDEX`

### 4. 其他文档

#### 学习版文档

多个文档包含**中文注释和学习说明**：

**结构特点**：

- 版本号管理（如 v0.2.9）
- 设计要点说明
- 思考引导（💡 可借鉴）
- 对比示例（✅ 正确 vs ❌ 错误）
- 知识点测验（🧠 小测验）

**示例文件**：

- `claude-code.md` - 带 v0.2.9 版本号
- `claude-3.7-sonnet-full-system-message-humanreadable.md` - 人类可读化版本
- `claude-4.1-opus-thinking.md` - Thinking Mode 说明
- `claude-ai-memory-system.md` - 记忆系统设计

#### 其他功能文档

- `claude.ai-injections.md` - 注入攻击防护
- `end-conversation-tool.md` - 结束对话工具
- `readme.md` - 项目说明和目录索引

## 技术规格

### 文件格式统计

| 类型 | 数量 | 总大小 | 行数 | 词数 |
|------|------|--------|------|------|
| Markdown | 19 | ~1.4MB | ~17,000 | ~127,321 |
| TXT | 3 | ~308KB | ~2,500 | ~20,000 |
| JavaScript | 1 | 16KB | 242 | ~2,500 |
| XML | 1 | 112KB | ~1,000 | ~8,000 |
| **总计** | **28** | **~1.5MB** | **~20,742** | **~157,821** |

### 编码规范

- **字符编码**: UTF-8
- **换行符**: CRLF (Windows 风格)
- **长行限制**: 部分文件包含非常长的行（超过1000字符）
- **注释风格**:
  - HTML 注释: `<!-- -->`
  - XML 标签: `<tag>...</tag>`
  - Markdown 标题: `#`, `##`

### 版本管理

#### 版本号格式

- 语义化版本号（如 v0.2.9）
- 主版本.次版本.修订版本

#### 版本追踪

- 知识截止日期标注
- 模型版本标注（如 `claude-sonnet-4-5-20250929`）
- 发布日期标注

### System Prompt 结构层次

#### 标准层次结构

```
1. <citation_instructions>        # 引用规则
2. <artifacts_info>              # Artifacts 使用说明
3. 工具特定指令                   # 工具集成指南
4. <search_instructions>          # 搜索功能指南
5. <user_preferences>            # 用户偏好
6. <styles_info>                # 写作风格
7. 可用工具定义                  # Tool Definitions
8. 核心系统消息                  # Core System Message
9. 额外提醒                     # Additional Reminders
```

#### Claude Code 结构

```
1. 身份定义                       # "You are Claude Code..."
2. 安全边界 (CRITICAL FIRST)    # 安全策略
3. 语气和风格                     # Tone and Style
4. Proactiveness                # 主动性指导
5. 专业客观性                    # Professional Objectivity
6. 遵循约定                      # Following Conventions
7. 代码风格                      # Code Style
8. 任务管理                      # Task Management
9. 执行任务                      # Doing Tasks
10. 工具使用策略                # Tool Usage Policy
```

## 安全架构

### 零容忍安全策略

#### 恶意代码防御

- **拒绝条件**：
  - 改进、解释或交互恶意代码
  - 即使声称"教育目的"
  - 优化可能用于规避检测的代码

#### 主动安全审查

- **审查触发**：
  - 文件名和目录结构可疑
  - 请求看似无害但上下文可疑
  - "解释代码"可能是逆向工程
  - "优化代码"可能帮助规避检测

#### 安全边界

- **仅限防御性安全任务**：
  - 安全分析
  - 检测规则
  - 漏洞解释
  - 防御工具
  - 安全文档

- **禁止任务**：
  - 凭证发现或收集
  - 批量爬取 SSH keys
  - 浏览器 cookies
  - 加密货币钱包

### 注入攻击防护

- 检测和拒绝注入攻击
- HTML/JavaScript 注入防护
- SQL 注入防护
- 社会工程学防护

## 数据流架构

### Citation 流程

```
搜索请求
    ↓
Web Search / Google Drive Search / Fetch
    ↓
返回结果（带索引）
    ↓
生成回答
    ↓
添加 <antml:cite> 标签
    ↓
索引格式: DOC_INDEX-SENTENCE_INDEX
    ↓
验证引用准确性
    ↓
最终响应
```

### Memory 流程

```
用户查询
    ↓
检查记忆数据库
    ↓
相关性判断
    ↓
应用相关记忆（隐形）
    ↓
生成个性化响应
    ↓
避免元评论（不说"根据记忆"）
    ↓
最终响应
```

### Artifacts 流程

```
用户请求（代码/文档/分析）
    ↓
判断是否需要 Artifact
    ↓
创建 Artifact (类型: code/markdown/html/svg/mermaid/react)
    ↓
生成完整内容
    ↓
引用 Artifact ID
    ↓
用户可查看/编辑/下载
```

## 工具生态系统

### 工具分类

#### 1. 文件操作

- Read - 读取文件
- Write - 写入文件
- Edit - 编辑文件
- Glob - 文件模式匹配

#### 2. 代码操作

- Bash - 命令行执行
- LSP - 语言服务器协议（代码导航、重命名、诊断）
- AST-grep - AST 感知搜索和替换

#### 3. 搜索和检索

- Web Search - 网页搜索
- Web Fetch - 网页抓取
- Grep - 内容搜索
- Conversation Search - 对话搜索
- Recent Chats - 最近对话

#### 4. 任务管理

- Todo Write - 任务列表管理
- Delegate Task - 委派子任务

#### 5. 浏览器自动化

- Screenshot - 截图
- Click - 点击
- Type - 输入
- Scroll - 滚动
- Navigate - 导航

#### 5. Office 文档

- PDF 处理
- DOCX 处理
- PPTX 处理
- XLSX 处理

### 工具权限模型

#### 自动批准工具

- Read（用户目录）
- Bash（sudo:*）
- 其他只读工具

#### 需要用户确认

- Write（修改文件）
- Bash（破坏性操作）
- 委派任务

## 设计原则

### 1. 透明度原则

- 版本号标注
- 知识截止日期声明
- 能力边界明确
- 局限性说明

### 2. 安全优先原则

- 零容忍恶意代码
- 主动安全审查
- 主动式威胁建模
- 防御性安全

### 3. 用户体验原则

- 简洁直接响应
- 无不必要的前言/后言
- 自然对话流程
- 隐形记忆系统

### 4. 可维护性原则

- 版本管理
- 文档结构化
- 模块化设计
- 清晰的层次结构

## 扩展性设计

### 新模型版本

- 遵循现有命名规范
- 保持结构层次
- 添加版本标签
- 更新知识截止日期

### 新工具集成

- 遵循工具定义格式
- 添加工具特定指令
- 更新搜索策略
- 更新引用规则

### 新功能模块

- 独立的 Markdown 文件
- 清晰的功能边界
- 集成到核心 System Prompt
- 保持向后兼容

## 文档生成建议

### 架构图

```mermaid
graph TB
    subgraph "用户层"
        User[用户请求]
    end

    subgraph "System Prompt 层"
        Core[核心 System Message]
        Tools[工具定义]
        Policies[安全策略]
    end

    subgraph "功能模块层"
        Memory[记忆系统]
        Search[搜索功能]
        Artifacts[Artifact 系统]
    end

    subgraph "工具层"
        FileOps[文件操作]
        CodeOps[代码操作]
        WebOps[网络操作]
        Browser[浏览器自动化]
    end

    User --> Core
    Core --> Tools
    Core --> Policies
    Core --> Memory
    Core --> Search
    Core --> Artifacts
    Tools --> FileOps
    Tools --> CodeOps
    Search --> WebOps
    Tools --> Browser
```

### 数据流图

```mermaid
sequenceDiagram
    participant U as 用户
    participant S as System Prompt
    participant M as Memory
    participant T as Tools
    participant R as Response

    U->>S: 发送请求
    S->>M: 检查记忆
    M-->>S: 返回相关记忆
    S->>S: 应用策略和安全检查
    S->>T: 调用必要工具
    T-->>S: 返回工具结果
    S->>S: 生成响应（带引用）
    S->>U: 返回最终响应
```

## 总结

本 System Prompts 库提供了 Anthropic Claude 模型的完整系统提示词集合，包含：

- **多模型版本**: Claude 3.7, 4.1, 4.5 等多个版本
- **功能专用**: Claude Code, Claude in Chrome 等专用版本
- **工具集成**: 办公文档、搜索、记忆等工具
- **学习版文档**: 带中文注释和学习指导
- **安全架构**: 零容忍安全策略和主动防御
- **扩展性**: 清晰的架构支持新功能集成

文档遵循明确的组织原则、编码规范和安全策略，为理解和定制 Anthropic Claude 模型提供了完整参考。
