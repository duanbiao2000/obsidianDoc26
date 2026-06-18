# Anthropic System Prompts - 完整文档

> Anthropic Claude 模型 System Prompts 的完整集合和参考文档

[![Version](https://img.shields.io/badge/version-0.2.9-blue)](https://github.com/anthropics/anthropic)
[![License](https://img.shields.io/badge/license-Proprietary-red)](https://www.anthropic.com/legal/commercial-terms)
[![Documentation](https://img.shields.io/badge/docs-complete-green)](#)

## 概述

本仓库包含 Anthropic Claude 模型的 System Prompts（系统提示词）集合，包括多个模型版本、功能专用版本和完整的 API 参考。

### 特性

- ✅ **多模型版本** - Claude 3.7, 4.1, 4.5 等多个版本
- ✅ **功能专用** - Claude Code, Claude in Chrome 等专用版本
- ✅ **完整 API 参考** - 工具定义、功能模块、安全策略
- ✅ **学习版文档** - 带中文注释和学习指导
- ✅ **架构文档** - 系统设计、数据流、扩展性
- ✅ **版本管理** - 语义化版本号和知识截止日期

### 统计

| 指标 | 数值 |
|------|------|
| 总文件数 | 28 |
| 总大小 | ~1.5MB |
| 总行数 | ~20,742 |
| 总词数 | ~157,821 |
| 模型版本 | 5+ |
| 工具类型 | 15+ |

## 目录结构

```
Anthropic/
├── 模型版本 System Prompts/
│   ├── Claude 3.7 Sonnet/
│   ├── Claude 4.1 Opus Thinking/
│   ├── Claude 4.5 Sonnet/
│   └── Claude Sonnet 4/
├── 功能专用 Prompts/
│   ├── Claude Code/
│   ├── Claude in Chrome/
│   ├── AI Memory System/
│   └── Claude Works/
├── 工具集成文档/
│   ├── Office 文档/
│   ├── Past Chats Tools/
│   └── Search Instructions/
├── 学习版文档/
│   ├── 中文注释版
│   └── 设计要点版
├── 文档/
│   ├── ARCHITECTURE.md
│   ├── API_REFERENCE.md
│   └── README.md (本文件)
└── old/
    └── 历史版本
```

## 快速开始

### 查看 System Prompts

#### Claude 3.7 Sonnet

```bash
# Markdown 版本
cat claude-3.7-sonnet-w-tools.md

# XML 版本
cat claude-3.7-sonnet-w-tools.xml

# 人类可读版（带中文注释）
cat claude-3.7-sonnet-full-system-message-humanreadable.md
```

#### Claude Code

```bash
# CLI 版本
cat claude-code.js

# Markdown 版本（带中文注释）
cat claude-code.md

# Plan Mode
cat claude-code-plan-mode.md
```

#### Claude 4.5 Sonnet

```bash
# 完整版本
cat claude-4.5-sonnet.md

# 学习风格版
cat claude-4.5-sonnet-learning-style
```

### 查看文档

```bash
# 架构文档
cat ARCHITECTURE.md

# API 参考
cat API_REFERENCE.md

# 项目说明
cat readme.md
```

## 文档指南

### 1. 架构文档 ([ARCHITECTURE.md](Resources/Research/system_prompts_leaks/Anthropic/ARCHITECTURE.md))

包含系统的整体架构设计：

- 目录结构和文件分类
- System Prompt 层次结构
- 安全架构
- 数据流（Citation, Memory, Artifacts）
- 工具生态系统
- 设计原则
- 扩展性设计

**适用人群**：架构师、开发者、研究人员

### 2. API 参考 ([API_REFERENCE.md](API_REFERENCE.md))

完整的 API 和工具参考：

- 核心 System Prompt API
- 工具定义 API（文件操作、代码操作、搜索等）
- 功能模块 API（Citation, Artifacts, Memory, Search）
- 工具集成 API（Office 文档、浏览器自动化）
- 安全 API

**适用人群**：开发者、集成者、工具开发者

### 3. 学习版文档

多个文件包含中文注释和学习指导：

- **claude-code.md** - v0.2.9 版本，带学习注释
- **claude-3.7-sonnet-full-system-message-humanreadable.md** - 人类可读化版本
- **claude-4.1-opus-thinking.md** - Thinking Mode 说明
- **claude-ai-memory-system.md** - 记忆系统设计

**特点**：

- 📋 版本信息和说明
- 💡 可借鉴的设计要点
- 📚 知识点测验（🧠 小测验）
- ✅ 正确 vs ❌ 错误示例
- 📝 思考引导

**适用人群**：学习者、研究人员、提示词工程师

## 模型版本

### Claude 3.7 Sonnet

**文件**:

- `claude-3.7-sonnet-full-system-message-humanreadable.md`
- `claude-3.7-sonnet-w-tools.md`
- `claude-3.7-sonnet-w-tools.xml`

**特性**:

- 完整系统消息
- 带工具定义
- 人类可读版本
- Citation 和 Artifacts 支持

**技术规格**:

- Model ID: `claude-3-sonnet-4-20240229`
- Knowledge Cutoff: 2024年4月
- Max Tokens: 200,000

### Claude 4.1 Opus Thinking

**文件**:

- `claude-4.1-opus-thinking.md`

**特性**:

- Thinking Mode (interleaved 模式)
- 最大思考长度: 16000 tokens
- 过去对话搜索支持
- Citation 和 Artifacts 支持

**技术规格**:

- Model ID: `claude-opus-4-1-20250120`
- Knowledge Cutoff: 2025年1月底
- Max Thinking Tokens: 16,000

### Claude 4.5 Sonnet

**文件**:

- `claude-4.5-sonnet.md`
- `claude-4.5-sonnet-learning-style`

**特性**:

- 学习风格定制
- 支持引用和搜索功能
- 记忆系统集成
- Citation 和 Artifacts 支持

**技术规格**:

- Model ID: `claude-sonnet-4-5-20250929`
- Knowledge Cutoff: 2025年1月
- Max Tokens: 200,000

### Claude Sonnet 4

**文件**:

- `claude-sonnet-4.md`
- `claude-sonnet-4.txt`
- `claude-opus-4.5`

**特性**:

- 通用模型版本
- TXT 和 Markdown 双格式
- 核心系统提示词

### Claude Code

**文件**:

- `claude-code.js` - JavaScript 格式
- `claude-code.md` - Markdown 格式 (v0.2.9)
- `claude-code-2025-11-1.md` - 2025年11月版本
- `claude-code-plan-mode.md` - Plan Mode
- `calude_code_cli_tools.md` - CLI 工具技术参考

**特性**:

- 软件工程任务辅助
- 文件操作和代码编辑
- Git 集成
- 测试和构建支持
- Plan Mode（两阶段执行）

**Plan Mode**:

- 规划先行，执行后行
- 用户确认机制
- 透明度提升
- 减少返工迭代

## 功能模块

### Memory System

**文件**: `claude-ai-memory-system.md`

**核心功能**:

- 跨会话记忆
- 个性化响应
- 无缝集成（隐形记忆）
- 定期后台更新
- Incognito 模式禁用

**使用场景**:

- 记住用户偏好
- 保持对话连续性
- 提供个性化建议

**注意事项**:

- 记忆不完整、有延迟
- 删除对话会移除相关记忆
- 避免元评论（不说"根据记忆"）

### Search Instructions

**文件**: `search_instructions`

**搜索工具**:

- `web_search` - 网页搜索
- `web_fetch` - 网页抓取
- `google_drive_search` - Google Drive 搜索
- `google_drive_fetch` - Google Drive 抓取

**查询复杂度**:

1. **Never Search** - 不需要搜索
2. **Do Not Search But Offer** - 不搜索但提供选项
3. **Single Search** - 单次搜索
4. **Research** - 深度研究（多轮）

**版权限制**:

- 单次引用不超过15词（严格限制）
- 必须使用 `<antml:cite>` 标签
- 声明必须用自己的话

### Past Chats Tools

**文件**: `past_chats_tools.md`

**工具**:

- `conversation_search` - 基于话题/关键词搜索
- `recent_chats` - 基于时间检索

**触发模式**:

- 显式引用："继续我们关于..."
- 时间引用："我们昨天讨论了什么"
- 隐式信号：
  - 过去时态动词："你建议了"
  - 限定词："我的项目"
  - 代词无先行词："帮我修复它"

### Artifacts

**类型**:

- Code (`application/vnd.ant.code`)
- Documents (`text/markdown`)
- HTML (`text/html`)
- SVG (`image/svg+xml`)
- Mermaid (`application/vnd.ant.mermaid`)
- React (`application/vnd.ant.react`)

**使用规则**:

- **必须使用**: 原创写作、深度分析、自定义代码、对话外使用的内容
- **不应使用**: 短片段、快速修复、仅对话内使用的内容

## 工具集成

### Office 文档处理

**文件**:

- `pdf.md` - PDF 处理
- `docx.md` - Word 处理
- `pptx.md` - PowerPoint 处理
- `xlsx.md` - Excel 处理

**工具**: `look_at` (多媒体分析)

**能力**:

- 文档解析
- 内容提取
- 格式保持
- 批量处理

**推荐库**:

- **Papaparse** - CSV 解析
- **Lodash** - 计算
- **SheetJS** - Excel 处理

### Claude in Chrome

**文件**: `claude-in-chrome.md`

**工具**:

- Screenshot - 截图
- Click - 点击
- Type - 输入
- Scroll - 滚动
- Navigate - 导航

**特性**:

- 多标签页并行处理
- 安全强化（注入攻击防护）
- 隐私保护
- 版权遵守

## 安全策略

### 零容忍安全策略

**拒绝条件**:

- 改进、解释或交互恶意代码
- 即使声称"教育目的"
- 优化可能用于规避检测的代码

**主动安全审查**:

- 基于文件名和目录结构
- 识别可疑上下文
- "解释代码"可能是逆向工程

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

## 使用示例

### 基础使用

#### 查看 System Prompt

```bash
# 查看 Claude 3.7 Sonnet System Prompt
cat claude-3.7-sonnet-w-tools.md | head -100

# 查看 Claude Code System Prompt
cat claude-code.md | head -100
```

#### 查看特定功能

```bash
# 查看 Memory System
cat claude-ai-memory-system.md

# 查看 Search Instructions
cat search_instructions

# 查看 Past Chats Tools
cat past_chats_tools.md
```

### 学习版文档使用

#### 查看设计要点

学习版文档包含大量设计要点和学习指导：

```bash
# 查看带中文注释的版本
cat claude-code.md

# 查看人类可读化版本
cat claude-3.7-sonnet-full-system-message-humanreadable.md
```

**学习技巧**:

- 💡 关注"可借鉴"部分
- 📝 理解"思考"引导
- 🧠 尝试"小测验"
- ✅ 对比正确和错误示例

### 集成到项目

#### 使用 System Prompts 作为参考

```python
import anthropic

client = anthropic.Anthropic()

# 创建消息（包含 system prompt）
response = client.messages.create(
    model="claude-3-5-sonnet-20241022",
    max_tokens=1024,
    system="You are a helpful assistant.",  # 使用 claude-3.7-sonnet-w-tools.md 中的 system prompt
    messages=[
        {"role": "user", "content": "Hello!"}
    ]
)
```

#### 自定义 System Prompt

基于提供的 System Prompts 创建自定义版本：

```python
# 从 claude-code.md 中提取相关部分
custom_system_prompt = """
You are a specialized coding assistant.

Tone and style:
- Concise and direct
- No unnecessary preamble

Task Management:
- Use todo list frequently
- Mark tasks as completed immediately

# Add your custom instructions here
"""
```

## 贡献指南

### 报告问题

如果发现 System Prompts 中的问题或错误，请通过以下方式报告：

- GitHub Issues: <https://github.com/anthropics/claude-code/issues>
- Email: <support@anthropic.com>

### 提交改进

欢迎提交改进建议和文档补充：

1. Fork 本仓库
2. 创建特性分支（`git checkout -b feature/amazing-feature`）
3. 提交更改（`git commit -m 'Add amazing feature'`）
4. 推送到分支（`git push origin feature/amazing-feature`）
5. 开启 Pull Request

### 文档规范

- 使用 Markdown 格式
- 保持术语一致性
- 添加适当的代码示例
- 包含使用场景
- 说明注意事项和限制

## 常见问题

### Q: System Prompts 可以直接用于生产吗？

A: 这些 System Prompts 是参考文档，展示了 Anthropic Claude 模型的行为准则和功能。如果需要定制化的 System Prompt，建议基于这些文档进行修改和适配。

### Q: 如何选择合适的模型版本？

A: 根据需求选择：

- **Claude 3.7 Sonnet**: 平衡性能和成本，适合大多数场景
- **Claude 4.1 Opus Thinking**: 需要深度推理和思维链的任务
- **Claude 4.5 Sonnet**: 最新版本，支持学习风格和记忆系统
- **Claude Code**: CLI 工具，软件开发任务

### Q: 学习版文档和普通版有什么区别？

A: 学习版文档包含：

- 中文注释和说明
- 设计要点和思考引导
- 对比示例（正确 vs 错误）
- 知识点测验

适合学习 System Prompt 设计和提示词工程。

### Q: 如何使用 Memory System？

A: Memory System 自动从过去对话中提取用户信息，并在新对话中应用。注意事项：

- 记忆是"隐形的"，不要显式引用
- 记忆不完整，有延迟
- 删除对话会移除相关记忆
- Incognito 模式禁用记忆

### Q: Citation 规则是什么？

A: 如果响应基于搜索工具返回的内容，必须：

1. 使用 `<antml:cite>` 标签引用
2. 每个具体声明都要引用
3. 索引格式：`DOC_INDEX-SENTENCE_INDEX`
4. 声明必须用自己的话，不要精确引用原文
5. 单次引用不超过15词（严格限制）

### Q: Plan Mode 是什么？

A: Plan Mode 是 Claude Code 的特殊模式，要求先规划后执行：

- 用户指示不执行（"I indicated that they do not want you to execute yet"）
- 不能做任何编辑或非只读工具调用
- 应该提供计划而非执行
- 等待用户确认后再执行

### Q: 如何使用 Artifacts？

A: Artifacts 用于：

- **必须使用**：
  - 原创创意写作
  - 深度长篇分析
  - 自定义代码解决问题
  - 对话外使用的内容（报告、邮件、演示文稿）

- **不应使用**：
  - 短片段代码
  - 快速修复或简单示例
  - 仅在对话内使用的内容

## 版本历史

### v0.2.9 (Current)

- Claude Code CLI System Prompt
- 完整的工具定义
- Plan Mode 支持
- 安全策略完善

### v0.2.8

- Claude 4.5 Sonnet 支持
- 学习风格定制
- 记忆系统集成

### v0.2.7

- Claude 4.1 Opus Thinking 支持
- Thinking Mode (interleaved)
- 最大思考长度: 16000 tokens

### v0.2.6

- Claude 3.7 Sonnet 支持
- 完整系统消息
- 工具定义集成

## 许可证

(c) Anthropic PBC. All rights reserved.

Use is subject to Anthropic's Commercial Terms of Service:
<https://www.anthropic.com/legal/commercial-terms>

## 免责声明

Claude Code is a Beta product per Anthropic's Commercial Terms of Service.

By using Claude Code, you agree that all code acceptance or rejection decisions you make, and the associated conversations in context, constitute Feedback under Anthropic's Commercial Terms, and may be used to improve Anthropic's products, including training models.

You are responsible for reviewing any code suggestions before use.

## 联系方式

- **Support**: <https://github.com/anthropics/claude-code/issues>
- **Email**: <support@anthropic.com>
- **Website**: <https://www.anthropic.com>
- **Documentation**: <https://docs.anthropic.com>

## 相关资源

- [Anthropic System Prompts Documentation](https://docs.anthropic.com/en/release-notes/system-prompts)
- [Claude API Documentation](https://docs.anthropic.com/en/api/getting-started-with-the-api)
- [Claude Code Documentation](https://docs.claude.com/en/docs/claude-code)
- [Prompt Engineering Guide](https://docs.anthropic.com/en/docs/prompt-engineering)

## 致谢

感谢 Anthropic 团队提供这些 System Prompts 文档，帮助我们理解和定制 Claude 模型的行为。

---

**文档版本**: 1.0.0
**最后更新**: 2026-02-05
**维护者**: Anthropic PBC
