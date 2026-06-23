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







你的底层需求是：**理解 Obsidian Stack 视图在知识管理中的具体价值和使用策略**。

## 🎯 Obsidian Stack 是什么？

**Stack 显示方式** = 将多个笔记**叠放在同一个窗格**，像一堆扑克牌，通过选项卡（Tab）快速切换。

```
┌─────────────────────────────┐
│ Note A │ Note B │ Note C ✓   │
├─────────────────────────────┤
│                             │
│     Note C 的内容           │
│                             │
└─────────────────────────────┘
```

**对比其他视图**：

- **Side by side**（左右分列）：同时看多个笔记
- **Stack**（叠放）：空间利用率高，快速切换
- **Tab 栏**（传统标签页）：无视觉分组

---

## 💼 Stack 的适用场景

### **场景 1：比较与对照（对标分析）**

```
研究论文时：
┌─────────────────────┐
│ Paper A │ Paper B ✓ │
├─────────────────────┤
│ Paper B 内容        │
│ - 方法论            │
│ - 实验结果          │
│ - 结论              │
└─────────────────────┘

需要快速切换看 Paper A：点击 Tab
需要看 Paper C：添加到 Stack

优势：
✓ 在同一个"工作台"快速对比
✓ 不用打开多个窗口，窗口管理简单
✓ 快捷键切换（Ctrl+Tab）比鼠标切换 Side by Side 快
```

---

### **场景 2：写作参考模式**

```
写论文时：
┌─────────────────────────────────┐
│ 目录 │ 参考文献 │ 当前章节 ✓    │
├─────────────────────────────────┤
│ 当前章节的内容                  │
│ （边写边参考其他笔记）          │
└─────────────────────────────────┘

工作流：
1. 当前编辑"第三章方法论"
2. 需要查看"参考文献"格式 → 点击 Tab
3. 需要确认"目录结构" → 点击 Tab
4. 回到"第三章"继续写 → 点击 Tab

vs Side by Side：
- Side by Side：占用屏幕 50%，写作空间拥挤
- Stack：参考内容在 Tab 栏，需要时点击，写作空间充足
```

---

### **场景 3：项目管理与上下文追踪**

```
开发一个功能时：
┌──────────────────────────────────┐
│ 需求文档 │ API 设计 │ 进度 ✓     │
├──────────────────────────────────┤
│ 当前任务进度                      │
│ - 已完成：API 实现                │
│ - 进行中：前端集成                │
│ - TODO：测试                      │
└──────────────────────────────────┘

需要查阅需求 → Tab 切换（0.5 秒）
需要检查 API 设计 → Tab 切换（0.5 秒）
回到进度表 → Tab 切换（0.5 秒）

优势：
✓ 上下文始终在同一个窗格，不用在屏幕间移动鼠标
✓ 快捷键切换（Ctrl+Page Down/Up）极快
✓ 所有相关笔记集中在一个"工作空间"
```

---

### **场景 4：知识体系梳理**

```
学习某个主题时：
┌────────────────────────────┐
│ 概览 │ 深度 A │ 深度 B ✓   │
├────────────────────────────┤
│ 深度话题 B 的详细内容      │
│ （递归式学习）             │
└────────────────────────────┘

学习流程：
1. 打开"概览"笔记
2. 遇到不清楚的点 → Stack 中添加深度话题 A
3. 深度话题 A 中又遇到细节 → 再添加深度话题 B
4. 需要回到上一层 → Tab 切换回去

类似浏览器历史记录，但更可视化
```

---

## ⚙️ Stack 的核心优势

|优势|具体表现|对比|
|---|---|---|
|**空间高效**|不占用额外屏幕空间|vs Side by Side（占 50%）|
|**快速切换**|Ctrl+Tab 毫秒级|vs 鼠标移动、点击（需要 1-2 秒）|
|**上下文集中**|所有相关笔记在同一窗格|vs 散落在多个窗口（需要管理窗口位置）|
|**心智轻量**|只关注当前笔记 + 相关 Tab|vs 需要同时记住多个窗口位置|
|**可追溯性**|Tab 顺序形成"路径"|vs Side by Side 无历史感|

