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
---

## grep.app 搜索语法

grep.app 是**跨百万 GitHub 仓库的代码搜索引擎**，语法比 GitHub Search 简洁，核心是 UI 上的几个开关 + 过滤器。

---

### 基础搜索

直接输入要搜索的代码片段，默认是**字面量匹配、大小写不敏感**：

```
useEffect cleanup
getServerSession
async def main
```

---

### 搜索模式开关（UI 切换）

|开关|说明|
|---|---|
|**Case sensitive**|区分大小写（默认关）|
|**Whole words**|仅匹配完整单词，不匹配子串|
|**Regexp**|启用正则表达式模式（与 Whole words 互斥）|

---

### 过滤器（Filter）

|过滤器|示例|说明|
|---|---|---|
|**lang**|`Python` / `TypeScript,TSX`|按编程语言过滤，可逗号分隔多语言|
|**repo**|`facebook/react`|限定搜索某个仓库|
|**path**|`src/components/`|限定文件路径前缀|

---

### 正则模式示例

启用 Regexp 后支持标准正则：

```regexp
# 匹配 useEffect 中带 removeEventListener 的模式
(?s)useEffect\(\(\) => {.*removeEventListener

# 匹配 JWT 相关函数定义
def.*[Jj][Ww][Tt].*\(

# 匹配类定义后跟继承
class \w+\(.*Model\)
```

---

### 实用组合场景

```
# 找某个 API 的真实使用姿势
搜索: createContext
lang: TypeScript
repo: facebook/react

# 找某类文件里的特定模式
搜索: CORS(
lang: Python
path: middleware/

# 找生产级错误处理写法
搜索: except Exception as e
lang: Python
path: src/
```

---

### 限制

- 只搜索 **public 仓库**，不支持私有库
- 不支持 `AND/OR` 逻辑组合关键词（不像 GitHub Search）
- 无 `stars:>1000` 这类仓库维度过滤
- 正则不支持 lookahead/lookbehind 等 PCRE 高级语法（基础正则）


---

## 一句话定位差异

**grep.app = 代码内容搜索**；**GitHub Search = 仓库/生态搜索**。

---

## 场景对比

|场景|推荐|原因|
|---|---|---|
|找某个 API/函数的真实用法|**grep.app**|直接看代码上下文，结果干净|
|找正则匹配的代码模式|**grep.app**|GitHub Search 不支持正则|
|找某个开源库怎么被别人集成|**grep.app**|跨仓库批量扫描，一眼看多个实现|
|找有没有人实现过某个算法|**grep.app**|代码片段命中率高|
|找某个库/项目本身|**GitHub Search**|有 stars/fork/license 等维度过滤|
|找 Issue、PR、讨论|**GitHub Search**|grep.app 不索引非代码内容|
|找某个人的仓库|**GitHub Search**|用户维度搜索|
|找最近更新/活跃的项目|**GitHub Search**|支持 `pushed:>2024-01-01`|
|找特定语言的热门项目|**GitHub Search**|`language:Rust stars:>1000`|

---

## 核心决策树

```
你想找的是「代码怎么写」？
    → grep.app

你想找的是「有没有这个项目/库」？
    → GitHub Search
```

---

## 典型工作流（组合使用）

实际高效的姿势是**串联**：

1. **GitHub Search** 找到目标仓库（按 stars 筛出高质量项目）
2. **grep.app** 加 `repo:` 过滤器，深挖这个仓库内的实现细节

或者反过来：

1. **grep.app** 搜某个罕见 API 的用法，发现几个实现它的仓库
2. **GitHub Search** 去看这些仓库的 Issue/文档，理解背景

---

## GitHub Search 搜索语法

### 仓库维度

```
# 按星数、语言、更新时间
language:rust stars:>1000
language:python stars:500..5000 pushed:>2024-01-01

# 按话题标签
topic:machine-learning topic:pytorch

# 按仓库大小(KB)
size:>10000 language:go
```

---

### 代码搜索

```
# 基础：在代码中找内容
filename:.env DB_PASSWORD
filename:Dockerfile FROM node:18
extension:yaml kubernetes

# 限定路径
path:src/components Button language:typescript
path:**/test/** mock language:python

# 限定仓库/组织
repo:vercel/next.js getServerSideProps
org:microsoft async def
```

---

### Issue / PR

```
# 状态 + 关键词
is:issue is:open label:bug "memory leak"
is:pr is:merged base:main language:go

# 时间维度
is:issue created:>2024-06-01 react hooks
is:pr merged:2024-01-01..2024-12-31

# 未解决且高互动
is:issue is:open comments:>10 no:assignee
```

---

### 用户 / 组织

```
# 找某人的特定语言仓库
user:torvalds language:c
org:google language:python stars:>500

# 找 fork 来源
parent:facebook/react
```

---

### 高级过滤符

|语法|含义|
|---|---|
|`NOT`|排除词 `python NOT django`|
|`..`|范围 `stars:100..1000`|
|`>` `<` `>=`|比较 `forks:>50`|
|`"exact phrase"`|精确短语匹配|
|`is:public` / `is:private`|可见性|
|`archived:false`|排除归档仓库|
|`no:license`|无 license 的仓库|
|`mirror:false`|排除镜像仓库|

---

### 实用组合

```
# 找生产可用的模板项目
topic:boilerplate language:typescript stars:>500 archived:false

# 找近期活跃的 AI 项目
topic:llm pushed:>2024-01-01 stars:>200 language:python

# 找真实项目中某配置的写法
filename:docker-compose.yml redis org:github

# 找有 CVE 的历史漏洞模式（安全研究）
is:issue label:security is:closed CVE
```

---

### 搜索范围切换

GitHub Search 默认在**当前上下文**搜索，注意在搜索框左侧切换：

```
Repositories / Code / Issues / Pull requests / Discussions / Users
```

**Code 搜索**是单独引擎（cs.github.com），支持更强的语法，值得专门用。

 