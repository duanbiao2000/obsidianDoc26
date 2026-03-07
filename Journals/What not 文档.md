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
excalidraw-plugin: parsed
---


你的底层需求是：**理解"What Not"文档在软件工程中的作用和具体形式**。

## 🎯 What Not 文档的本质

**What Not 文档** = 明确说明**项目/产品不做什么、不支持什么、故意排除什么**的文档。

**核心作用**：用**否定清单**来划定边界，避免需求蔓延和误解。

---

## 📋 三种常见形式

### **1. 产品 What Not（最常见）**

```markdown
# Slack 的"What Not"（假设）

## 我们不做的功能：
- ❌ 端对端加密聊天（因为企业合规需求）
- ❌ 本地部署版本（只提供 SaaS）
- ❌ 集成超过 100 个第三方应用（维护成本过高）
- ❌ 支持离线模式（核心是云同步）
- ❌ 为免费用户提供高级分析

## 原因：
- 这些功能与我们的核心价值主张冲突
- 维护成本 > 用户收益
- 会分散团队专注力
```

**实际例子**：

- **GitHub** 不做代码编辑器（专注托管）
- **Notion** 不做实时协作视频通话（专注文档）
- **Figma** 不做 3D 设计（聚焦 2D UI/UX）

---

### **2. 技术架构 What Not**

```markdown
# 后端架构决策

## 我们选择 PostgreSQL，不选择：

❌ MongoDB（文档型）
   - 原因：我们的数据结构化程度高
   - 缺点：事务支持差，JOIN 性能差
   - 成本：维护一套数据库太复杂

❌ MySQL（虽然流行）
   - 原因：需要 JSON 支持和高级特性
   - 缺点：某些数据类型支持不足

❌ NoSQL 全家（Redis、Cassandra）
   - 原因：不需要最终一致性
   - 缺点：复杂度 > 收益

## 明确的 Scope：
- ✓ 结构化数据，强一致性
- ✓ 复杂关系查询
- ✓ 事务支持
```

---

### **3. API 设计 What Not**

```markdown
# REST API 规范

## 我们的 API 不支持：

❌ SOAP（太复杂）
❌ GraphQL（维护成本高，用户需求不强）
❌ Webhook（自动推送）- 改用轮询或长连接
❌ WebSocket（降低可维护性）
❌ gRPC（不需要内部通信优化）

## 明确支持：
✓ REST + JSON
✓ OAuth 2.0（标准认证）
✓ Rate Limiting（清晰的流量限制）

## 不支持的 HTTP 方法：
- ❌ 自定义动词（如 POST /api/user/activate）
  改为：PATCH /api/user { "status": "active" }
```

---

## 💼 What Not 在实际项目中的应用

### **场景 1：需求评审会议**

```
产品经理提议：
"我们要支持离线编辑，然后同步到云端"

技术主管回应（基于 What Not）：
"根据我们的架构文档，我们不支持离线模式：
- 我们是实时协作工具
- 同步机制基于 WebSocket
- 离线模式会增加 merge 冲突处理的复杂度

替代方案：改进网络连接稳定性而非离线支持"

→ 快速达成共识，避免 2 周的无效设计
```

---

### **场景 2：新员工 Onboarding**

```
新入职后端工程师问：
"我们的 API 支持 GraphQL 吗？"

你指向 What Not 文档：
"不支持。原因是 [技术决策文档链接]。
如果你遇到 REST 性能瓶颈，
先看这个 [优化清单]，再提 Proposal"

→ 1 分钟解答，新人理解背景
```

---

### **场景 3：客户沟通**

```
企业客户询问：
"支持本地部署吗？"

销售参考 What Not 文档：
"不支持。我们的模式是 SaaS：
- 优势：自动更新、无维护成本
- 如果你有数据合规需求，我们提供 VPC 隔离方案"

→ 明确的边界，专业的回答
```

---