---

## 📊 Stack vs 其他视图的对比

|场景|Stack|Side by Side|Split Panes|
|---|---|---|---|
|**空间受限**|⭐⭐⭐⭐⭐|⭐⭐|⭐⭐⭐|
|**快速切换**|⭐⭐⭐⭐⭐|⭐⭐|⭐⭐⭐|
|**参考查阅**|⭐⭐⭐⭐|⭐⭐⭐⭐⭐|⭐⭐⭐⭐|
|**同时编辑多个**|⭐|⭐⭐⭐⭐⭐|⭐⭐⭐⭐|
|**代码/长文本**|⭐⭐⭐|⭐⭐⭐⭐|⭐⭐⭐⭐|
|**思维导图模式**|⭐⭐|⭐⭐⭐⭐⭐|⭐⭐⭐⭐|

---

## 🎯 不同工作流的推荐

### **场景 A：知识工作者（学生、研究者）**

```
推荐：Stack + Linked Panel

工作流：
- 主窗格：Stack（当前笔记 + 参考文献组）
- 右侧 Linked Panel：相关笔记列表
- 快速查阅参考 → 直接点击 Linked Panel 中的笔记加入 Stack

优势：
✓ 参考内容在手指触及之处
✓ 不用分心管理多个窗口
✓ 完全基于链接驱动的学习路径
```

---

### **场景 B：项目经理**

```
推荐：Stack + 预设工作空间

设置：
工作空间 1："项目 A"
- Stack：需求 | API | 进度 | 日志

工作空间 2："项目 B"
- Stack：需求 | 架构 | 测试

快速切换工作空间（Cmd+Alt+数字）
→ 整个上下文切换

优势：
✓ 不同项目的笔记组织完全隔离
✓ 快速从"项目 A"切到"项目 B"
✓ 避免笔记混乱
```

---

### **场景 C：内容创作者**

```
不推荐单独用 Stack
建议：Side by Side + Stack

布局：
┌──────────────┬──────────────┐
│   左侧       │   右侧 Stack │
│ 参考资料列表 │ 当前写作     │
│              │ + 引用笔记   │
└──────────────┴──────────────┘

原因：
- 参考资料需要同时看多个
- 写作内容需要充足空间
- Stack 用于辅助参考，不是主视图
```

---

## 🛠️ Stack 的实际使用技巧

### **技巧 1：快捷键优化**

```
默认快捷键可能不够快，自定义为：

// macOS
Cmd+[ : 上一个 Tab
Cmd+] : 下一个 Tab

// Windows/Linux  
Ctrl+Shift+[ : 上一个 Tab
Ctrl+Shift+] : 下一个 Tab

或映射到单个键：
Alt+J : 上一个 Tab
Alt+K : 下一个 Tab
```

### **技巧 2：预设 Stack 组**

```
在 Obsidian 中保存工作空间：

工作空间："阅读论文"
- Stack 包含：
  - 当前论文
  - 论文摘要
  - 参考文献索引
  - 我的笔记

工作空间："写博客"
- Stack 包含：
  - 草稿
  - 参考链接
  - 模板

一键加载整个上下文
```

### **技巧 3：利用 Tab 顺序**

```
Stack 中的 Tab 顺序很重要：

┌──────────────────────────┐
│ 1. 起点 │ 2. 中间 │ 3. 当前 │
└──────────────────────────┘

最近用的 Tab 不一定最重要
把最常查阅的放在前面

例如论文阅读：
- Tab 1: 论文本体（查阅多）
- Tab 2: 术语表（参考频繁）
- Tab 3: 我的笔记（编辑频繁）
```

---

## ⚠️ Stack 的局限与替代方案

### **何时不应该用 Stack**

```
❌ 需要同时对比多个笔记的细节
   → 用 Side by Side

❌ 处理大量数据表格
   → 用 dataview 或表格视图

❌ 思维导图式的多向展开
   → 用 Canvas（Obsidian 1.1+）

❌ 代码编辑且需要参考多个文件
   → 用 IDE（VS Code）而非 Obsidian
```

---

