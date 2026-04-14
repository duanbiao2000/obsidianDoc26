---
title:
date:
tags:
aliases:
cssclasses:
status: in-progress
rating:
completed: false
due:
source:
---
**Claude Code完全支持调用OpenRouter**，OpenRouter官方提供了「Anthropic Skin」原生兼容方案，无需额外代理即可无缝集成，让你在Claude Code中访问320+ AI模型（包括Claude、GPT、Gemini、DeepSeek等）。

---

### 一、核心兼容性与原理
- **原生兼容**：OpenRouter实现了Anthropic API的完整"皮肤"（Skin），可直接接收Claude Code的原生Anthropic协议请求，无需本地代理转换
- **协议自动转换**：OpenRouter负责将Claude Code的Anthropic格式请求转为目标模型格式，并将响应转回Anthropic格式，保持Claude Code所有功能（如Thinking blocks、工具调用）正常工作
- **模型自由切换**：通过环境变量或`CLAUDE.md`配置，可在Claude Code中随时切换OpenRouter支持的任意模型，平衡成本与性能

---

### 二、配置步骤（官方推荐）
#### 1. 环境变量配置（最简便）
```bash
# 设置OpenRouter API端点（核心配置）
export ANTHROPIC_BASE_URL="https://openrouter.ai/api"

# 提供OpenRouter API密钥（在openrouter.ai获取）
export ANTHROPIC_AUTH_TOKEN="sk-or-your-api-key"

# 重要：清空Anthropic API密钥以避免冲突
export ANTHROPIC_API_KEY=""
```

#### 2. `CLAUDE.md`声明式配置（项目级持久化）
```markdown
---
# YAML前置元数据（Claude专属）
model_config:
  default: openrouter/anthropic/claude-3-5-sonnet:beta
  tasks:
    code_completion: openrouter/deepseek-ai/deepseek-coder:base
    code_review: openrouter/openai/gpt-4-turbo
    code_debug: openrouter/anthropic/claude-3-opus:beta
  fallback: true
---
```

#### 3. 验证连接
启动Claude Code后，使用`/model`命令查看当前模型，确认已成功连接OpenRouter：
```bash
claude
# 在Claude Code界面输入
/model
```

---

### 三、支持的模型与优势
| 优势        | 说明                                               |
| --------- | ------------------------------------------------ |
| **模型多样性** | 访问320+模型，包括Claude变体、GPT系列、Gemini、DeepSeek、Llama等 |
| **成本优化**  | 可选择更经济的模型（如Haiku、DeepSeek Coder）执行轻量任务，降低95%成本   |
| **高可用性**  | OpenRouter自动路由到可用模型，避免单一供应商中断影响开发                |
| **团队协作**  | 支持组织级预算控制和访问权限管理，适合团队共享配置                        |

---

### 四、高级用法
#### 1. 任务-模型精准映射
通过`CLAUDE.md`为不同编码任务配置最优模型：
```markdown
## Task-Specific Model Rules
- **code_completion**: 使用openrouter/deepseek-ai/deepseek-coder:base（优先速度）
- **code_review**: 使用openrouter/openai/gpt-4-turbo（优先准确性）
- **code_debug**: 使用openrouter/anthropic/claude-3-opus:beta（复杂问题诊断）
```

#### 2. 模型别名配置
在OpenRouter仪表板为常用模型设置别名，简化Claude Code中的调用：
```bash
# 使用别名调用模型
/model set openrouter/alias/my-team-model
```

---

### 五、注意事项
1. **API密钥安全**：OpenRouter密钥拥有所有模型访问权限，避免提交到版本控制系统
2. **模型格式差异**：部分模型可能不支持Claude Code的全部高级功能（如超长上下文），建议测试后使用
3. **计费方式**：通过OpenRouter使用Claude模型仍需Anthropic授权，费用由OpenRouter统一结算
4. **Anthropic Agent SDK兼容**：Anthropic Agent SDK基于Claude Code运行时，可通过相同环境变量连接OpenRouter

---

### 总结
Claude Code与OpenRouter的集成是官方支持的原生能力，通过简单的环境变量或`CLAUDE.md`配置即可实现。这种组合让你在享受Claude Code强大编程能力的同时，获得模型选择自由和成本优化空间，特别适合追求灵活性的开发者和团队。

需要我提供一份可直接复制的“开发环境一键配置脚本”（包含环境变量设置、模型别名映射和常见问题排查）吗？