## 📊 What Not 文档的结构

```markdown
# What Not 文档模板

## 核心不支持的功能
- 功能 A：不做
  - 原因（2-3 句）
  - 替代方案或建议

## 技术栈限制
- 不用 X 技术
  - 为什么不用
  - 用什么替代

## 服务范围边界
- 不支持 Y 场景
  - 这对用户的影响
  - 推荐的解决方向

## 维护与更新
- 上次评审：[日期]
- 下次评审：[日期]
- 所有者：[团队]
```

---

## 🎯 What Not 的关键价值

### **1. 防止需求蔓延**

```
有了 What Not，问题从：
"我们能不能加这个功能？"
→ "为什么我们不支持这个？"

变成：
"这符合我们的 What Not 政策吗？"
→ 快速 Yes/No，有据可依
```

### **2. 减少重复讨论**

```
没有 What Not：
- Week 1：某人提议离线模式 → 长讨论
- Week 8：另一人提议离线模式 → 又讨论一次
- Week 15：客户要求离线 → 再讨论

有 What Not：
- 所有人查文档：不支持，原因已记录
→ 节省 30+ 小时会议时间
```

### **3. 明确团队优先级**

```
What Not 文档说：
"我们不做多语言支持"

传达的信号：
✓ 国际化不是我们的关键战略
✓ 工程师精力专注在其他地方
✓ 如果用户需要，他们知道不要指望这个
```

### **4. 新员工快速理解产品哲学**

```
What Not 文档像是"宪法"：
- 为什么我们这样设计
- 哪些诱惑我们拒绝了
- 团队的坚持和取舍
```

---

## ⚠️ What Not 的常见误区

### **误区 1：What Not 太消极**

```
❌ "我们不做 X，不做 Y，不做 Z"
→ 看起来就是一堆限制

✅ "我们专注 A 和 B，因此不做 C"
→ 阐述的是**聚焦**，不是限制
```

### **误区 2：What Not 一成不变**

```
❌ 5 年前写的 What Not，从不更新
→ 变得不相关

✅ 每个季度/年度评审一次
→ 反映当前优先级
```

### **误区 3：What Not 只有大决策**

```
❌ 只记录"不做自有支付系统"这种大事

✅ 也记录小决策：
- 不用 jQuery（用 React）
- 不支持 IE 11（只支持现代浏览器）
- 不做 CLI 版本（只做 Web）
```

---

## 🔗 What Not 与其他文档的关系

```
产品规划文档：描述"做什么"
What Not 文档：描述"不做什么"
╰─ 一起构成完整的产品范围定义

技术选型文档：选择 X 而不选 Y
What Not 文档：解释为什么
╰─ 一起记录设计决策的因果

路线图：未来 12 个月做什么
What Not 文档：未来 12 个月坚持不做什么
╰─ 一起是战略承诺
```

---

## 💡 你需要建立 What Not 文档吗？

**适用场景**：

- ✅ 产品团队频繁讨论"要不要加这个功能"
- ✅ 客户经常问"你们支持 X 吗"
- ✅ 新员工不理解为什么某些技术没采用
- ✅ 团队对优先级经常有分歧

**如果有 2+ 项符合，就应该写 What Not 文档**。

---

**你的具体场景是？**

- 想为产品写 What Not？
- 想为技术架构写 What Not？
- 想理解某个开源项目的 What Not？

告诉我背景，我能帮你起草文档框架。



==⚠ Switch to EXCALIDRAW VIEW in the MORE OPTIONS menu of this document. ⚠== You can decompress Drawing data with the command palette: 'Decompress current Excalidraw file'. For more info check in plugin settings under 'Saving'

# Excalidraw Data

