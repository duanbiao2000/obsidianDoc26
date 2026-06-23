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
related:
  - "[[Youtube提取提示词持续增强]]"
---

指两层：你得 **知道自己在干嘛**，也得 **知道怎么跟模型说清楚**。这两块任何一边弱了，AI 写出来的代码都很容易埋雷。

---

## 1. “自己有经验”是什么意思

- 知道正确的目标长什么样  
    你心里要有一个大致的“理想实现”：大概需要哪些模块、边界在哪、数据怎么流动、哪里容易出错。否则模型随便给一个方案，你也分不出好坏，只能“看起来能跑就用”，埋下隐形 bug。

- 有基本的品味和 code smell 雷达  
    例如一眼看出：

  - 这个函数太长、职责太乱。

  - 这里状态共享会出竞态。

  - 这里没处理错误、没考虑空值/异常路径。  
        有经验的人会警觉：“这段回答太顺了，反而可疑”，然后追加追问或重写。

- 能独立检查关键点  
    你能自己：

  - 写/改单元测试。

  - 手动跑几个极端输入试一试。

  - 用日志/断点排查逻辑是否真按照预期走。  
        否则模型出错时，你只能“感觉哪里不对，但说不出问题在哪”。

---

## 2. “写对问题的 prompt”是什么意思

不是随便一句「帮我重构这个」就完事，而是像给同事写 task 一样：

- 说清楚上下文  
    比如：

  - 当前是一个 macOS SwiftUI 菜单栏 app，这个文件负责窗口切换 UI。

  - 目前的问题：窗口多时列表会出屏幕、动画太慢、代码难维护。

  - 相关约束：不能动某个 public API，要兼容 macOS 13+。  
        这样模型才知道从哪里下手、哪些不能动。

- 明“你要什么”，而不是只说“帮我修”  
    例如：

  - 我想把这个大 View 拆成几个小组件：A 负责 header，B 负责列表，C 负责 footer。

  - 目标是让列表部分可以单独测试，未来好加分页和搜索。

  - 请给出拆分后的文件结构、每个组件的 props 设计，并用注释说明各自职责。  
        这类 prompt 会逼模型给结构化方案，而不是堆一坨改动。

- 指定要检查的风险点  
    比如：

  - “重构时要特别注意：不要改变现有的快捷键行为；不要引入额外的 async bug；确保空列表时 UI 不崩。”

  - “重构后，请指出可能引入 bug 的地方，并建议我该写哪些测试来覆盖它们。”  
        你把“担心点”显性写出来，模型才会在这些地方多花精力。

- 用迭代式 prompt，而不是一次 all‑in  
    好的用法是：

    1. 先问：“请先只分析当前文件结构和主要问题，不要写代码。”

    2. 你读完分析，觉得方向 OK，再让它按这个方向分步重构。

    3. 每步结束，让它解释“这步改动的风险点”。  
        这样你始终掌控节奏，而不是一开始就要它“帮我整个项目重构一下”。

---

换句话说：

- **经验** = 你知道“什么是好代码 / 好设计 / 常见坑在哪”，能判断 + 能测试。

- **好 prompt** = 你能把自己的目标、约束、担忧，用非常具体的语言告诉模型，并用小步迭代控制它的动作。

两者一结合，AI 就像一个很强的 pair programmer；缺一半，它就很像一个自信心爆棚但经常乱来的实习生。

==⚠ Switch to EXCALIDRAW VIEW in the MORE OPTIONS menu of this document. ⚠== You can decompress Drawing data with the command palette: 'Decompress current Excalidraw file'. For more info check in plugin settings under 'Saving'

# Excalidraw Data

## Text Elements

优秀提示词机制分析 ^ykGG12cW

[[Prompt Engineering Research Journal]] ^qsnmXY3F

Constraints liberate

 ^LlI68fan

"show your work" mechanics
 ^ALeBW5y3

- **经验** = 你知道“什么是好代码 / 好设计 / 常见坑在哪”，能判断 + 能测试。 ^AuXCjhnN

换句话说： ^QYkyWJRX

- **好 prompt** = 你能把自己的目标、约束、担忧，用非常具体的语言告诉模型，并用小步迭代控制它的动作。 ^chcu6m59

[[写好提示词Prompt]] ^uwDHQTbx

