---
type: concept
title: 混洗（Shuffle）
tags: [batch-processing, distributed-systems, algorithm]
related: [batch-processing, mapreduce, dataflow-engine, sort-merge-join]
created: 2026-06-21
updated: 2026-06-21
sources: ["Journals/Clippings/第十一章：批处理.md"]
---

# 混洗（Shuffle）

混洗（Shuffle）是批处理系统的基础算法，用于实现分组、连接、聚合等操作。在 MapReduce 中，混洗发生在 map 和 reduce 之间，对所有键值对进行排序和分发。

## 实现步骤

1. **Map 任务输出**：每个 map 任务将其输出按键分区（partition），并写入本地磁盘。
2. **Reducer 连接**：每个 reducer 从所有 map 任务拉取属于自己分区的数据。
3. **排序合并**：reducer 对收到的数据进行排序，然后合并相同键的值列表。

## 相关算法

- **排序合并连接（sort-merge join）**：一种连接算法，利用排序后的数据简化分布式连接。
- **二次排序（secondary sort）**：在排序中进一步按次要键排序，用于实现更复杂的分组逻辑。

## 重要性

混洗是批处理系统的核心操作，几乎所有分布式数据处理（分组、连接、聚合）都依赖它。混洗的性能直接影响批处理作业的整体效率。

## 相关概念

- [[batch-processing]] — 批处理系统
- [[mapreduce]] — 混洗是 MapReduce 的核心阶段
- [[dataflow-engine]] — 现代引擎中的混洗实现
- [[sort-merge-join]] — 排序合并连接算法
