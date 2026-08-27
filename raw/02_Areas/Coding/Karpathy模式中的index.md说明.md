下面是一个符合 Karpathy 模式的 `index.md` 典型结构示意，你可以直接拿来改成自己的版本用。

---

## 设计思路先讲清楚

Karpathy 的 `index.md` 是“内容目录”，核心原则是：[[gist.github](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f)]

- 列出 **所有页面**：每一行至少包含 wikilink + 一句话摘要。
    
- 按 **类别分组**：如 entities / concepts / sources / workflows 等。[[aaif](https://aaif.io/blog/karpathys-llm-wiki-as-agent-memory/)]
    
- 方便 **人和 LLM 导航**：LLM 查询时先读 `index.md` 再决定去看哪些页面，而不是一上来做向量检索。[[aibuilderclub](https://www.aibuilderclub.com/blog/karpathy-llm-wiki)]
    

所以它更像一个可读的数据库目录，而不是随手写的“总纲”。

---

## 一个最小但规范的 index.md 样例

你可以把下面当作模板，放在 `wiki/index.md`，然后逐步由 LLM 或你自己维护：

text

``# LLM Wiki Index 本文件是整个 wiki 的内容目录。   每一条目：一个 wikilink + 一句话说明 + 可选元数据（日期、来源数等）。 --- ## 1. 核心实体（Entities） - [[llm-wiki]] — 整体系统的定义、目标和边界。   - [[claude-agent]] — 当前负责维护本 wiki 的代理配置与能力概览。   - [[knowledge-graph]] — 如何把 wiki 内容映射成图结构（Obsidian / Understand-Anything 等）。   --- ## 2. 核心概念（Concepts） - [[prompt-engineering]] — 针对通用 LLM 的提示设计原则与模式。   - [[agent-workflows]] — 多代理协作的典型工作流（ingest / lint / query）。   - [[index-md-pattern]] — 本文件的维护规则、字段定义、分类约定。   - [[log-md-pattern]] — `log.md` 的时间线结构与记录粒度。   --- ## 3. 主题领域（Domains） ### 3.1 英语与 IELTS - [[ielts-speaking]] — IELTS 口语评分标准、题型拆解与练习策略。   - [[advanced-english-usage]] — 近母语水平的语用、搭配和 discourse features。   - [[shadowing-workflow]] — 跟读训练的流程、材料挑选和反馈机制。   ### 3.2 LLM 与 AI - [[llm-architecture]] — 主流语言模型架构及训练范式概览。   - [[rag-patterns]] — 不同检索增强生成（RAG）模式及适用场景。   - [[karpathy-llm-wiki-pattern]] — Karpathy 提出的 LLM wiki 知识库模式总结。   ### 3.3 视频与内容生产 - [[video-note-taking]] — 从长视频提炼结构化笔记的流程。   - [[subtitle-workflow]] — 使用 Camtasia / 剪映 / Aegisub 做字幕的标准流程。   - [[content-system-design]] — 从单视频到系列课程的内容架构。   --- ## 4. 源文档摘要（Sources） - [[paper-transformers-2017]] — “Attention is All You Need” 论文摘要与关键概念。   - [[paper-llm-wiki-commentary]] — 关于 LLM wiki 模式的二手分析文章集合。   - [[podcast-ai-learning-episodes]] — 与 AI 学习相关播客的聚合与要点。   --- ## 5. 工作流与工具（Workflows & Tools） - [[ingest-workflow]] — 从 raw/ 目录将源文档编译成实体页的统一流程。   - [[linting-rules]] — 定期检查链接、重复和过时内容的规则。   - [[query-playbook]] — LLM 查询 wiki 并回写答案的标准步骤。   --- ## 6. 维护与时间线（Maintenance） - [[log]] — 重大 ingest / 大规模更新 / linting 的时间线总览。   - [[schema-claude-md]] — CLAUDE.md / AGENTS.md 中定义的 schema 和角色说明。   - [[todo-wiki-expansion]] — 计划扩展的领域、缺失页面和重构任务列表。   --- ## 7. 元数据（Metadata） - 总页面数：约 120（按最后一次 lint 统计）   - 最近一次全面 lint：2026-07-15   - 最近主要更新域：LLM agents & IELTS speaking 专题``  

这个例子综合了 Karpathy 本人的说明（“每页一行、一句话摘要、按类别组织”）和后续社区对结构的扩展实践。[[gist.github](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f)]

---

## 你实际可以怎么微调这个样例

- 把“主题领域”里的分类换成你现在真实在做的四大块：  
    英语 / LLM / 视频 / 知识系统，这样 `/understand-knowledge` 生成的图簇会非常清晰。
    
- 为每条目增加你需要的轻量元数据，例如：`(sources: 3, last-update: 2026-07-18)`——这也是 Karpathy 推荐的做法。[[aibuilderclub](https://www.aibuilderclub.com/blog/karpathy-llm-wiki)]
    
- 加一个专门的“学习路线”小节，例如 `## 8. Learning Tracks`，里面是像 `[[llm-wiki-bootcamp]]`、`[[ielts-speaking-track]]` 这种路线页，方便你用 LLM 把散点知识编织成课程。
    

如果你把现在已经有的几个主题列出来（比如你已有的 10–20 个 Markdown 笔记标题），我可以帮你按这个模式直接排成一个具体的 `index.md` 初稿，适配你的真实内容。