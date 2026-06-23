---
type: entity
title: FastAPI
created: 2026-06-21
updated: 2026-06-21
tags: [API框架, 模型部署, MLOps, Python]
related: [ML工程師, 模型生產化部署, 端到端資料專案工作流]
sources: ["Journals/数据团队端到端的业务场景.md"]
---
# FastAPI

[[FastAPI]] 是一個現代、快速 (高效能) 的 Python Web 框架，用於構建 API。它基於標準的 Python 型別提示，並與 Starlette (用於 Web 部分) 和 Pydantic (用於資料部分) 緊密結合。

## 應用場景
在「[[數據團隊端到端的業務場景：電商平台使用者流失預警系統]]」中，FastAPI 是 [[ML工程師]] 部署模型 API 的核心工具：
*   **模型 API 服務**：用於將訓練好的使用者流失預測模型包裝成 API 服務，提供即時預測功能。
*   **即時預測**：允許 [[CRM 系統]] 等下游應用程式透過 API 呼叫模型，獲取即時的使用者流失預測結果。

## 優勢
*   **極致效能**：與 Node.js 和 Go 相當，是 Python 框架中最快的之一。
*   **易於使用**：基於標準 Python 型別提示，自動生成互動式 API 文件 (Swagger UI 和 ReDoc)。
*   **快速開發**：減少了開發時間，並提供了強大的資料驗證功能。
*   **非同步支援**：原生支援 `async/await`，適合構建高效能的非同步應用。