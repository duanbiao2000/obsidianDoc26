---
title:
date:
tags:
aliases:
cssclasses:
status: in-progress
rating:
due:
source: https://www.skool.com/maker-zero/classroom/c4ca10e1?md=19770571631b4ed4bc375c8273896d7b
domain:
core_concepts:
---

> [!NOTE]
> Rereading a doc 4 times feels like learning. A week later you remember 40% of it.
> 
> There's a study I come back to often. One group rereads a document four times. Another group reads it once and gets tested on it three times.
> 
> 5 mins later, the rereaders win, 83% to 71%.
> 
> A week later it flips. The rereaders are down to 40%. The tested group is still sitting at 61%!

![](https://assets.skool.com/f/c0c1fc27821a4e67bcf1d379acb5060b/ad173ad5faa341ad864c8da8c3c7cb63223f1e9793bd4640ab76e8fb5e05d5fd.png)

最大的启发是：学习时“感觉越来越熟”，不等于未来“能够独立想起来”。如果目标是一周后、一个月后还能使用知识，就应该把部分重读时间换成**主动回忆**，而不是一直读到自己觉得熟悉为止。这正是这项研究所展示的“测试效应”：测试不仅检验学习，也能促进学习。 [pmc.ncbi.nlm.nih](https://pmc.ncbi.nlm.nih.gov/articles/PMC4477741/)

## 1. 我们很容易用“眼前的流畅”误判“长期的掌握”

这段描述对应 Roediger 与 Karpicke 在 2006 年研究中的第二个实验：一组学习四次，另一组学习一次、进行三次回忆测试。五分钟后，前者表现更好，约为 83% 对 71%；一周后，结果反转，约为 40% 对 61%。 [facultyacademy.ucmerced](https://facultyacademy.ucmerced.edu/sites/g/files/ufvvjh886/f/page/documents/roedigerkarpicke2006.pdf)

这里最值得注意的不是哪个百分比，而是两个评价标准发生了分离：

- 即时表现：刚学完时，我能记住多少？
- 长期保持：过了一段时间、不再接触材料时，我还能提取多少？

反复学习提高了即时表现，也提高了参与者对自己记忆能力的信心，但延迟测试中，反复回忆的效果更好。 [pmc.ncbi.nlm.nih](https://pmc.ncbi.nlm.nih.gov/articles/PMC4477741/)

因此，你读一篇技术文档时出现的“现在终于顺了”，可以作为理解进展的信号，却不能单独作为“已经掌握”的证明。

## 2. “测试”不是学习结束后的验收，也可以是学习过程本身

这个实验里的测试，并不是反复看答案，也不是做有选项的识别题，而是给参与者一张白纸，让他们尽可能回忆文章内容；练习阶段没有提供正确性反馈。即便如此，反复回忆仍提高了一周后的保持率。 [pmc.ncbi.nlm.nih](https://pmc.ncbi.nlm.nih.gov/articles/PMC4477741/)

这改变了我们对测试的理解：

> 不必等到“完全学会”才测试；尝试从记忆中提取，就是学习的一部分。

落实到日常学习，可以把“再看一遍”改为：

- 合上文档，写出它的三个核心观点。
- 不看笔记，解释某个概念。
- 先尝试回答一个问题，再打开资料核对。
- 隔几天重新回答，而不是只在刚读完时检查自己。

这些是对研究结果的实际应用建议，并不是原实验逐项验证过的操作流程。 [pmc.ncbi.nlm.nih](https://pmc.ncbi.nlm.nih.gov/articles/PMC4477741/)

## 3. 不要因为回忆时卡住，就认定这种学习方式没效果

这项实验恰好展示了一种反直觉的情况：一种方法让你当下表现较差，却让你以后保留得更多。 [pmc.ncbi.nlm.nih](https://pmc.ncbi.nlm.nih.gov/articles/PMC4477741/)

所以，当你遇到以下情形时，不必急着把它们解释为失败：

> “看文档时都懂，关掉以后只能说出一半。”

更有价值的处理方式，是把它当成诊断结果：

1. 哪些内容能独立说出来？
2. 哪些只能看到标题后想起来？
3. 哪些其实没有理解，只是读着觉得合理？

然后有针对性地回看缺口，而不是因为“想不全”，就把整篇文章再读一遍。

但也不要走到另一个极端：这项研究并不意味着“越痛苦越有效”，更不意味着不理解材料也应该硬背。它支持的是回忆练习对延迟保持的价值，而不是把所有学习困难都视为好事。 [pmc.ncbi.nlm.nih](https://pmc.ncbi.nlm.nih.gov/articles/PMC4477741/)

## 4. 对你的文档、Obsidian 和 Anki 工作流，最直接的改变

我建议把学习流程从：

```text
阅读 → 划线 → AI 总结 → 收藏 → 再读
```

调整为：

```text
阅读并理解
    ↓
关掉材料，自己回忆
    ↓
对照原文，发现遗漏与错误
    ↓
把关键缺口转成问题
    ↓
过一段时间，再次回答
```

这是将“回忆练习优于单纯重复接触”的实验结果，转化为个人工作流的一种做法；不是说每份材料都需要制作卡片。 [pmc.ncbi.nlm.nih](https://pmc.ncbi.nlm.nih.gov/articles/PMC4477741/)

### 技术文档：从“能看懂”改成“能解释、能操作”

以你刚讨论的 Agent harness 为例，读完后先不看笔记，回答：

- Harness 与模型、Agent、编排框架分别是什么关系？
- 它负责哪些环节？
- 如果要给现有 coding agent 增加任务验收，我会把检查放在哪里？
- 哪个部分我还说不清，需要回到文档查证？

这里可以区分两种练习：

| 练习 | 你在检查什么 |
|---|---|
| 不看资料解释概念 | 是否能提取与组织知识 |
| 做一个小实现、运行测试 | 是否能把知识应用到实际任务 |

原实验主要测量文章内容的回忆，不能直接证明所有编程能力都会按同样比例提高。因此，回忆之外仍要用实际任务验证应用能力。 [pmc.ncbi.nlm.nih](https://pmc.ncbi.nlm.nih.gov/articles/PMC4477741/)

### Obsidian：让笔记兼具“答案库”和“问题入口”

例如在笔记开头放上：

```markdown
## 不看正文，先回答

1. 这个概念解决什么问题？
2. 它与相邻概念有什么区别？
3. 给出一个具体例子。
4. 它在什么情况下不适用？

## 正文与来源
……
```

这样，每次打开笔记，不是自动进入重读，而是先给自己一次提取机会。

### Anki：先自己回答，再展示答案

可以把卡片设计成明确、可判断的问题，而不是“请回忆整篇文章”。例如：

> 问：为什么刚读完能复述，不足以证明一周后仍然记得？  
> 答：即时表现与长期保持可能不同；重复阅读可以提高当下表现，而回忆练习可能更有利于延迟保持。 [pmc.ncbi.nlm.nih](https://pmc.ncbi.nlm.nih.gov/articles/PMC4477741/)

重要的不是“卡片有没有复习过”，而是在答案出现之前，你是否真的尝试回答。

## 5. 使用 AI 学习时，尤其要避免“把流畅的解释当成自己的知识”

可以据此给 AI 换一种角色：不只是让它不停提供更好的总结，也让它为你创造提取知识的机会。

例如：

```text
根据这份材料，给我出 5 道开放式问题。

一次只问一道，先不要展示答案。
等我回答后，对照原文指出：
1. 哪些内容正确；
2. 哪些关键点遗漏；
3. 哪些说法没有原文依据。

最后让我重新回答答得最差的一题。
```

这是基于研究启发设计的使用方式，不是该实验直接研究过的 AI 教学方案；核对时仍应以原始材料为依据。 [pmc.ncbi.nlm.nih](https://pmc.ncbi.nlm.nih.gov/articles/PMC4477741/)

## 6. 不要把这组数字读成“人类遗忘的固定规律”

“重读四次，一周后只记得 40%”不是适用于所有人的公式。这里的百分比来自特定文章、特定参与者与回忆测试条件，衡量的是文章内容的回忆，而不是“理解了百分之多少”，也不是所有学习任务的通用结果。 [pmc.ncbi.nlm.nih](https://pmc.ncbi.nlm.nih.gov/articles/PMC4477741/)

此外，一周后的 61% 对 40%，差的是 21 个百分点；它说明该条件下回忆练习有明显优势，并不意味着只要测试三次，就能稳定获得相同收益。 [pmc.ncbi.nlm.nih](https://pmc.ncbi.nlm.nih.gov/articles/PMC4477741/)

真正值得带走的，是一个判断学习效果的新问题：

> 不只是问“我现在看着懂不懂”，而是问“离开材料、过一段时间后，我还能独立说出什么、做出什么？”


[[同声传译训练指南]]