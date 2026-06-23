---
type: concept
title: MapReduce
tags: [batch-processing, distributed-systems, mapreduce]
related: [batch-processing, dataflow-engine, shuffle, hadoop, spark, flink]
created: 2026-06-21
updated: 2026-06-21
sources: ["Journals/Clippings/第十一章：批处理.md"]
---

# MapReduce

MapReduce 是一种经典的批处理编程模型，由 Google 提出，包含映射（map）、排序（sort）和归约（reduce）三个阶段。Hadoop 是其最著名的开源实现。

## 核心阶段

1. **Map（映射）**：对输入数据中的每条记录应用用户定义的映射函数，生成键值对。
2. **Shuffle（混洗）**：对所有键值对按键进行排序和分发，将相同键的值发送到同一个 reducer。
3. **Reduce（归约）**：对每个键及其对应的值列表应用用户定义的归约函数，生成最终输出。

## 与 Unix 管道的类比

MapReduce 的 map、shuffle、reduce 步骤与 Unix 管道中的映射、排序、归约步骤直接对应。例如，使用 `cat`, `awk`, `sort`, `uniq`, `head` 等命令处理 nginx 日志，展示了批处理的核心逻辑，并能高效处理 GB 级数据。

## 局限性

- **编程模型原始**：编写复杂处理逻辑很费力。
- **以文件为中心的 I/O**：作业流水化困难，导致性能比现代引擎慢。
- **已被取代**：MapReduce 已基本过时，被 Spark、Flink 等数据流引擎取代。

## 历史意义

尽管 MapReduce 已过时，但理解它对理解现代批处理框架至关重要。它奠定了大规模数据处理的基础，其设计思想（映射-混洗-归约）至今仍是许多批处理系统的核心。

## 相关概念

- [[batch-processing]] — 批处理系统
- [[dataflow-engine]] — 现代批处理框架（Spark、Flink）
- [[shuffle]] — 混洗算法
- [[hadoop]] — MapReduce 的开源实现
- [[spark]] — 现代批处理/流处理引擎
- [[flink]] — 现代数据流处理引擎
