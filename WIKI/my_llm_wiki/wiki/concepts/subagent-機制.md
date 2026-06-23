---
type: concept
title: SubAgent 機制
created: 2026-06-21
updated: 2026-06-21
tags: [ai, architecture, parallel-processing, coding-agent]
related: [kode-agent, multi-model-collaboration, task-tool]
sources: ["Journals/Clippings/shareAI-labKode-Agent Kode Agent — Design for post-human workflows. One unit agent for every human & computer task.md"]
---
# SubAgent 機制

SubAgent 機制是 [[Kode Agent]] 中透過 `TaskTool` (Architect 工具) 實現的一種並行處理架構。它允許主代理啟動多個子代理 (SubAgent) 並行處理任務，從而顯著提升工作效率。

## 工作原理

- 主代理可以透過 `TaskTool` 創建多個 SubAgent
- 每個 SubAgent 可以獨立執行任務，互不干擾
- SubAgent 預設使用 `task` 模型指針配置的模型
- 使用者可以在請求中指定 SubAgent 使用的特定模型

## 與多模型協同的關係

SubAgent 機制是 [[多模型協同 (Multi-Model Collaboration)]] 的關鍵實現組件。透過 SubAgent，使用者可以讓不同模型同時處理不同的子任務，實現真正的並行處理。

## 應用場景

- 同時重構多個模組
- 並行處理多個編碼任務
- 同時進行程式碼審查和測試
