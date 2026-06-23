---
type: entity
title: PythonOperator
tags: [Airflow, 資料工程, 自動化, Python]
related: [airflow, dag-有向無環圖, etl-管道]
created: 2026-06-21
updated: 2026-06-21
sources: ["Journals/数据工程中pipeline.md"]
---
# PythonOperator

**PythonOperator** 是 [[Airflow]] 中一個核心的運算子 (Operator)，用於在 [[DAG (有向無環圖)]] 中執行任意的 Python 可呼叫物件（函數或方法）。它允許資料工程師將自定義的 Python 程式碼作為 Airflow 工作流中的一個任務來運行，從而實現高度的靈活性和自定義功能。

## 在資料管道中的作用

在[[etl-管道]]的實現中，PythonOperator 扮演著至關重要的角色，尤其是在 **Transform (轉換)** 階段：
*   **執行自定義邏輯**：當資料轉換或處理邏輯無法完全由現有的 Airflow 運算子（如 BashOperator, SqlOperator）覆蓋時，PythonOperator 允許資料工程師編寫任何複雜的 Python 程式碼來完成任務。這包括：
    *   使用 [[pandas]] 進行資料清洗、聚合和特徵工程。
    *   呼叫外部 API 獲取資料。
    *   執行機器學習模型的預處理或推斷。
    *   與其他 Python 函式庫（如 NumPy, Scikit-learn）整合。
*   **整合現有 Python 腳本**：許多資料處理任務已經有現成的 Python 腳本，PythonOperator 可以輕鬆地將這些腳本整合到 Airflow 工作流中，實現自動化排程。

透過 PythonOperator，[[Airflow]] 能夠成為一個極其靈活的資料管道協調工具，將各種 Python 驅動的資料處理任務無縫地整合到自動化工作流中。