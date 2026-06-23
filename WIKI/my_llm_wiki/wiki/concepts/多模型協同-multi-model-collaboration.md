---
type: concept
title: 多模型協同 (Multi-Model Collaboration)
created: 2026-06-21
updated: 2026-06-21
tags: [ai, architecture, multi-model, coding-agent]
related: [kode-agent, subagent-mechanism, model-pointers, claude-code]
sources: ["Journals/Clippings/shareAI-labKode-Agent Kode Agent — Design for post-human workflows. One unit agent for every human & computer task.md"]
---
# 多模型協同 (Multi-Model Collaboration)

多模型協同是 [[Kode Agent]] 的核心架構理念，允許在同一工作階段中動態切換和組合使用多個 AI 模型，將不同任務分配給最適合的模型。這是 Kode 與 [[Claude Code]] 等單一模型工具的核心差異化優勢。

## 實現機制

- **ModelManager 多模型管理器**：統一管理多個模型配置，支援模型指針 (Model Pointers) 設定不同用途的預設模型。
- **TaskTool 智能任務分發工具**：透過 SubAgent 機制啟動多個子代理並行處理任務，並可指定每個子代理使用的模型。
- **AskExpertModel 專家諮詢工具**：在對話中臨時調用特定的專家模型解決疑難問題。

## 工作分配策略

根據文件建議，不同任務階段適合使用不同模型：

- **架構設計階段**：o3 或 GPT-5（抽象思維和系統設計表現卓越）
- **方案細化階段**：Gemini（實際工程實踐積累深厚）
- **程式碼實現階段**：Qwen Coder、Kimi k2、GLM-4.5 或 Claude Sonnet 4（程式碼生成和工程實現性能強勁）
- **疑難問題解決**：o3、Claude Opus 4.1 或 Grok 4（深度技術見解和創新解決方案）

## 優勢

1. **效率最大化**：每個任務都由最適合的模型處理
2. **成本優化**：簡單任務用輕量模型，複雜任務用強大模型
3. **並行處理**：多個模型可以同時處理不同的子任務
4. **靈活切換**：根據任務需求隨時切換模型，無需重啟會話
5. **取長補短**：結合不同模型的優勢，獲得最佳整體效果
