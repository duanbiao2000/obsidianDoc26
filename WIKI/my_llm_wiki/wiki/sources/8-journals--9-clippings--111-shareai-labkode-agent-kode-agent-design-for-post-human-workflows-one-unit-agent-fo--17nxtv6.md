---
type: source
title: "shareAI-lab/Kode-Agent: Kode Agent — Design for post-human workflows"
created: 2026-06-21
updated: 2026-06-21
tags: [ai, coding-agent, open-source, multi-model, terminal-tool]
related: [kode-agent, claude-code, multi-model-collaboration, subagent-mechanism, model-pointers, yolo-mode, shareai-lab]
sources: ["Journals/Clippings/shareAI-labKode-Agent Kode Agent — Design for post-human workflows. One unit agent for every human & computer task.md"]
authors: [shareAI-lab]
year: 2025
url: "https://github.com/shareAI-lab/Kode-Agent"
venue: GitHub
---
# shareAI-lab/Kode-Agent: Kode Agent — Design for post-human workflows

Kode Agent 是一個開源的終端 AI 助手，由 [[shareAI-lab]] 開發，定位為一個「AI 開發工作台」。其核心差異化優勢在於支援**多模型協同**與 **SubAgent 並行處理**，與僅支援單一模型的 [[Claude Code]] 形成直接競爭。

## 主要功能

- **多模型協同**：透過 `ModelManager` 系統，支援在同一工作階段中動態切換和組合使用多個 AI 模型（如 o3、GPT-5、Gemini、Qwen Coder、Kimi k2、GLM-4.5、Claude Sonnet 4、Claude Opus 4.1、Grok 4 等）。
- **SubAgent 機制**：透過 `TaskTool` 啟動多個子代理並行處理任務，提升效率。
- **模型指針 (Model Pointers)**：允許使用者為不同用途（主代理、任務代理、推理、快速任務）設定不同的預設模型。
- **AskExpertModel 工具**：在對話中臨時調用專家模型解決疑難問題。
- **YOLO 模式**：預設跳過所有權限檢查以最大化生產力，但文件建議在處理重要檔案時使用 `--safe` 模式。
- **成本追蹤**：透過 `/cost` 命令查看各模型的 token 使用量和花費。
- **Apache 2.0 開源協議**：從 AGPLv3 升級，允許在商業產品中自由使用。

## 安裝與使用

透過 npm 全局安裝：`npm install -g @shareai-lab/kode`。支援交互模式 (`kode`) 和非交互模式 (`kode -p "..."`)。也支援 Docker 運行。

## 與 Claude Code 的比較

| 特性 | Kode | 官方 CC |
|------|------|---------|
| 支援模型數量 | 無限制，可配置任意模型 | 僅支援單一 Claude 模型 |
| 模型切換 | Tab 鍵快速切換 | 需要重啟會話 |
| 並行處理 | 多個 SubAgent 並行工作 | 單執行緒處理 |
| 成本追蹤 | 多模型成本分別統計 | 單一模型成本 |
| 任務模型配置 | 不同用途配置不同預設模型 | 所有任務用同一模型 |
| 專家諮詢 | AskExpertModel 工具 | 不支援 |

## 關鍵概念

- [[多模型協同 (Multi-Model Collaboration)]]
- [[SubAgent 機制]]
- [[模型指針 (Model Pointers)]]
- [[YOLO 模式]]
