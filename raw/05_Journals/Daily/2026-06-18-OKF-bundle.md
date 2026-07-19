---
title:
date:
tags:
aliases:
cssclasses:
status: in-progress
rating:
completed: false
due:
source:
domain:
core_concepts:
---

一个 OKF bundle 本质上就是「一整个知识领域的 Markdown 概念文件目录」，每个概念一个文件，前面有 YAML frontmatter，后面是人能读的正文。 [suganthan](https://suganthan.com/okf/)

## 目录结构示例（sales 领域）

比如 Google 官方文档里给的 sales 例子：\[]

```text
sales/
  index.md
  tables/
    index.md
    orders.md
    customers.md
  metrics/
    index.md
    weekly_active_users.md
```

- `sales/` 是整个 OKF bundle 的根目录（一个知识领域）。[]  
- 下面按子领域分目录，比如 `tables/`、`metrics/` 等，每个具体概念是一个 `.md` 文件。[]  
- 人类可以把它当普通文档树看，agent 则可以把它当知识图谱入口。[]

如果你做 IELTS/教育方向，可以类似设计：

```text
ielts_speaking/
  index.md
  concepts/
    band7_coherence.md
    lexical_chunks.md
  playbooks/
    mock_test_routine.md
```

## 单个概念文件示例（带 YAML）

Nic 的笔记里给了一个完整的 `orders.md` 示例：[]

```markdown
---
type: BigQuery Table
title: Orders
description: One row per completed customer order.
resource: https://console.cloud.google.com/bigquery?p=acme&d=sales&t=orders
tags: [sales, revenue]
timestamp: 2026-05-28T14:30:00Z
---

# Schema

| Column      | Type   | Description                        |
|------------|--------|------------------------------------|
| order_id   | STRING | Globally unique order identifier.  |
| customer_id| STRING | FK to customers.                   |

## Joins

- Join to `customers` on `customer_id`.
```

要点：[coruja](https://coruja.in/ai-news-india/google-cloud-open-knowledge-format-ai-agents/)

- YAML frontmatter 里 `type` 是唯一必需字段，其他字段（title、description、resource、tags、timestamp）你按场景扩展。  
- 正文完全是普通 Markdown，可以是 schema 表、流程说明、决策记录、示例等。  
- 不用强制 schema/joins 结构，只要对你和 agent 一致、可解释就行。  

你可以把它迁移到自己场景，比如「IELTS band 7 coherence」：

```markdown
---
type: IELTS Concept
title: Band 7 Coherence
description: How to organize answers so ideas are clear and logically linked.
tags: [ielts, speaking, coherence]
timestamp: 2026-06-18T04:00:00Z
---

## Key idea

- One main idea per answer.
- Use simple linking devices ("the first thing", "on top of that", "finally").
- Keep one storyline instead of jumping around.

## Example pattern

> First..., then..., after that..., finally...

[link to related concept: lexical_chunks](../concepts/lexical_chunks.md)
```

## 完整 bundle 示例（真实线上案例）

Suganthan 把自己的博客和笔记打包成了一个公开 OKF bundle：\[]

- 根目录 `okf/index.md` 是整个 bundle 的入口，列出所有子目录。  
- `blog/index.md` 指向 37 篇文章的概念文件，`notes/index.md` 指向 16 条笔记概念。每一篇文章/笔记都是一个独立 concept doc。  
- 还有一个 `log.md`，是按时间记录 bundle 更新历史的变更日志。  
- 整个 bundle 可以直接打包为 `okf.tar.gz` 下载，任何 agent 可以从 `index.md` 开始爬完整知识图谱，无需爬 HTML。  

官方 spec 也给了类似结构，并提供 BigQuery 数据集的样例 bundle（比如 GA4 电商、Stack Overflow、Bitcoin），里面就是按 dataset/table/metric 拆成一堆 concept markdown 文件。


[[OKF agent提示词]]