## 💡 Stack 的最佳实践

```markdown
✅ DO：
- 在 Stack 中保持 3-5 个相关笔记（任何更多会混乱）
- 使用快捷键快速切换，而不是鼠标点击
- 定期"清理" Stack（关闭不再需要的 Tab）
- 预设常用的 Stack 工作空间

❌ DON'T：
- 在一个 Stack 中放 20+ 个笔记
- 依赖鼠标管理 Stack（效率低）
- 把 Stack 当成"收藏夹"（应该用标签或链接）
- 混合不相关的笔记（破坏上下文）
```

---

## 🎯 总结：何时用 Stack

|用户类型|推荐|原因|
|---|---|---|
|**学生/研究者**|⭐⭐⭐⭐⭐|对比参考文献、快速切换|
|**知识工作者**|⭐⭐⭐⭐|上下文追踪、链接导航|
|**项目经理**|⭐⭐⭐⭐|工作空间隔离、快速切换|
|**内容创作者**|⭐⭐⭐|辅助参考，不是主体|
|**开发者**|⭐⭐|IDE 更适合代码工作|

---

**你的使用场景是什么？**

- 学术研究？我可以给笔记系统架构建议
- 项目管理？我可以给工作空间设置方案
- 内容创作？我可以给工作流优化建议

告诉我具体用途，我能给更精准的配置策略。



==⚠  Switch to EXCALIDRAW VIEW in the MORE OPTIONS menu of this document. ⚠== You can decompress Drawing data with the command palette: 'Decompress current Excalidraw file'. For more info check in plugin settings under 'Saving'


# Excalidraw Data

## Text Elements
obsidian ^dT3Z6YWT

pkm managerment ^uy84q7uI

obsidian ^EbhR3idG

