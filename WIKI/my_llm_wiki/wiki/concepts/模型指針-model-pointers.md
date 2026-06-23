---
type: concept
title: 模型指針 (Model Pointers)
created: 2026-06-21
updated: 2026-06-21
tags: [ai, configuration, model-management]
related: [kode-agent, multi-model-collaboration]
sources: ["Journals/Clippings/shareAI-labKode-Agent Kode Agent — Design for post-human workflows. One unit agent for every human & computer task.md"]
---
# 模型指針 (Model Pointers)

模型指針是 [[Kode Agent]] 中 `ModelManager` 系統的一部分，允許使用者為不同用途設定不同的預設模型。這是一種靈活的模型分配策略，是 [[多模型協同 (Multi-Model Collaboration)]] 的關鍵配置機制。

## 指針類型

- **`main`**：主 Agent 的預設模型
- **`task`**：SubAgent 的預設模型
- **`reasoning`**：預留給未來 ThinkTool 使用
- **`quick`**：用於簡單 NLP 任務（如安全性識別、生成標題描述等）的快速模型

## 配置範例

```json
{
  "modelPointers": {
    "main": "claude4",
    "task": "qwen",
    "reasoning": "o3",
    "quick": "glm-4.5"
  }
}
```