## Text Elements
## Element Links
Df4N9f3n: [[Journals/What not 文档.md#🎯 What Not 的关键价值]]

fYwYQnEW: [[Journals/What not 文档.md#📊 What Not 文档的结构]]

8VI5D3Pu: [[Journals/What not 文档.md#🔗 What Not 与其他文档的关系]]

%%
## Drawing
```json
{
	"type": "excalidraw",
	"version": 2,
	"source": "https://github.com/zsviczian/obsidian-excalidraw-plugin/releases/tag/2.20.6",
	"elements": [
		{
			"id": "Df4N9f3n",
			"type": "embeddable",
			"x": -428.40699914811114,
			"y": 451.41200536932274,
			"width": 1266.379233005492,
			"height": 1037.7295047990765,
			"angle": 0,
			"strokeColor": "#000000",
			"backgroundColor": "transparent",
			"fillStyle": "hachure",
			"strokeWidth": 1,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"roundness": null,
			"seed": 13852,
			"version": 132,
			"versionNonce": 356985272,
			"updated": 1772707149607,
			"isDeleted": false,
			"groupIds": [],
			"boundElements": [],
			"link": "[[Journals/What not 文档.md#🎯 What Not 的关键价值]]",
			"locked": false,
			"frameId": null,
			"hasTextLink": false,
			"scale": [
				1,
				1
			],
			"customData": {
				"mdProps": {
					"useObsidianDefaults": false,
					"backgroundMatchCanvas": false,
					"backgroundMatchElement": true,
					"backgroundColor": "#fff",
					"backgroundOpacity": 60,
					"borderMatchElement": true,
					"borderColor": "#fff",
					"borderOpacity": 0,
					"filenameVisible": false
				}
			},
			"index": "a0"
		},
		{
			"id": "fYwYQnEW",
			"type": "embeddable",
			"x": -430.8053091418374,
			"y": -78.10435966281818,
			"width": 400,
			"height": 500,
			"angle": 0,
			"strokeColor": "#000000",
			"backgroundColor": "transparent",
			"fillStyle": "hachure",
			"strokeWidth": 1,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"roundness": null,
			"seed": 35017,
			"version": 34,
			"versionNonce": 1055516105,
			"updated": 1772707090144,
			"isDeleted": false,
			"groupIds": [],
			"boundElements": [],
			"link": "[[Journals/What not 文档.md#📊 What Not 文档的结构]]",
			"locked": false,
			"frameId": null,
			"hasTextLink": false,
			"scale": [
				1,
				1
			],
			"customData": {
				"mdProps": {
					"useObsidianDefaults": false,
					"backgroundMatchCanvas": false,
					"backgroundMatchElement": true,
					"backgroundColor": "#fff",
					"backgroundOpacity": 60,
					"borderMatchElement": true,
					"borderColor": "#fff",
					"borderOpacity": 0,
					"filenameVisible": false
				}
			},
			"index": "a1"
		},
		{
			"id": "8VI5D3Pu",
			"type": "embeddable",
			"x": 38.539090838400625,
			"y": -8.293407720677408,
			"width": 400,
			"height": 316.3434956599068,
			"angle": 0,
			"strokeColor": "#000000",
			"backgroundColor": "transparent",
			"fillStyle": "hachure",
			"strokeWidth": 1,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"roundness": null,
			"seed": 61001,
			"version": 143,
			"versionNonce": 480777160,
			"updated": 1772707161425,
			"isDeleted": false,
			"groupIds": [],
			"boundElements": [],
			"link": "[[Journals/What not 文档.md#🔗 What Not 与其他文档的关系]]",
			"locked": false,
			"frameId": null,
			"hasTextLink": false,
			"scale": [
				1,
				1
			],
			"customData": {
				"mdProps": {
					"useObsidianDefaults": false,
					"backgroundMatchCanvas": false,
					"backgroundMatchElement": true,
					"backgroundColor": "#fff",
					"backgroundOpacity": 60,
					"borderMatchElement": true,
					"borderColor": "#fff",
					"borderOpacity": 0,
					"filenameVisible": false
				}
			},
			"index": "a2"
		}
	],
	"appState": {
		"theme": "light",
		"viewBackgroundColor": "#ffffff",
		"currentItemStrokeColor": "hsl(162, 80%, 77%)",
		"currentItemBackgroundColor": "#fab005",
		"currentItemFillStyle": "solid",
		"currentItemStrokeWidth": 4,
		"currentItemStrokeStyle": "solid",
		"currentItemRoughness": 1,
		"currentItemOpacity": 100,
		"currentItemFontFamily": 5,
		"currentItemFontSize": 20,
		"currentItemTextAlign": "left",
		"currentItemStartArrowhead": null,
		"currentItemEndArrowhead": "arrow",
		"currentItemArrowType": "round",
		"currentItemFrameRole": null,
		"scrollX": 538.5105050098883,
		"scrollY": 229.23204818997877,
		"zoom": {
			"value": 0.931086
		},
		"currentItemRoundness": "round",
		"gridSize": 20,
		"gridStep": 5,
		"gridModeEnabled": false,
		"gridColor": {
			"Bold": "rgba(217, 217, 217, 0.5)",
			"Regular": "rgba(230, 230, 230, 0.5)"
		},
		"colorPalette": {
			"elementStroke": [
				"transparent",
				"black",
				"DimGray",
				"DarkGray",
				"White",
				"hsl(0,80%,50%)",
				"hsl(339,80%,50%)",
				"hsl(288,80%,50%)",
				"hsl(230,80%,50%)",
				"hsl(208,80%,50%)",
				"hsl(188,80%,41%)",
				"hsl(131,80%,41%)",
				"hsl(85,80%,41%)",
				"hsl(59,80%,59%)",
				"hsl(24,80%,50%)",
				"hsl(0, 80%, 23%)",
				"hsl(0, 80%, 32%)",
				"hsl(0, 80%, 41%)",
				"hsl(0, 80%, 50%)",
				"hsl(0, 80%, 59%)",
				"hsl(0, 80%, 68%)",
				"hsl(0, 80%, 77%)",
				"hsl(0, 80%, 86%)",
				"hsl(0, 80%, 90%)",
				"hsl(0, 80%, 94%)",
				"hsl(339, 80%, 23%)",
				"hsl(339, 80%, 32%)",
				"hsl(339, 80%, 41%)",
				"hsl(339, 80%, 50%)",
				"hsl(339, 80%, 59%)",
				"hsl(339, 80%, 68%)",
				"hsl(339, 80%, 77%)",
				"hsl(339, 80%, 86%)",
				"hsl(339, 80%, 90%)",
				"hsl(339, 80%, 94%)",
				"hsl(288, 80%, 23%)",
				"hsl(288, 80%, 32%)",
				"hsl(288, 80%, 41%)",
				"hsl(288, 80%, 50%)",
				"hsl(288, 80%, 59%)",
				"hsl(288, 80%, 68%)",
				"hsl(288, 80%, 77%)",
				"hsl(288, 80%, 86%)",
				"hsl(288, 80%, 90%)",
				"hsl(288, 80%, 94%)",
				"hsl(255, 80%, 23%)",
				"hsl(255, 80%, 32%)",
				"hsl(255, 80%, 41%)",
				"hsl(255, 80%, 50%)",
				"hsl(255, 80%, 59%)",
				"hsl(255, 80%, 68%)",
				"hsl(255, 80%, 77%)",
				"hsl(255, 80%, 86%)",
				"hsl(255, 80%, 90%)",
				"hsl(255, 80%, 94%)",
				"hsl(230, 80%, 23%)",
				"hsl(230, 80%, 32%)",
				"hsl(230, 80%, 41%)",
				"hsl(230, 80%, 50%)",
				"hsl(230, 80%, 59%)",
				"hsl(230, 80%, 68%)",
				"hsl(230, 80%, 77%)",
				"hsl(230, 80%, 86%)",
				"hsl(230, 80%, 90%)",
				"hsl(230, 80%, 94%)",
				"hsl(208, 80%, 23%)",
				"hsl(208, 80%, 32%)",
				"hsl(208, 80%, 41%)",
				"hsl(208, 80%, 50%)",
				"hsl(208, 80%, 59%)",
				"hsl(208, 80%, 68%)",
				"hsl(208, 80%, 77%)",
				"hsl(208, 80%, 86%)",
				"hsl(208, 80%, 90%)",
				"hsl(208, 80%, 94%)",
				"hsl(188, 80%, 23%)",
				"hsl(188, 80%, 32%)",
				"hsl(188, 80%, 41%)",
				"hsl(188, 80%, 50%)",
				"hsl(188, 80%, 59%)",
				"hsl(188, 80%, 68%)",
				"hsl(188, 80%, 77%)",
				"hsl(188, 80%, 86%)",
				"hsl(188, 80%, 90%)",
				"hsl(188, 80%, 94%)",
				"hsl(162, 80%, 23%)",
				"hsl(162, 80%, 32%)",
				"hsl(162, 80%, 41%)",
				"hsl(162, 80%, 50%)",
				"hsl(162, 80%, 59%)",
				"hsl(162, 80%, 68%)",
				"hsl(162, 80%, 77%)",
				"hsl(162, 80%, 86%)",
				"hsl(162, 80%, 90%)",
				"hsl(162, 80%, 94%)",
				"hsl(131, 80%, 23%)",
				"hsl(131, 80%, 32%)",
				"hsl(131, 80%, 41%)",
				"hsl(131, 80%, 50%)",
				"hsl(131, 80%, 59%)",
				"hsl(131, 80%, 68%)",
				"hsl(131, 80%, 77%)",
				"hsl(131, 80%, 86%)",
				"hsl(131, 80%, 90%)",
				"hsl(131, 80%, 94%)",
				"hsl(85, 80%, 23%)",
				"hsl(85, 80%, 32%)",
				"hsl(85, 80%, 41%)",
				"hsl(85, 80%, 50%)",
				"hsl(85, 80%, 59%)",
				"hsl(85, 80%, 68%)",
				"hsl(85, 80%, 77%)",
				"hsl(85, 80%, 86%)",
				"hsl(85, 80%, 90%)",
				"hsl(85, 80%, 94%)",
				"hsl(59, 80%, 23%)",
				"hsl(59, 80%, 32%)",
				"hsl(59, 80%, 41%)",
				"hsl(59, 80%, 50%)",
				"hsl(59, 80%, 59%)",
				"hsl(59, 80%, 68%)",
				"hsl(59, 80%, 77%)",
				"hsl(59, 80%, 86%)",
				"hsl(59, 80%, 90%)",
				"hsl(59, 80%, 94%)",
				"hsl(39, 80%, 23%)",
				"hsl(39, 80%, 32%)",
				"hsl(39, 80%, 41%)",
				"hsl(39, 80%, 50%)",
				"hsl(39, 80%, 59%)",
				"hsl(39, 80%, 68%)",
				"hsl(39, 80%, 77%)",
				"hsl(39, 80%, 86%)",
				"hsl(39, 80%, 90%)",
				"hsl(39, 80%, 94%)",
				"hsl(24, 80%, 23%)",
				"hsl(24, 80%, 32%)",
				"hsl(24, 80%, 41%)",
				"hsl(24, 80%, 50%)",
				"hsl(24, 80%, 59%)",
				"hsl(24, 80%, 68%)",
				"hsl(24, 80%, 77%)",
				"hsl(24, 80%, 86%)",
				"hsl(24, 80%, 90%)",
				"hsl(24, 80%, 94%)",
				"hsl(0, 0%, 23%)",
				"hsl(0, 0%, 32%)",
				"hsl(0, 0%, 41%)",
				"hsl(0, 0%, 50%)",
				"hsl(0, 0%, 59%)",
				"hsl(0, 0%, 68%)",
				"hsl(0, 0%, 77%)",
				"hsl(0, 0%, 86%)",
				"hsl(0, 0%, 90%)",
				"hsl(0, 0%, 94%)"
			],
			"elementBackground": [
				"transparent",
				"black",
				"hsl(0, 0%, 77%)",
				"hsl(0, 0%, 90%)",
				"White",
				"hsl(0,80%,86%)",
				"hsl(339,80%,86%)",
				"hsl(288,80%,86%)",
				"hsl(230,80%,86%)",
				"hsl(208,80%,86%)",
				"hsl(188,80%,86%)",
				"hsl(131,80%,86%)",
				"hsl(85,80%,86%)",
				"hsl(59,80%,86%)",
				"hsl(24,80%,77%)",
				"hsl(0, 80%, 23%)",
				"hsl(0, 80%, 32%)",
				"hsl(0, 80%, 41%)",
				"hsl(0, 80%, 50%)",
				"hsl(0, 80%, 59%)",
				"hsl(0, 80%, 68%)",
				"hsl(0, 80%, 77%)",
				"hsl(0, 80%, 86%)",
				"hsl(0, 80%, 90%)",
				"hsl(0, 80%, 94%)",
				"hsl(339, 80%, 23%)",
				"hsl(339, 80%, 32%)",
				"hsl(339, 80%, 41%)",
				"hsl(339, 80%, 50%)",
				"hsl(339, 80%, 59%)",
				"hsl(339, 80%, 68%)",
				"hsl(339, 80%, 77%)",
				"hsl(339, 80%, 86%)",
				"hsl(339, 80%, 90%)",
				"hsl(339, 80%, 94%)",
				"hsl(288, 80%, 23%)",
				"hsl(288, 80%, 32%)",
				"hsl(288, 80%, 41%)",
				"hsl(288, 80%, 50%)",
				"hsl(288, 80%, 59%)",
				"hsl(288, 80%, 68%)",
				"hsl(288, 80%, 77%)",
				"hsl(288, 80%, 86%)",
				"hsl(288, 80%, 90%)",
				"hsl(288, 80%, 94%)",
				"hsl(255, 80%, 23%)",
				"hsl(255, 80%, 32%)",
				"hsl(255, 80%, 41%)",
				"hsl(255, 80%, 50%)",
				"hsl(255, 80%, 59%)",
				"hsl(255, 80%, 68%)",
				"hsl(255, 80%, 77%)",
				"hsl(255, 80%, 86%)",
				"hsl(255, 80%, 90%)",
				"hsl(255, 80%, 94%)",
				"hsl(230, 80%, 23%)",
				"hsl(230, 80%, 32%)",
				"hsl(230, 80%, 41%)",
				"hsl(230, 80%, 50%)",
				"hsl(230, 80%, 59%)",
				"hsl(230, 80%, 68%)",
				"hsl(230, 80%, 77%)",
				"hsl(230, 80%, 86%)",
				"hsl(230, 80%, 90%)",
				"hsl(230, 80%, 94%)",
				"hsl(208, 80%, 23%)",
				"hsl(208, 80%, 32%)",
				"hsl(208, 80%, 41%)",
				"hsl(208, 80%, 50%)",
				"hsl(208, 80%, 59%)",
				"hsl(208, 80%, 68%)",
				"hsl(208, 80%, 77%)",
				"hsl(208, 80%, 86%)",
				"hsl(208, 80%, 90%)",
				"hsl(208, 80%, 94%)",
				"hsl(188, 80%, 23%)",
				"hsl(188, 80%, 32%)",
				"hsl(188, 80%, 41%)",
				"hsl(188, 80%, 50%)",
				"hsl(188, 80%, 59%)",
				"hsl(188, 80%, 68%)",
				"hsl(188, 80%, 77%)",
				"hsl(188, 80%, 86%)",
				"hsl(188, 80%, 90%)",
				"hsl(188, 80%, 94%)",
				"hsl(162, 80%, 23%)",
				"hsl(162, 80%, 32%)",
				"hsl(162, 80%, 41%)",
				"hsl(162, 80%, 50%)",
				"hsl(162, 80%, 59%)",
				"hsl(162, 80%, 68%)",
				"hsl(162, 80%, 77%)",
				"hsl(162, 80%, 86%)",
				"hsl(162, 80%, 90%)",
				"hsl(162, 80%, 94%)",
				"hsl(131, 80%, 23%)",
				"hsl(131, 80%, 32%)",
				"hsl(131, 80%, 41%)",
				"hsl(131, 80%, 50%)",
				"hsl(131, 80%, 59%)",
				"hsl(131, 80%, 68%)",
				"hsl(131, 80%, 77%)",
				"hsl(131, 80%, 86%)",
				"hsl(131, 80%, 90%)",
				"hsl(131, 80%, 94%)",
				"hsl(85, 80%, 23%)",
				"hsl(85, 80%, 32%)",
				"hsl(85, 80%, 41%)",
				"hsl(85, 80%, 50%)",
				"hsl(85, 80%, 59%)",
				"hsl(85, 80%, 68%)",
				"hsl(85, 80%, 77%)",
				"hsl(85, 80%, 86%)",
				"hsl(85, 80%, 90%)",
				"hsl(85, 80%, 94%)",
				"hsl(59, 80%, 23%)",
				"hsl(59, 80%, 32%)",
				"hsl(59, 80%, 41%)",
				"hsl(59, 80%, 50%)",
				"hsl(59, 80%, 59%)",
				"hsl(59, 80%, 68%)",
				"hsl(59, 80%, 77%)",
				"hsl(59, 80%, 86%)",
				"hsl(59, 80%, 90%)",
				"hsl(59, 80%, 94%)",
				"hsl(39, 80%, 23%)",
				"hsl(39, 80%, 32%)",
				"hsl(39, 80%, 41%)",
				"hsl(39, 80%, 50%)",
				"hsl(39, 80%, 59%)",
				"hsl(39, 80%, 68%)",
				"hsl(39, 80%, 77%)",
				"hsl(39, 80%, 86%)",
				"hsl(39, 80%, 90%)",
				"hsl(39, 80%, 94%)",
				"hsl(24, 80%, 23%)",
				"hsl(24, 80%, 32%)",
				"hsl(24, 80%, 41%)",
				"hsl(24, 80%, 50%)",
				"hsl(24, 80%, 59%)",
				"hsl(24, 80%, 68%)",
				"hsl(24, 80%, 77%)",
				"hsl(24, 80%, 86%)",
				"hsl(24, 80%, 90%)",
				"hsl(24, 80%, 94%)",
				"hsl(0, 0%, 23%)",
				"hsl(0, 0%, 32%)",
				"hsl(0, 0%, 41%)",
				"hsl(0, 0%, 50%)",
				"hsl(0, 0%, 59%)",
				"hsl(0, 0%, 68%)",
				"hsl(0, 0%, 77%)",
				"hsl(0, 0%, 86%)",
				"hsl(0, 0%, 90%)",
				"hsl(0, 0%, 94%)"
			]
		},
		"currentStrokeOptions": null,
		"frameRendering": {
			"enabled": true,
			"clip": true,
			"name": true,
			"outline": true,
			"markerName": true,
			"markerEnabled": true
		},
		"objectsSnapModeEnabled": false,
		"activeTool": {
			"type": "selection",
			"customType": null,
			"locked": false,
			"fromSelection": false,
			"lastActiveTool": null
		},
		"disableContextMenu": false
	},
	"files": {}
}
```
%%