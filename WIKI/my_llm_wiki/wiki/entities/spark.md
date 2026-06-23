---
type: entity
title: Spark
tags: [資料工程, 分散式處理, ETL, 大數據]
related: [etl-管道, kafka, dbt]
created: 2026-06-21
updated: 2026-06-21
sources: ["Journals/数据工程中pipeline.md"]
---
# Spark

**Spark** 是一個強大且廣泛使用的開源分散式運算系統，專為處理大規模資料集而設計。它提供了高效能的記憶體內運算能力，支援多種程式語言（如 Scala, Python, Java, R），並包含多個模組，如 Spark SQL、Spark Streaming、MLlib (機器學習庫) 和 GraphX (圖形處理)。

## 在資料管道中的作用

在[[etl-管道]]中，Spark 扮演著處理海量資料的關鍵角色，尤其是在 **Extract (抽取)** 和 **Transform (轉換)** 階段：
*   **大規模 ETL**：Spark 能夠高效地從各種資料源（如 HDFS, S3, Kafka, 資料庫）抽取大量原始資料，並進行複雜的轉換操作，包括資料清洗、聚合、聯結和特徵工程。
*   **批次處理與流式處理**：Spark 支援批次處理（透過 Spark Core 和 Spark SQL）和流式處理（透過 Spark Streaming 或 Structured Streaming），使其能夠處理靜態資料集和即時資料流。
*   **整合機器學習**：Spark 的 MLlib 庫允許在資料管道中直接整合機器學習模型，實現資料的預測和分析。

Spark 的高效能和靈活性使其成為處理大數據 ETL 任務的首選工具，尤其適用於需要處理 PB 級資料和複雜運算邏輯的場景。