[[写好提示词Prompt#1. “自己有经验”是什么意思|1. “自己有经验”是什么意思]] ^yq2XwGPt

[[写好提示词Prompt#2. “写对问题的 prompt”是什么意思|2. “写对问题的 prompt”是什么意思]] ^8VK3N060

## Element Links

OkdoEP63: [[Journals/写好提示词Prompt.md#2. “写对问题的 prompt”是什么意思]]

EAQIltoJ: [[Prompt Engineering Research Journal#Analysis Three-Layer Framework]]

%%

## Drawing

```json
{
 "type": "excalidraw",
 "version": 2,
 "source": "https://github.com/zsviczian/obsidian-excalidraw-plugin/releases/tag/2.20.6",
 "elements": [
  {
   "id": "s9wzgRFd",
   "type": "rectangle",
   "x": 344.0347009711363,
   "y": 4514.764555314042,
   "width": 132,
   "height": 145,
   "angle": 0,
   "strokeColor": "rgba(0, 0, 0, 1)",
   "backgroundColor": "#ffffff",
   "fillStyle": "solid",
   "strokeWidth": 6,
   "strokeStyle": "solid",
   "roughness": 1,
   "opacity": 100,
   "roundness": null,
   "seed": 62418,
   "version": 58,
   "versionNonce": 150988744,
   "updated": 1772731748715,
   "isDeleted": false,
   "groupIds": [],
   "boundElements": [
    {
     "type": "text",
     "id": "ykGG12cW"
    },
    {
     "id": "zmcsnSGF",
     "type": "arrow"
    },
    {
     "id": "FVZO6Ykp",
     "type": "arrow"
    }
   ],
   "link": null,
   "locked": false,
   "frameId": null,
   "hasTextLink": false,
   "customData": {
    "growthMode": "Right-Left",
    "autoLayoutDisabled": false,
    "arrowType": "curved",
    "fontsizeScale": "Normal Scale",
    "multicolor": true,
    "boxChildren": false,
    "roundedCorners": false,
    "maxWrapWidth": 450,
    "isSolidArrow": true,
    "centerText": true,
    "fillSweep": false,
    "branchScale": "Hierarchical",
    "baseStrokeWidth": 6,
    "layoutSettings": {
     "GAP_X": 120,
     "GAP_Y": 25,
     "GAP_MULTIPLIER": 0.6,
     "ROOT_RADIUS_FACTOR": 0.8,
     "MIN_RADIUS": 350,
     "RADIAL_ASPECT_RATIO": 0.7,
     "RADIAL_POLE_GAP_BONUS": 2,
     "RADIAL_START_ANGLE": 280,
     "RADIAL_MAX_SWEEP": 340,
     "DIRECTIONAL_ARC_SPAN_RADIANS": 1,
     "GAP_MULTIPLIER_DIRECTIONAL": 1.5,
     "RADIUS_PADDING_PER_NODE": 7,
     "VERTICAL_SUBTREE_WIDTH_BLEND_SINGLE": 0.35,
     "VERTICAL_SUBTREE_WIDTH_BLEND_DUAL": 0.6,
     "VERTICAL_SUBTREE_SMOOTH_THRESHOLD_MULTIPLIER": 6,
     "VERTICAL_SUBTREE_SMOOTH_MIN_SCALE": 240,
     "HORIZONTAL_L1_SOFTCAP_THRESHOLD": 560,
     "HORIZONTAL_L1_COMPRESSION_MIN_SCALE": 240,
     "VERTICAL_COMPACT_PARENT_CHILD_GAP_RATIO": 0.55,
     "DIRECTIONAL_CROSS_AXIS_RATIO": 0.2,
     "INDICATOR_OFFSET": 10,
     "INDICATOR_OPACITY": 40,
     "CONTAINER_PADDING": 10,
     "MAX_SEGMENT_LENGTH": 80,
     "MANUAL_GAP_MULTIPLIER": 1.3,
     "MANUAL_JITTER_RANGE": 300
    }
   },
   "index": "a0"
  },
  {
   "text": "优秀提\n示词机\n制分析",
   "fontSize": 36,
   "fontFamily": 5,
   "textAlign": "center",
   "verticalAlign": "middle",
   "id": "ykGG12cW",
   "type": "text",
   "x": 356.0347009711363,
   "y": 4519.764555314042,
   "width": 108,
   "height": 135,
   "angle": 0,
   "strokeColor": "#000000",
   "backgroundColor": "#ffffff",
   "fillStyle": "solid",
   "strokeWidth": 6,
   "strokeStyle": "solid",
   "roughness": 1,
   "opacity": 100,
   "roundness": null,
   "seed": 29667,
   "version": 81,
   "versionNonce": 1037013176,
   "updated": 1772731748715,
   "isDeleted": false,
   "groupIds": [],
   "boundElements": [],
   "locked": false,
   "frameId": null,
   "hasTextLink": false,
   "containerId": "s9wzgRFd",
   "originalText": "优秀提示词机制分析",
   "rawText": "优秀提示词机制分析",
   "lineHeight": 1.25,
   "autoResize": true,
   "index": "a1",
   "link": null
  },
  {
   "text": "📍Prompt Engineering\nResearch Journal",
   "fontSize": 28,
   "fontFamily": 5,
   "textAlign": "center",
   "verticalAlign": "middle",
   "id": "qsnmXY3F",
   "type": "text",
   "x": 766.3353496311807,
   "y": 4477.794106380042,
   "width": 394,
   "height": 70,
   "angle": 0,
   "strokeColor": "black",
   "backgroundColor": "transparent",
   "fillStyle": "solid",
   "strokeWidth": 4.65,
   "strokeStyle": "solid",
   "roughness": 1,
   "opacity": 100,
   "roundness": null,
   "seed": 4074,
   "version": 18,
   "versionNonce": 1934206648,
   "updated": 1772731748715,
   "isDeleted": false,
   "groupIds": [],
   "boundElements": [
    {
     "id": "zmcsnSGF",
     "type": "arrow"
    }
   ],
   "link": null,
   "locked": false,
   "frameId": null,
   "hasTextLink": true,
   "containerId": null,
   "originalText": "📍Prompt Engineering Research Journal",
   "rawText": "[[Prompt Engineering Research Journal]]",
   "lineHeight": 1.25,
   "autoResize": false,
   "customData": {
    "mindmapOrder": 0
   },
   "index": "a2"
  },
  {
   "points": [
    [
     0,
     0
    ],
    [
     88.76688288668142,
     -17.089410085535746
    ],
    [
     185.5337657733629,
     -54.32463455253583
    ],
    [
     274.9756486600443,
     -71.51947098465735
    ]
   ],
   "elbowed": false,
   "lastCommittedPoint": null,
   "startBinding": {
    "elementId": "s9wzgRFd",
    "mode": "orbit",
    "fixedPoint": [
     0.9999,
     0.5001
    ]
   },
   "endBinding": {
    "elementId": "qsnmXY3F",
    "mode": "orbit",
    "fixedPoint": [
     0.0001,
     0.5001
    ]
   },
   "startArrowhead": null,
   "endArrowhead": null,
   "id": "zmcsnSGF",
   "type": "arrow",
   "x": 484.0347009711364,
   "y": 4585.736353166078,
   "width": 274.9756486600443,
   "height": 71.51947098465735,
   "angle": 0,
   "strokeColor": "black",
   "backgroundColor": "transparent",
   "fillStyle": "solid",
   "strokeWidth": 4.65,
   "strokeStyle": "solid",
   "roughness": 1,
   "opacity": 100,
   "roundness": {
    "type": 2
   },
   "seed": 6750,
   "version": 32,
   "versionNonce": 1343011256,
   "updated": 1772731748715,
   "isDeleted": false,
   "groupIds": [],
   "boundElements": [],
   "link": null,
   "locked": false,
   "frameId": null,
   "hasTextLink": false,
   "customData": {
    "isBranch": true
   },
   "index": "a3",
   "moveMidPointsWithElement": false
  },
  {
   "id": "OkdoEP63",
   "type": "embeddable",
   "x": 1199.0347009711363,
   "y": 3968.7808885729746,
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
   "seed": 62880,
   "version": 199,
   "versionNonce": 1787118779,
   "updated": 1772731542511,
   "isDeleted": false,
   "groupIds": [],
   "boundElements": [],
   "link": "[[Journals/写好提示词Prompt.md#2. “写对问题的 prompt”是什么意思]]",
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
   "index": "a4"
  },
  {
   "id": "EAQIltoJ",
   "type": "embeddable",
   "x": 657.1925957079784,
   "y": 3966.6882921311862,
   "width": 500,
   "height": 500,
   "angle": 0,
   "strokeColor": "#1e1e1e",
   "backgroundColor": "#ffc9c9",
   "fillStyle": "hachure",
   "strokeWidth": 1,
   "strokeStyle": "solid",
   "roughness": 1,
   "opacity": 100,
   "roundness": null,
   "seed": 34744,
   "version": 85,
   "versionNonce": 1384392652,
   "updated": 1772731280561,
   "isDeleted": false,
   "groupIds": [],
   "boundElements": [],
   "link": "[[Prompt Engineering Research Journal#Analysis Three-Layer Framework]]",
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
   "index": "a5"
  },
  {
   "id": "LlI68fan",
   "type": "text",
   "x": 397.9820693921889,
   "y": 4252.20638423645,
   "width": 193.2798309326172,
   "height": 75,
   "angle": 0,
   "strokeColor": "hsl(162, 80%, 77%)",
   "backgroundColor": "#fab005",
   "fillStyle": "solid",
   "strokeWidth": 4,
   "strokeStyle": "solid",
   "roughness": 1,
   "opacity": 100,
   "groupIds": [],
   "frameId": null,
   "index": "a7",
   "roundness": null,
   "seed": 410794952,
   "version": 26,
   "versionNonce": 625034680,
   "isDeleted": false,
   "boundElements": [],
   "updated": 1772731120552,
   "locked": false,
   "text": "Constraints liberate\n\n",
   "rawText": "Constraints liberate\n\n",
   "fontSize": 20,
   "fontFamily": 5,
   "textAlign": "left",
   "verticalAlign": "top",
   "containerId": null,
   "originalText": "Constraints liberate\n\n",
   "autoResize": true,
   "lineHeight": 1.25,
   "hasTextLink": false,
   "link": null
  },
  {
   "id": "ALeBW5y3",
   "type": "text",
   "x": 284.2978588658732,
   "y": 4334.311647394344,
   "width": 266.1398010253906,
   "height": 50,
   "angle": 0,
   "strokeColor": "hsl(162, 80%, 77%)",
   "backgroundColor": "#fab005",
   "fillStyle": "solid",
   "strokeWidth": 4,
   "strokeStyle": "solid",
   "roughness": 1,
   "opacity": 100,
   "groupIds": [],
   "frameId": null,
   "index": "a8",
   "roundness": null,
   "seed": 422798520,
   "version": 57,
   "versionNonce": 2131030712,
   "isDeleted": false,
   "boundElements": [],
   "updated": 1772731209874,
   "locked": false,
   "text": "\"show your work\" mechanics\n",
   "rawText": "\"show your work\" mechanics\n",
   "fontSize": 20,
   "fontFamily": 5,
   "textAlign": "left",
   "verticalAlign": "top",
   "containerId": null,
   "originalText": "\"show your work\" mechanics\n",
   "autoResize": true,
   "lineHeight": 1.25,
   "hasTextLink": false,
   "link": null
  },
  {
   "id": "QYkyWJRX",
   "type": "text",
   "x": 1061.3765244302087,
   "y": 3737.285171169121,
   "width": 100,
   "height": 25,
   "angle": 0,
   "strokeColor": "#1e1e1e",
   "backgroundColor": "#ffc9c9",
   "fillStyle": "hachure",
   "strokeWidth": 4,
   "strokeStyle": "solid",
   "roughness": 1,
   "opacity": 100,
   "groupIds": [
    "X9o2xq6QI1-l-E83IqZfl"
   ],
   "frameId": null,
   "index": "a9",
   "roundness": null,
   "seed": 1789685960,
   "version": 54,
   "versionNonce": 2034531528,
   "isDeleted": false,
   "boundElements": [],
   "updated": 1772731562623,
   "link": null,
   "locked": false,
   "text": "换句话说：",
   "rawText": "换句话说：",
   "fontSize": 20,
   "fontFamily": 5,
   "textAlign": "left",
   "verticalAlign": "top",
   "containerId": null,
   "originalText": "换句话说：",
   "autoResize": true,
   "lineHeight": 1.25,
   "hasTextLink": false
  },
  {
   "id": "AuXCjhnN",
   "type": "text",
   "x": 768.7254876702898,
   "y": 3794.785171169121,
   "width": 683.4598999023438,
   "height": 50,
   "angle": 0,
   "strokeColor": "#1e1e1e",
   "backgroundColor": "#ffc9c9",
   "fillStyle": "hachure",
   "strokeWidth": 4,
   "strokeStyle": "solid",
   "roughness": 1,
   "opacity": 100,
   "groupIds": [
    "X9o2xq6QI1-l-E83IqZfl"
   ],
   "frameId": null,
   "index": "aA",
   "roundness": null,
   "seed": 958783416,
   "version": 58,
   "versionNonce": 1412015048,
   "isDeleted": false,
   "boundElements": [],
   "updated": 1772731562623,
   "locked": false,
   "text": "- **经验** = 你知道“什么是好代码 / 好设计 / 常见坑在哪”，能判断 + 能测\n试。",
   "rawText": "- **经验** = 你知道“什么是好代码 / 好设计 / 常见坑在哪”，能判断 + 能测试。",
   "fontSize": 20,
   "fontFamily": 5,
   "textAlign": "left",
   "verticalAlign": "top",
   "containerId": null,
   "originalText": "- **经验** = 你知道“什么是好代码 / 好设计 / 常见坑在哪”，能判断 + 能测试。",
   "autoResize": false,
   "lineHeight": 1.25,
   "hasTextLink": false,
   "link": null
  },
  {
   "id": "chcu6m59",
   "type": "text",
   "x": 771.7465500649744,
   "y": 3889.785171169121,
   "width": 679.2599487304688,
   "height": 50,
   "angle": 0,
   "strokeColor": "#1e1e1e",
   "backgroundColor": "#ffc9c9",
   "fillStyle": "hachure",
   "strokeWidth": 4,
   "strokeStyle": "solid",
   "roughness": 1,
   "opacity": 100,
   "groupIds": [
    "X9o2xq6QI1-l-E83IqZfl"
   ],
   "frameId": null,
   "index": "aB",
   "roundness": null,
   "seed": 1014175688,
   "version": 54,
   "versionNonce": 97643208,
   "isDeleted": false,
   "boundElements": [],
   "updated": 1772731562623,
   "link": null,
   "locked": false,
   "text": "- **好 prompt** = 你能把自己的目标、约束、担忧，用非常具体的语言告诉\n模型，并用小步迭代控制它的动作。",
   "rawText": "- **好 prompt** = 你能把自己的目标、约束、担忧，用非常具体的语言告诉模型，并用小步迭代控制它的动作。",
   "fontSize": 20,
   "fontFamily": 5,
   "textAlign": "left",
   "verticalAlign": "top",
   "containerId": null,
   "originalText": "- **好 prompt** = 你能把自己的目标、约束、担忧，用非常具体的语言告诉模型，并用小步迭代控制它的动作。",
   "autoResize": false,
   "lineHeight": 1.25,
   "hasTextLink": false
  },
  {
   "text": "📍写好提示词Prompt",
   "fontSize": 28,
   "fontFamily": 5,
   "textAlign": "center",
   "verticalAlign": "middle",
   "id": "uwDHQTbx",
   "type": "text",
   "x": 769.1008325791288,
   "y": 4629.493217881288,
   "width": 275.4092712402344,
   "height": 35,
   "angle": 0,
   "strokeColor": "#1396AA",
   "backgroundColor": "transparent",
   "fillStyle": "solid",
   "strokeWidth": 4.65,
   "strokeStyle": "solid",
   "roughness": 1,
   "opacity": 100,
   "roundness": null,
   "seed": 28245,
   "version": 16,
   "versionNonce": 562676680,
   "updated": 1772731748715,
   "isDeleted": false,
   "groupIds": [],
   "boundElements": [
    {
     "id": "FVZO6Ykp",
     "type": "arrow"
    },
    {
     "id": "ylJNmw7h",
     "type": "arrow"
    },
    {
     "id": "5REARpfJ",
     "type": "arrow"
    }
   ],
   "link": null,
   "locked": false,
   "frameId": null,
   "hasTextLink": true,
   "containerId": null,
   "originalText": "📍写好提示词Prompt",
   "rawText": "[[写好提示词Prompt]]",
   "lineHeight": 1.25,
   "autoResize": true,
   "customData": {
    "mindmapOrder": 1
   },
   "index": "aC"
  },
  {
   "points": [
    [
     0,
     0
    ],
    [
     89.68871053599743,
     13.694166145586678
    ],
    [
     187.37742107199492,
     43.55849742920964
    ],
    [
     277.7411316079924,
     57.37034700909771
    ]
   ],
   "elbowed": false,
   "lastCommittedPoint": null,
   "startBinding": {
    "elementId": "s9wzgRFd",
    "mode": "orbit",
    "fixedPoint": [
     0.9999,
     0.5001
    ]
   },
   "endBinding": {
    "elementId": "uwDHQTbx",
    "mode": "orbit",
    "fixedPoint": [
     0.0001,
     0.5001
    ]
   },
   "startArrowhead": null,
   "endArrowhead": null,
   "id": "FVZO6Ykp",
   "type": "arrow",
   "x": 484.0347009711364,
   "y": 4588.502554810267,
   "width": 277.7411316079924,
   "height": 57.37034700909771,
   "angle": 0,
   "strokeColor": "#1396AA",
   "backgroundColor": "transparent",
   "fillStyle": "solid",
   "strokeWidth": 4.65,
   "strokeStyle": "solid",
   "roughness": 1,
   "opacity": 100,
   "roundness": {
    "type": 2
   },
   "seed": 42343,
   "version": 24,
   "versionNonce": 1388102328,
   "updated": 1772731748715,
   "isDeleted": false,
   "groupIds": [],
   "boundElements": [],
   "link": null,
   "locked": false,
   "frameId": null,
   "hasTextLink": false,
   "customData": {
    "isBranch": true
   },
   "index": "aD",
   "moveMidPointsWithElement": false
  },
  {
   "text": "📍1. “自己有经验”是什么意思",
   "fontSize": 20,
   "fontFamily": 5,
   "textAlign": "center",
   "verticalAlign": "middle",
   "id": "yq2XwGPt",
   "type": "text",
   "x": 1164.5101038193632,
   "y": 4596.993217881288,
   "width": 266.2809143066406,
   "height": 25,
   "angle": 0,
   "strokeColor": "#1396AA",
   "backgroundColor": "transparent",
   "fillStyle": "solid",
   "strokeWidth": 3.3,
   "strokeStyle": "solid",
   "roughness": 1,
   "opacity": 100,
   "roundness": null,
   "seed": 62138,
   "version": 14,
   "versionNonce": 1145342648,
   "updated": 1772731748715,
   "isDeleted": false,
   "groupIds": [],
   "boundElements": [
    {
     "id": "ylJNmw7h",
     "type": "arrow"
    }
   ],
   "link": null,
   "locked": false,
   "frameId": null,
   "hasTextLink": true,
   "containerId": null,
   "originalText": "📍1. “自己有经验”是什么意思",
   "rawText": "[[写好提示词Prompt#1. “自己有经验”是什么意思|1. “自己有经验”是什么意思]]",
   "lineHeight": 1.25,
   "autoResize": true,
   "customData": {
    "mindmapOrder": 0
   },
   "index": "aE"
  },
  {
   "points": [
    [
     0,
     0
    ],
    [
     32.67500000000018,
     -7.655790997950135
    ],
    [
     72.67500000000018,
     -26.405790997950135
    ],
    [
     106.02500000000009,
     -34.21491432170387
    ]
   ],
   "elbowed": false,
   "lastCommittedPoint": null,
   "startBinding": {
    "elementId": "uwDHQTbx",
    "mode": "orbit",
    "fixedPoint": [
     0.9999,
     0.5001
    ]
   },
   "endBinding": {
    "elementId": "yq2XwGPt",
    "mode": "orbit",
    "fixedPoint": [
     0.0001,
     0.5001
    ]
   },
   "startArrowhead": null,
   "endArrowhead": null,
   "id": "ylJNmw7h",
   "type": "arrow",
   "x": 1051.835103819363,
   "y": 4645.274008879238,
   "width": 106.02500000000009,
   "height": 34.21491432170387,
   "angle": 0,
   "strokeColor": "#1396AA",
   "backgroundColor": "transparent",
   "fillStyle": "solid",
   "strokeWidth": 3.3,
   "strokeStyle": "solid",
   "roughness": 1,
   "opacity": 100,
   "roundness": {
    "type": 2
   },
   "seed": 89154,
   "version": 17,
   "versionNonce": 1954786232,
   "updated": 1772731748715,
   "isDeleted": false,
   "groupIds": [],
   "boundElements": [],
   "link": null,
   "locked": false,
   "frameId": null,
   "hasTextLink": false,
   "customData": {
    "isBranch": true
   },
   "index": "aF",
   "moveMidPointsWithElement": false
  },
  {
   "text": "📍2. “写对问题的 prompt”是什么意思",
   "fontSize": 20,
   "fontFamily": 5,
   "textAlign": "center",
   "verticalAlign": "middle",
   "id": "8VK3N060",
   "type": "text",
   "x": 1164.5101038193632,
   "y": 4671.993217881288,
   "width": 345.7808837890625,
   "height": 25,
   "angle": 0,
   "strokeColor": "#1396AA",
   "backgroundColor": "transparent",
   "fillStyle": "solid",
   "strokeWidth": 3.3,
   "strokeStyle": "solid",
   "roughness": 1,
   "opacity": 100,
   "roundness": null,
   "seed": 41829,
   "version": 14,
   "versionNonce": 1740324024,
   "updated": 1772731748715,
   "isDeleted": false,
   "groupIds": [],
   "boundElements": [
    {
     "id": "5REARpfJ",
     "type": "arrow"
    }
   ],
   "link": null,
   "locked": false,
   "frameId": null,
   "hasTextLink": true,
   "containerId": null,
   "originalText": "📍2. “写对问题的 prompt”是什么意思",
   "rawText": "[[写好提示词Prompt#2. “写对问题的 prompt”是什么意思|2. “写对问题的 prompt”是什么意思]]",
   "lineHeight": 1.25,
   "autoResize": true,
   "customData": {
    "mindmapOrder": 1
   },
   "index": "aG"
  },
  {
   "points": [
    [
     0,
     0
    ],
    [
     32.67500000000018,
     7.650076807304686
    ],
    [
     72.67500000000018,
     26.400076807304686
    ],
    [
     106.02500000000009,
     34.211814558344486
    ]
   ],
   "elbowed": false,
   "lastCommittedPoint": null,
   "startBinding": {
    "elementId": "uwDHQTbx",
    "mode": "orbit",
    "fixedPoint": [
     0.9999,
     0.5001
    ]
   },
   "endBinding": {
    "elementId": "8VK3N060",
    "mode": "orbit",
    "fixedPoint": [
     0.0001,
     0.5001
    ]
   },
   "startArrowhead": null,
   "endArrowhead": null,
   "id": "5REARpfJ",
   "type": "arrow",
   "x": 1051.835103819363,
   "y": 4648.718141073983,
   "width": 106.02500000000009,
   "height": 34.211814558344486,
   "angle": 0,
   "strokeColor": "#1396AA",
   "backgroundColor": "transparent",
   "fillStyle": "solid",
   "strokeWidth": 3.3,
   "strokeStyle": "solid",
   "roughness": 1,
   "opacity": 100,
   "roundness": {
    "type": 2
   },
   "seed": 47523,
   "version": 17,
   "versionNonce": 1871017144,
   "updated": 1772731748715,
   "isDeleted": false,
   "groupIds": [],
   "boundElements": [],
   "link": null,
   "locked": false,
   "frameId": null,
   "hasTextLink": false,
   "customData": {
    "isBranch": true
   },
   "index": "aH",
   "moveMidPointsWithElement": false
  },
  {
   "text": "📍1. “自己有经验”是什么意思",
   "fontSize": 16,
   "fontFamily": 5,
   "textAlign": "center",
   "verticalAlign": "middle",
   "id": "LLkAxws7",
   "type": "text",
   "x": 1604.917643187039,
   "y": 4596.993217881288,
   "width": 213.0247039794922,
   "height": 20,
   "angle": 0,
   "strokeColor": "#1396AA",
   "backgroundColor": "transparent",
   "fillStyle": "solid",
   "strokeWidth": 1.95,
   "strokeStyle": "solid",
   "roughness": 1,
   "opacity": 100,
   "roundness": null,
   "seed": 13301,
   "version": 6,
   "versionNonce": 1976697288,
   "updated": 1772731748715,
   "isDeleted": true,
   "groupIds": [],
   "boundElements": [],
   "link": null,
   "locked": false,
   "frameId": null,
   "hasTextLink": true,
   "containerId": null,
   "originalText": "📍1. “自己有经验”是什么意思",
   "rawText": "[[写好提示词Prompt#1. “自己有经验”是什么意思|1. “自己有经验”是什么意思]]",
   "lineHeight": 1.25,
   "autoResize": true,
   "customData": {
    "mindmapOrder": 1
   },
   "index": "aI"
  },
  {
   "points": [
    [
     0,
     0
    ],
    [
     0,
     0
    ]
   ],
   "elbowed": false,
   "lastCommittedPoint": null,
   "startBinding": {
    "elementId": "yq2XwGPt",
    "mode": "orbit",
    "fixedPoint": [
     0.5001,
     0.5001
    ]
   },
   "endBinding": {
    "elementId": "LLkAxws7",
    "mode": "orbit",
    "fixedPoint": [
     0.5001,
     0.5001
    ]
   },
   "startArrowhead": null,
   "endArrowhead": null,
   "id": "63BJpUVE",
   "type": "arrow",
   "x": 1297.6505609726835,
   "y": 4609.493217881288,
   "width": 0,
   "height": 0,
   "angle": 0,
   "strokeColor": "#1396AA",
   "backgroundColor": "transparent",
   "fillStyle": "solid",
   "strokeWidth": 1.95,
   "strokeStyle": "solid",
   "roughness": 1,
   "opacity": 100,
   "roundness": {
    "type": 2
   },
   "seed": 49998,
   "version": 8,
   "versionNonce": 161341112,
   "updated": 1772731748715,
   "isDeleted": true,
   "groupIds": [],
   "boundElements": [],
   "link": null,
   "locked": false,
   "frameId": null,
   "hasTextLink": false,
   "customData": {
    "isBranch": true
   },
   "index": "aJ",
   "moveMidPointsWithElement": false
  },
  {
   "text": "📍2. “写对问题的 prompt”是什么意思",
   "fontSize": 16,
   "fontFamily": 5,
   "textAlign": "center",
   "verticalAlign": "middle",
   "id": "EkC1RqV3",
   "type": "text",
   "x": 1636.7176386094022,
   "y": 4641.993217881288,
   "width": 276.6246643066406,
   "height": 20,
   "angle": 0,
   "strokeColor": "#1396AA",
   "backgroundColor": "transparent",
   "fillStyle": "solid",
   "strokeWidth": 1.95,
   "strokeStyle": "solid",
   "roughness": 1,
   "opacity": 100,
   "roundness": null,
   "seed": 70645,
   "version": 6,
   "versionNonce": 1321109704,
   "updated": 1772731748715,
   "isDeleted": true,
   "groupIds": [],
   "boundElements": [],
   "link": null,
   "locked": false,
   "frameId": null,
   "hasTextLink": true,
   "containerId": null,
   "originalText": "📍2. “写对问题的 prompt”是什么意思",
   "rawText": "[[写好提示词Prompt#2. “写对问题的 prompt”是什么意思|2. “写对问题的 prompt”是什么意思]]",
   "lineHeight": 1.25,
   "autoResize": true,
   "customData": {
    "mindmapOrder": 2
   },
   "index": "aK"
  },
  {
   "points": [
    [
     0,
     0
    ],
    [
     0,
     0
    ]
   ],
   "elbowed": false,
   "lastCommittedPoint": null,
   "startBinding": {
    "elementId": "yq2XwGPt",
    "mode": "orbit",
    "fixedPoint": [
     0.5001,
     0.5001
    ]
   },
   "endBinding": {
    "elementId": "EkC1RqV3",
    "mode": "orbit",
    "fixedPoint": [
     0.5001,
     0.5001
    ]
   },
   "startArrowhead": null,
   "endArrowhead": null,
   "id": "JqGqHhs1",
   "type": "arrow",
   "x": 1297.6505609726835,
   "y": 4609.493217881288,
   "width": 0,
   "height": 0,
   "angle": 0,
   "strokeColor": "#1396AA",
   "backgroundColor": "transparent",
   "fillStyle": "solid",
   "strokeWidth": 1.95,
   "strokeStyle": "solid",
   "roughness": 1,
   "opacity": 100,
   "roundness": {
    "type": 2
   },
   "seed": 37753,
   "version": 8,
   "versionNonce": 1759594424,
   "updated": 1772731748715,
   "isDeleted": true,
   "groupIds": [],
   "boundElements": [],
   "link": null,
   "locked": false,
   "frameId": null,
   "hasTextLink": false,
   "customData": {
    "isBranch": true
   },
   "index": "aL",
   "moveMidPointsWithElement": false
  }
 ],
 "appState": {
  "theme": "light",
  "viewBackgroundColor": "#ffffff",
  "currentItemStrokeColor": "#1e1e1e",
  "currentItemBackgroundColor": "#ffc9c9",
  "currentItemFillStyle": "hachure",
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
  "scrollX": -158.85081179745987,
  "scrollY": -3920.432919914059,
  "zoom": {
   "value": 0.959677
  },
  "currentItemRoundness": "sharp",
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
