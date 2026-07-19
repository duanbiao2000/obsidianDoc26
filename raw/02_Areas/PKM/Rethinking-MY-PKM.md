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
---
#prompt-engineering 
## 精度压缩
>Compress to one sentence a 5-year-old can understand, then one a PhD would respect.  

#Example
For a 5‑year‑old: This video shows a man making a huge notebook on his computer so he can always find his ideas, stories, and memories when he needs them.​  
For a PhD: This talk presents a visually oriented, ontology‑driven personal knowledge management system in Obsidian that integrates typed links, LATCH‑based multi‑axis indexing, and templated note structures to optimize long‑term findability, context‑rich retrieval, and incremental refactoring of heterogeneous legacy knowledge artifacts.



## Obsidian 知识系统设计原则：从文件仓库到语义知识图谱

（Evergreen Note · PKM System Design）
![Title Unavailable \| Site Unreachable](https://www.youtube.com/watch?v=nJ660t5ku9A)
---

# 一、问题背景：为什么传统笔记系统会失效

大多数知识管理系统在初期运行良好，但随着信息量增长，往往会陷入三个结构性问题：

1. **分类失效**  
    文件夹结构无法承载知识的多维关系。
    
2. **检索困难**  
    信息只能通过单一路径（通常是分类路径）找到。
    
3. **知识孤岛**  
    大量笔记没有链接，无法形成认知网络。
    

传统系统实际上是 **“文档仓库（Document Archive）”**，而不是 **“知识图谱（Knowledge Graph）”**。

一个可长期扩展的 PKM（Personal Knowledge Management）系统必须满足：

- **低摩擦输入**
    
- **多维检索**
    
- **语义关系表达**
    
- **渐进演化能力**
    

Obsidian 的优势在于它允许用户从 **文件系统 → 语义知识图谱** 逐步过渡。

---

# 二、核心设计哲学（6 个原则）

## 1 保持简单（Keep It Simple）

系统组件应 **单一职责**。

错误设计示例：

```
#productivity
```

同时表示：

- 主题
    
- 项目
    
- 状态
    
- 类型
    

结果：

- 标签爆炸
    
- 查询困难
    
- 图谱混乱
    

更合理的分工：

|元素|职责|
|---|---|
|文件夹|命名空间|
|标签|类型|
|链接|概念关系|
|Dataview字段|语义关系|
|MOC|主题导航|

核心原则：

> 一个元素只承担一种语义角色。

---

## 2 降低摩擦（Minimize Friction）

PKM 的最大敌人不是技术，而是 **心理阻力**。

高摩擦系统会导致：

- 想记却懒得记
    
- 想整理却拖延
    

解决方式：

- 模板自动生成结构
    
- Dataview 自动聚合
    
- Templater 自动填充
    

但关键原则：

> 自动化只解决 **启动摩擦**，不替代思考。

---

## 3 接受棕地现实（Brownfield Reality）

现实中的知识来源：

- 文件系统
    
- Evernote
    
- Roam
    
- Notion
    
- PDF
    
- 邮件
    
- 浏览器收藏
    

因此：

**知识库必然是混乱的。**

错误做法：

```
先全部整理 → 再开始使用
```

正确策略：

**渐进式整理（Progressive Refinement）**

流程：

```
Capture → Link → Refactor
```

知识系统必须允许：

- 历史垃圾数据存在
    
- 逐步演化结构
    

---

## 4 避免移动文件（Avoid Moving Files）

频繁移动文件会导致：

- 链接失效
    
- 同步冲突
    
- 心智负担
    

更好的策略：

**位置稳定 + 链接组织**

换句话说：

> 信息结构应由“链接网络”决定，而不是文件夹树。

文件夹只是 **命名空间（Namespace）**。

---

## 5 使用 LATCH 信息架构

LATCH 是信息设计经典模型：

|维度|含义|
|---|---|
|Location|地点|
|Alphabet|字母|
|Time|时间|
|Category|类别|
|Hierarchy|层级|

优秀知识系统应允许：

**同一信息通过多个维度访问**

例如一本书：

可通过：

- 作者
    
- 主题
    
- 阅读时间
    
- 引用
    
- MOC
    

找到。

本质：

> 多入口检索（Multi-Entry Retrieval）。

---

## 6 始终链接（Always Link）

未链接的笔记：

**认知上等于不存在。**

知识系统的核心单位不是文件，而是：

**关系（Relationship）**

链接行为本身就是思考：

```
这个概念和什么有关？
```

因此：

每个新笔记必须：

```
至少链接一个已有节点
```

避免产生：

**孤立笔记（Orphan Notes）**

---

# 三、信息结构设计

## 1 文件夹：命名空间，而非分类

传统：

```
Knowledge/
  Productivity/
  Psychology/
  Books/
```

问题：

主题会交叉。

更好的结构：

```
people/
books/
projects/
topics/
media/
```

例：

```
people/author/Cal Newport
books/Deep Work
```

当创建链接：

```
[[people/author/Cal Newport]]
```

类型已经隐含。

无需额外标签：

```
#author
```

---

## 2 文件夹的工程作用

文件夹不仅是分类工具，还承担：

**部署策略（Deployment Strategy）**

例如：

- 同步控制
    
- 大文件隔离
    
- 项目封装
    

例：

```
media/video
media/audio
```

可排除同步。

---

## 3 时间前缀命名

项目命名：

```
YYYYMMDD-project
```

例：

```
20240321-youtube-video
```

优点：

- 自动排序
    
- 时间记忆友好
    

因为：

> 人类记时间比记名称更容易。

---

## 4 附件组织策略

传统：

```
assets/
```

问题：

难以迁移。

更优方案：

```
book-name/
   attachments/
```

优点：

- 自包含
    
- 易迁移
    
- 易分享
    

形成 **局部知识生态（Local Knowledge Ecology）**。

---

## 5 文件命名 = 元数据编码

例：

```
logo Apple flaticon
icon headache frustration flaticon
book cover Deep Work
```

命名本身包含：

- 类型
    
- 主题
    
- 来源
    

因此可通过搜索：

```
logo
```

直接获得类型视图。

---

# 四、标签系统设计

标签不用于主题。

标签用于：

**类型系统（Type System）**

每个页面通常只有一个标签：

|标签|类型|
|---|---|
|#person|人|
|#book|书|
|#moc|内容地图|
|#diagram|图|

优点：

- 图谱清晰
    
- 查询稳定
    
- 类型明确
    

主题关系交给：

**链接 + MOC**

---

# 五、语义关系与本体论

简单双链：

```
[[Deep Work]]
```

无法表达：

关系类型。

Dataview 字段：

```
parent::
child::
friend::
inspired_by::
example_of::
```

示例：

```
parent:: [[Deep Work]]
example_of:: [[Focus Strategy]]
```

这样：

图谱变成：

**语义知识图谱（Semantic Knowledge Graph）**

而不是：

**无语义链接网（Hyperlink Mesh）**

---

# 六、原子笔记与模块化知识

原则：

**小而可复用**

但不极端。

策略：

```
先写 → 再拆
```

拆分条件：

- 被频繁引用
    
- 概念独立
    
- 内容增长
    

---

## Transclusion（嵌入）

Obsidian 支持：

```
![[note]]
```

或

```
![[note#section]]
```

这允许：

**模块化知识组合**

例如：

一本书总结：

```
#summary
```

任何地方可引用：

```
![[Deep Work#summary]]
```

这相当于：

为笔记设计 **API接口**。

---

# 七、MOC：知识导航中心

MOC（Map of Content）是：

**人工策展页面**

而不是自动列表。

它类似：

- Wikipedia目录
    
- 课程大纲
    
- 专题主页
    

作用：

- 组织主题
    
- 表达理解结构
    
- 导航知识
    

例：

```
MOC Productivity
   Deep Work
   Time Blocking
   Attention Economy
```

MOC 是：

**知识架构的控制面板**。

---

# 八、时间与空间维度

知识不仅是抽象概念。

它还发生在：

- 时间
    
- 地点
    

---

## 时间索引

Daily Notes 形成：

```
时间导航系统
```

任何一天可看到：

- 事件
    
- 人
    
- 项目
    
- 笔记
    

时间成为：

**认知高速公路**

---

## 地理维度

通过地理标签：

```
geo: 41.9028,12.4964
```

可以在地图查看：

- 旅行
    
- 会议
    
- 地点笔记
    

知识系统扩展为：

**空间记忆系统**。

---

# 九、任务系统：语境驱动

传统任务系统：

```
Todo List
```

问题：

脱离上下文。

更好的方法：

任务放在实体笔记中：

```
Person
Project
Topic
```

然后用 Dataview 聚合。

例如：

某人页面自动显示：

- 等待他做什么
    
- 需要讨论什么
    

会议前只需打开：

**这个人或项目的页面**。

上下文自动浮现。

---

# 十、系统自我维护

大型知识库需要：

**诊断机制**

典型诊断：

- 孤立笔记
    
- 未命名图片
    
- 未链接资源
    

通过 Dataview 自动生成：

```
Diagnostics Dashboard
```

这相当于：

**知识花园的除草系统**。

---

# 十一、模板与知识基础设施

模板的核心作用：

不是更快写笔记。

而是：

**结构一致性**

模板自动生成：

- 标题
    
- 小节
    
- Dataview字段
    
- 任务区
    
- 标签
    

一致结构使得：

- 查询稳定
    
- 图谱稳定
    
- 自动化可靠
    

因此：

> 结构一致性比记录速度更重要。

---

# 十二、系统演化模型

一个成熟 PKM 系统的发展路径：

阶段1

```
文件存储
```

阶段2

```
双链网络
```

阶段3

```
MOC 导航
```

阶段4

```
语义知识图谱
```

阶段5

```
个人认知操作系统
```

终极目标不是：

**存储知识**

而是：

**增强思考能力。**

---

# 核心结论

一个长期可扩展的 Obsidian 系统应具备：

1. **简单组件分工**
    
2. **低摩擦输入**
    
3. **渐进整理能力**
    
4. **稳定文件结构**
    
5. **多维检索入口**
    
6. **语义关系表达**
    
7. **模块化知识复用**
    
8. **上下文驱动任务**
    
9. **系统自诊断能力**
    

最终形态不是：

```
笔记库
```

而是：

```
个人知识图谱 + 思维操作系统
```