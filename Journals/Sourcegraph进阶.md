下面从 **功能能力 / 索引深度 / 查询表达力 / 规模支持 / 适用场景** 五个维度，对三者做系统级对比：

- Sourcegraph
- grep.app
- GitHub Search（代码搜索）

---

# 一、核心定位差异

|工具|本质定位|
|---|---|
|Sourcegraph|企业级代码智能与跨仓库语义搜索平台|
|grep.app|公开代码的快速全文正则搜索|
|GitHub Search|平台内仓库搜索（带代码索引能力）|

一句话理解：

- **Sourcegraph = 代码搜索 + 代码理解**
- **grep.app = 全网代码 grep**
- **GitHub Search = GitHub 生态内精准检索**

---

# 二、搜索能力对比

## 1️⃣ 查询语法表达能力

### Sourcegraph

- 支持正则
- 支持结构化搜索（structural search）
- 支持 symbol 搜索
- 支持 repo/branch 限定
- 支持 AND/OR 逻辑组合
- 支持 type:file / type:symbol

示例：

```
repo:myorg/.* lang:go func \(ctx context.Context
```

优势：复杂代码模式匹配。

---

### grep.app

- 强正则支持
- 语言过滤
- 仓库过滤
- 无语义层（纯文本）

示例：

```
panic\(.*\)
```

优势：速度快，跨 GitHub 全公开仓库。

---

### GitHub Search

- 支持：
  - language:
  - path:
  - repo:
  - org:
  - symbol:
- 支持正则（新版 Code Search）

示例：

```
repo:golang/go path:/src/ func Parse
```

但：

- 逻辑表达不如 Sourcegraph 强
- 无结构搜索

---

# 三、索引范围

|维度|Sourcegraph|grep.app|GitHub Search|
|---|---|---|---|
|公共仓库|可|是（主场）|是|
|私有仓库|✅ 企业支持|❌|✅|
|本地仓库|✅|❌|❌|
|企业 GitLab|✅|❌|❌|
|单文件下载仓库|可配置|仅公开 GitHub|仅 GitHub|

---

# 四、语义级能力（关键分水岭）

## Sourcegraph 独有能力

- go-to-definition
- find references
- cross-repo symbol graph
- code navigation
- call hierarchy
- dependency awareness
- IDE integration
- Cody（AI）

这已经超越 grep。

---

## grep.app

无语义图，仅文本匹配。

适合：

```
找某种用法示例
```

不适合：

```
分析函数调用链
```

---

## GitHub Search

中间态：

- 支持 symbol 搜索
- 支持代码导航
- 但跨 repo 能力有限
- 无企业全局索引能力

---

# 五、规模支持

|规模|Sourcegraph|grep.app|GitHub|
|---|---|---|---|
|单仓库|优|优|优|
|数百仓库|强|不适用|中|
|数千仓库|企业级|不支持|不支持|
|多 VCS|支持|不支持|不支持|

---

# 六、速度与体验

|指标|Sourcegraph|grep.app|GitHub|
|---|---|---|---|
|首次响应|中|极快|中|
|大范围正则|稳定|快|慢|
|UI 流畅度|专业 IDE 感|简洁|普通|

grep.app 通常最快。

---

# 七、典型使用场景

## 场景 1：找某个 API 在开源项目中的用法

→ 选 grep.app

优点：

- 全网覆盖
- 快
- 正则强

---

## 场景 2：企业内部代码治理

→ 选 Sourcegraph

因为：

- 跨仓库调用链
- 安全扫描
- 统一索引
- 私有代码

---

## 场景 3：在 GitHub 上找 issue 相关代码

→ GitHub Search

因为：

- 同平台上下文整合
- Pull request 关联

---

## 场景 4：重构大型 Monorepo

→ Sourcegraph

因为：

- symbol graph
- reference tracking
- structural search

---

# 八、AI 集成能力

|工具|AI 能力|
|---|---|
|Sourcegraph|内建 Cody|
|GitHub|Copilot 集成|
|grep.app|无|

AI 时代：

Sourcegraph 与 GitHub 都进入「代码理解平台」阶段。

grep 仍是搜索工具。

---

# 九、深层战略差异

## Sourcegraph

目标：

```
成为企业代码的知识图谱
```

正在向：

- Code Intelligence
- LLM augmented dev

发展。

---

## GitHub

目标：

```
平台生态 + Copilot 绑定
```

搜索是生态能力的一部分。

---

## grep.app

目标：

```
公开代码即时搜索引擎
```

专注一个点。

---

# 十、选择建议（实用版）

|你要做什么|用哪个|
|---|---|
|看别人怎么写某个函数|grep.app|
|大规模重构|Sourcegraph|
|查某 repo 实现|GitHub|
|企业代码分析|Sourcegraph|
|正则扫描开源库|grep.app|

---

# 十一、进阶洞见（关键）

在 AI 时代：

- grep = 模式匹配
- GitHub search = 代码定位
- Sourcegraph = 代码知识图谱入口

长期看：

> 代码搜索正在从“字符串匹配”升级为“语义理解”。

---

如果你愿意，我可以继续给你：

1. **三者在 LLM Agent 时代的未来演化路径**
2. **Sourcegraph vs OpenAI + embeddings 自建索引对比**
3. **大型代码库知识图谱架构拆解**
4. **如何为企业搭建自有代码搜索系统（技术选型方案）**

选一个方向即可继续深入。