## Element Links
gwzLvVzQ: [[Journals/Obsidian Stack 视图适用场景.md#⚙️ Stack 的核心优势]]

XDlBN64S: [[Journals/Obsidian Stack 视图适用场景.md#🛠️ Stack 的实际使用技巧]]

%%
## Drawing
```json
{
	"type": "excalidraw",
	"version": 2,
	"source": "https://github.com/zsviczian/obsidian-excalidraw-plugin/releases/tag/2.20.6",
	"elements": [
		{
			"id": "Y3E9g1QpQB7OBOKb7EWIZ",
			"type": "freedraw",
			"x": 299.5,
			"y": 1051.453125,
			"width": 153.00000000000003,
			"height": 12.000000000000004,
			"angle": 0.12721621706788788,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "#ffec99",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 0,
			"opacity": 100,
			"groupIds": [],
			"frameId": null,
			"index": "aF",
			"roundness": null,
			"seed": 1427325044,
			"version": 402,
			"versionNonce": 169134452,
			"isDeleted": false,
			"boundElements": [],
			"updated": 1772638486656,
			"link": null,
			"locked": false,
			"points": [
				[
					0,
					12.000000000000004
				],
				[
					1.2047244094488192,
					12.000000000000004
				],
				[
					12.047244094488192,
					12.000000000000004
				],
				[
					27.708661417322837,
					8.000000000000002
				],
				[
					36.14173228346458,
					4.000000000000001
				],
				[
					48.18897637795277,
					4.000000000000001
				],
				[
					53.007874015748044,
					4.000000000000001
				],
				[
					59.03149606299215,
					4.000000000000001
				],
				[
					63.85039370078742,
					4.000000000000001
				],
				[
					68.6692913385827,
					4.000000000000001
				],
				[
					72.28346456692915,
					4.000000000000001
				],
				[
					78.30708661417324,
					4.000000000000001
				],
				[
					81.9212598425197,
					4.000000000000001
				],
				[
					84.33070866141733,
					4.000000000000001
				],
				[
					86.74015748031499,
					4.000000000000001
				],
				[
					87.9448818897638,
					4.000000000000001
				],
				[
					89.14960629921262,
					4.000000000000001
				],
				[
					90.35433070866144,
					8.000000000000002
				],
				[
					92.76377952755907,
					8.000000000000002
				],
				[
					93.9685039370079,
					8.000000000000002
				],
				[
					97.58267716535435,
					8.000000000000002
				],
				[
					98.78740157480317,
					8.000000000000002
				],
				[
					103.60629921259844,
					8.000000000000002
				],
				[
					110.83464566929135,
					8.000000000000002
				],
				[
					114.44881889763782,
					8.000000000000002
				],
				[
					115.65354330708664,
					8.000000000000002
				],
				[
					116.85826771653547,
					8.000000000000002
				],
				[
					118.0629921259843,
					8.000000000000002
				],
				[
					119.26771653543311,
					8.000000000000002
				],
				[
					121.67716535433073,
					8.000000000000002
				],
				[
					122.88188976377955,
					8.000000000000002
				],
				[
					124.08661417322837,
					8.000000000000002
				],
				[
					126.49606299212601,
					8.000000000000002
				],
				[
					127.70078740157484,
					8.000000000000002
				],
				[
					128.90551181102367,
					8.000000000000002
				],
				[
					131.31496062992127,
					8.000000000000002
				],
				[
					132.5196850393701,
					8.000000000000002
				],
				[
					133.72440944881893,
					8.000000000000002
				],
				[
					134.92913385826776,
					8.000000000000002
				],
				[
					136.13385826771656,
					8.000000000000002
				],
				[
					137.3385826771654,
					8.000000000000002
				],
				[
					138.54330708661422,
					8.000000000000002
				],
				[
					139.74803149606305,
					4.000000000000001
				],
				[
					140.95275590551182,
					4.000000000000001
				],
				[
					142.15748031496065,
					4.000000000000001
				],
				[
					144.5669291338583,
					4.000000000000001
				],
				[
					145.7716535433071,
					4.000000000000001
				],
				[
					146.97637795275594,
					0
				],
				[
					149.38582677165357,
					0
				],
				[
					150.59055118110237,
					0
				],
				[
					151.79527559055123,
					0
				],
				[
					153.00000000000003,
					0
				],
				[
					153.00000000000003,
					0
				]
			],
			"pressures": [
				1,
				0.9811320754716981,
				0.9622641509433962,
				0.9433962264150944,
				0.9245283018867925,
				0.9056603773584906,
				0.8867924528301887,
				0.8679245283018868,
				0.8490566037735849,
				0.8301886792452831,
				0.8113207547169812,
				0.7924528301886793,
				0.7735849056603774,
				0.7547169811320755,
				0.7358490566037735,
				0.7169811320754716,
				0.6981132075471698,
				0.6792452830188679,
				0.660377358490566,
				0.6415094339622641,
				0.6226415094339622,
				0.6037735849056604,
				0.5849056603773585,
				0.5660377358490566,
				0.5471698113207547,
				0.5283018867924528,
				0.5094339622641509,
				0.49056603773584906,
				0.4716981132075472,
				0.4528301886792453,
				0.4339622641509434,
				0.41509433962264153,
				0.39622641509433965,
				0.37735849056603776,
				0.3584905660377358,
				0.33962264150943394,
				0.32075471698113206,
				0.3018867924528302,
				0.2830188679245283,
				0.2641509433962264,
				0.24528301886792453,
				0.22641509433962265,
				0.20754716981132076,
				0.18867924528301888,
				0.16981132075471697,
				0.1509433962264151,
				0.1320754716981132,
				0.11320754716981132,
				0.09433962264150944,
				0.07547169811320754,
				0.05660377358490566,
				0.03773584905660377,
				0.018867924528301886
			],
			"simulatePressure": false,
			"customData": {
				"strokeOptions": {
					"options": {
						"thinning": 1,
						"smoothing": 0.5,
						"streamline": 0.5,
						"easing": "linear",
						"start": {
							"taper": 0,
							"cap": true
						},
						"end": {
							"taper": true,
							"easing": "linear",
							"cap": false
						}
					}
				}
			},
			"hasTextLink": false
		},
		{
			"id": "gwzLvVzQ",
			"type": "embeddable",
			"x": 159,
			"y": 547,
			"width": 520,
			"height": 300,
			"angle": 0,
			"strokeColor": "#000000",
			"backgroundColor": "transparent",
			"fillStyle": "hachure",
			"strokeWidth": 1,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"roundness": null,
			"seed": 9965,
			"version": 121,
			"versionNonce": 1880256249,
			"updated": 1772638411312,
			"isDeleted": false,
			"groupIds": [],
			"boundElements": [],
			"link": "[[Journals/Obsidian Stack 视图适用场景.md#⚙️ Stack 的核心优势]]",
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
			"index": "aG"
		},
		{
			"id": "XDlBN64S",
			"type": "embeddable",
			"x": 746.0592041410547,
			"y": 589.6473633128435,
			"width": 622.0000000000001,
			"height": 881.0000000000001,
			"angle": 0,
			"strokeColor": "#000000",
			"backgroundColor": "transparent",
			"fillStyle": "hachure",
			"strokeWidth": 1,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"roundness": null,
			"seed": 50469,
			"version": 123,
			"versionNonce": 840741885,
			"updated": 1772643331817,
			"isDeleted": false,
			"groupIds": [],
			"boundElements": [],
			"link": "[[Journals/Obsidian Stack 视图适用场景.md#🛠️ Stack 的实际使用技巧]]",
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
			"index": "aH"
		},
		{
			"id": "dT3Z6YWT",
			"type": "text",
			"x": 206.20592041410546,
			"y": 1041.453125,
			"width": 77.85992431640625,
			"height": 25,
			"angle": 0,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "#e7f5ff",
			"fillStyle": "solid",
			"strokeWidth": 4,
			"strokeStyle": "solid",
			"roughness": 0,
			"opacity": 100,
			"groupIds": [],
			"frameId": null,
			"index": "aI",
			"roundness": null,
			"seed": 1717590132,
			"version": 87,
			"versionNonce": 920244285,
			"isDeleted": false,
			"boundElements": [],
			"updated": 1772643383370,
			"locked": false,
			"text": "obsidian",
			"rawText": "obsidian",
			"fontSize": 20,
			"fontFamily": 5,
			"textAlign": "left",
			"verticalAlign": "top",
			"containerId": null,
			"originalText": "obsidian",
			"autoResize": true,
			"lineHeight": 1.25,
			"hasTextLink": false,
			"link": null
		},
		{
			"id": "uy84q7uI",
			"type": "text",
			"x": 470.20592041410544,
			"y": 1048.453125,
			"width": 165.13987731933594,
			"height": 25,
			"angle": 0,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "#e7f5ff",
			"fillStyle": "solid",
			"strokeWidth": 4,
			"strokeStyle": "solid",
			"roughness": 0,
			"opacity": 100,
			"groupIds": [],
			"frameId": null,
			"index": "aJ",
			"roundness": null,
			"seed": 585208436,
			"version": 43,
			"versionNonce": 1930346653,
			"isDeleted": false,
			"boundElements": [],
			"updated": 1772643383370,
			"locked": false,
			"text": "pkm managerment",
			"rawText": "pkm managerment",
			"fontSize": 20,
			"fontFamily": 5,
			"textAlign": "left",
			"verticalAlign": "top",
			"containerId": null,
			"originalText": "pkm managerment",
			"autoResize": true,
			"lineHeight": 1.25,
			"hasTextLink": false,
			"link": null
		},
		{
			"text": "obsidian",
			"fontSize": 20,
			"fontFamily": 5,
			"textAlign": "left",
			"verticalAlign": "top",
			"id": "EbhR3idG",
			"type": "text",
			"x": 315.20592041410544,
			"y": 1133.1590454141055,
			"width": 77.85992431640625,
			"height": 25,
			"angle": 0,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "transparent",
			"fillStyle": "hachure",
			"strokeWidth": 1,
			"strokeStyle": "solid",
			"roughness": 1,
			"opacity": 100,
			"roundness": null,
			"seed": 39571,
			"version": 5,
			"versionNonce": 1342612733,
			"updated": 1772643383370,
			"isDeleted": false,
			"groupIds": [],
			"boundElements": [],
			"link": null,
			"locked": false,
			"frameId": null,
			"hasTextLink": false,
			"containerId": null,
			"originalText": "obsidian",
			"rawText": "obsidian",
			"lineHeight": 1.25,
			"autoResize": true,
			"index": "aK"
		},
		{
			"id": "ornbYvMA",
			"type": "rectangle",
			"x": 295.719831769654,
			"y": 1561.0418149466193,
			"width": 209.64089291491422,
			"height": 100.93820769977356,
			"angle": 0.10352467451054359,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "#ffec99",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 0,
			"opacity": 100,
			"groupIds": [],
			"frameId": null,
			"index": "aL",
			"roundness": {
				"type": 3
			},
			"seed": 1654795229,
			"version": 134,
			"versionNonce": 1350093811,
			"isDeleted": false,
			"boundElements": [],
			"updated": 1772643556661,
			"link": null,
			"locked": false
		},
		{
			"id": "c6EgpzUEdMZT_mXjFs08B",
			"type": "rectangle",
			"x": 771.9411193788418,
			"y": 1580.4530087350372,
			"width": 209.64089291491422,
			"height": 100.93820769977356,
			"angle": 0.10352467451054359,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "#ffec99",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 0,
			"opacity": 100,
			"groupIds": [],
			"frameId": null,
			"index": "aLV",
			"roundness": {
				"type": 3
			},
			"seed": 752610717,
			"version": 138,
			"versionNonce": 1203117875,
			"isDeleted": true,
			"boundElements": [],
			"updated": 1772643560891,
			"link": null,
			"locked": false
		},
		{
			"id": "hmSRonVcKlbK2Jbl_HiK-",
			"type": "rectangle",
			"x": 1051.4623099320606,
			"y": 1589.511565836299,
			"width": 209.64089291491422,
			"height": 100.93820769977356,
			"angle": 0.10352467451054359,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "#ffec99",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 0,
			"opacity": 100,
			"groupIds": [],
			"frameId": null,
			"index": "aLl",
			"roundness": {
				"type": 3
			},
			"seed": 1517263421,
			"version": 157,
			"versionNonce": 1302651261,
			"isDeleted": true,
			"boundElements": [],
			"updated": 1772643560891,
			"link": null,
			"locked": false
		},
		{
			"id": "oKML6pH9",
			"type": "rectangle",
			"x": 844.4095761889358,
			"y": 1595.981963765772,
			"width": 372.694920737626,
			"height": 175.99482368165621,
			"angle": 0,
			"strokeColor": "#1e1e1e",
			"backgroundColor": "#ffec99",
			"fillStyle": "solid",
			"strokeWidth": 2,
			"strokeStyle": "solid",
			"roughness": 0,
			"opacity": 100,
			"groupIds": [],
			"frameId": null,
			"index": "aM",
			"roundness": {
				"type": 3
			},
			"seed": 605190109,
			"version": 197,
			"versionNonce": 523475133,
			"isDeleted": true,
			"boundElements": null,
			"updated": 1772643336968,
			"link": null,
			"locked": false
		}
	],
	"appState": {
		"theme": "light",
		"viewBackgroundColor": "#e7f5ff",
		"currentItemStrokeColor": "#1e1e1e",
		"currentItemBackgroundColor": "#ffec99",
		"currentItemFillStyle": "solid",
		"currentItemStrokeWidth": 2,
		"currentItemStrokeStyle": "solid",
		"currentItemRoughness": 0,
		"currentItemOpacity": 100,
		"currentItemFontFamily": 5,
		"currentItemFontSize": 20,
		"currentItemTextAlign": "left",
		"currentItemStartArrowhead": null,
		"currentItemEndArrowhead": "arrow",
		"currentItemArrowType": "round",
		"currentItemFrameRole": null,
		"scrollX": -126.84244581041742,
		"scrollY": -624.8358945325137,
		"zoom": {
			"value": 0.77275
		},
		"currentItemRoundness": "round",
		"gridSize": 20,
		"gridStep": 5,
		"gridModeEnabled": false,
		"gridColor": {
			"Bold": "rgba(155, 213, 255, 0.5)",
			"Regular": "rgba(180, 224, 255, 0.5)"
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