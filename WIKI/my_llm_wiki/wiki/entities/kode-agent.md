---
type: entity
title: Kode Agent
created: 2026-06-21
updated: 2026-06-21
tags: [ai, coding-agent, open-source, terminal-tool]
related: [shareai-lab, claude-code, multi-model-collaboration, subagent-mechanism, model-pointers, yolo-mode]
sources: ["Journals/Clippings/shareAI-labKode-Agent Kode Agent — Design for post-human workflows. One unit agent for every human & computer task.md"]
---
# Kode Agent

Kode Agent (簡稱 Kode) 是一個開源的終端 AI 助手，由 [[shareAI-lab]] 開發。它能夠理解程式碼庫、編輯檔案、執行命令並自動化開發工作流程。Kode 的核心定位是「AI 開發工作台」，與 [[Claude Code]] 形成直接競爭。

## 核心架構

Kode 的核心差異化優勢在於其**多模型協同**架構，透過 `ModelManager` 系統實現：

- **模型配置檔案 (Model Profiles)**：每個模型有獨立的配置，包含 API 端點、認證資訊、上下文視窗大小、成本等參數。
- **模型指針 (Model Pointers)**：使用者可為不同用途設定預設模型（`main`、`task`、`reasoning`、`quick`）。
- **動態模型切換**：支援執行時切換模型，無需重啟會話。

## SubAgent 機制

透過 `TaskTool` (Architect 工具) 實現 SubAgent 機制，允許主代理啟動多個子代理並行處理任務。SubAgent 預設使用 `task` 指針配置的模型，但使用者可在請求中指定特定模型。

## 安裝方式

```bash
npm install -g @shareai-lab/kode
```

支援的命令：`kode`、`kwa` (Kode With Agent)、`kd` (超短別名)。也支援 Docker 運行。

## 安全模式

Kode 預設以 **YOLO 模式** 運行，跳過所有權限檢查。建議在處理重要檔案時使用 `kode --safe` 啟用權限檢查。

## 開源協議

Apache 2.0 協議（從 AGPLv3 升級），允許在商業產品中自由使用。
