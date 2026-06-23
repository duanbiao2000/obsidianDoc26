---
type: concept
title: Pregel 模型
tags: [graph-processing, distributed-systems, batch-processing]
related: [batch-processing, batch-synchronous-parallel, apache-giraph, spark-graphx, flink-gelly]
created: 2026-06-21
updated: 2026-06-21
sources: ["Journals/Clippings/第十一章：批处理.md"]
---

# Pregel 模型

Pregel 模型是 Google 提出的图计算模型，基于批同步并行（BSP）模型。它将图计算过程分为一系列超步（superstep），每个超步中每个顶点执行用户定义的函数，并通过消息传递与其他顶点通信。

## 核心概念

- **顶点（Vertex）**：图中的节点，维护自己的状态。
- **边（Edge）**：顶点之间的连接，可以携带权重等属性。
- **消息（Message）**：顶点之间通信的载体。
- **超步（Superstep）**：计算的基本单位，包含本地计算、消息传递和同步。

## 应用场景

- PageRank 计算
- 最短路径查找
- 连通分量分析
- 社区发现

## 实现框架

- **Apache Giraph**：Pregel 的开源实现。
- **Spark GraphX**：Spark 的图处理库。
- **Flink Gelly**：Flink 的图处理库。

## 相关概念

- [[batch-processing]] — 批处理系统
- [[batch-synchronous-parallel]] — BSP 模型
- [[apache-giraph]] — 图处理框架
- [[spark-graphx]] — 图处理库
- [[flink-gelly]] — 图处理库
