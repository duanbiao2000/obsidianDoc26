---
type: concept
title: 批同步并行（BSP）
tags: [batch-processing, graph-processing, distributed-systems]
related: [batch-processing, mapreduce, pregel-model]
created: 2026-06-21
updated: 2026-06-21
sources: ["Journals/Clippings/第十一章：批处理.md"]
---

# 批同步并行（BSP）

批同步并行（Bulk Synchronous Parallel, BSP）是一种并行计算模型，常用于图计算。它将计算过程分为一系列超步（superstep），每个超步包含三个阶段：本地计算、通信和同步。

## 核心阶段

1. **本地计算**：每个节点基于本地数据执行计算。
2. **通信**：节点之间交换消息。
3. **同步**：所有节点等待其他节点完成当前超步，然后进入下一个超步。

## 应用

BSP 模型是 Pregel 模型的基础，Pregel 是 Google 提出的图计算模型，被 Apache Giraph、Spark GraphX、Flink Gelly 等框架实现。

## 相关概念

- [[batch-processing]] — 批处理系统
- [[mapreduce]] — 另一种并行计算模型
- [[pregel-model]] — 基于 BSP 的图计算模型
