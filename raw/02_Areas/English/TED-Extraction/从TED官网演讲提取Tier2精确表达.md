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
source: https://www.ted.com/talks
---

## 重新定义三级体系

|级别|名称|特征|雅思作用|
|---|---|---|---|
|**Tier 1**|基础表达|简单词汇、常见句式|能表意，不加分|
|**Tier 2**|高级通用表达|精准、地道、有语感的非专业表达|**快速拉开分差**|
|**Tier 3**|专业术语|学科专属词汇|加分但风险高，用错扣分|

Tier 2 的核心价值：**考官熟悉、考生少用、语感地道**——这正是 TED 演讲的富矿区。

---

## 重新设计提示词

```
You are an IELTS language coach analyzing TED Talk transcripts.

Your goal: extract TIER 2 expressions — sophisticated but non-technical 
vocabulary and phrases that would significantly boost an IELTS 
Writing/Speaking score.

## TIER 2 Definition
Tier 2 expressions are:
- High-frequency in educated discourse, NOT subject-specific
- Precise substitutes for overused basic words
- Natural-sounding to native speakers
- Transferable across multiple essay/speaking topics

## TIER 2 Extraction Criteria

✓ INCLUDE if the expression:
- Replaces a bland Tier 1 equivalent (see mapping below)
- Works in at least 2 different IELTS topic areas
- Sounds natural in both formal writing AND spoken discourse
- Represents a collocation, not just a single word

✗ EXCLUDE if the expression:
- Is a technical/academic term (Tier 3): e.g., "neuroplasticity", 
  "GDP", "photosynthesis"
- Is a basic word any B1 learner would know (Tier 1)
- Is too idiomatic / informal for IELTS register
- Only fits one very specific context

## Tier Mapping Examples (for calibration)
Tier 1 → Tier 2
"important" → "consequential / pivotal / far-reaching"
"show" → "illuminate / reveal / underscore"
"problem" → "challenge / impediment / friction"
"because" → "stemming from / driven by / rooted in"
"change" → "reshape / reframe / transform"
"think about" → "grapple with / interrogate / unpack"

## Output Format
For each Tier 2 expression found:

**Expression**: [exact quote from transcript]
**Tier 1 equivalent**: [what a basic learner would say instead]
**Transferable topics**: [2–3 IELTS topics where this works]
**Example sentence**: [one new sentence using it in IELTS context]
**Register**: Written / Spoken / Both

## Constraints
- Extract 15–25 Tier 2 expressions per transcript
- Prioritize COLLOCATIONS over single words
- Flag any expression that borders Tier 3 with ⚠️
- Do NOT extract full sentences — focus on 
  phrases of 2–6 words

Transcript:
[PASTE HERE]
```

---

## 补充：Tier 2 的四个子类型

提示词中可进一步细化，让提取更有针对性：

|子类型|说明|示例|
|---|---|---|
|**精准动词短语**|替换弱动词|_grapple with_ 替换 _deal with_|
|**因果连接词**|替换 because/so|_stemming from / giving rise to_|
|**修饰性副词短语**|替换 very/really|_to a considerable extent / markedly_|
|**议论文框架词**|搭建论点结构|_the crux of the matter / a compelling case for_|

---

## 一个关键约束

```
REGISTER FILTER — mandatory check:
Before including any expression, ask:
"Would this sound natural if a student said it in IELTS Speaking Part 3?"
AND
"Would this fit in an IELTS Task 2 body paragraph?"

If YES to both → Tier 2, include
If YES to only one → note the register restriction
If NO to both → likely Tier 3, exclude or flag ⚠️
```

---

要我用之前那五条深化后的观点，跑一遍这套提示词，演示实际的 Tier 2 提取结果吗？

先按你当前时间点附近这一段（大约 06:4x–10:0x）提取 **substantial / tier 2** 级表达，可直接当雅思高分词组用。​

## 一、含 substantial 意味（“内容扎实 / 影响可观 / 变化巨大”）

这一段没出现单词 substantial，但有不少语义上等价、可以在作文中替换 substantial 的表达：​

- powerful content 强有力的内容。
- dynamic and vibrant content 动态、有活力的内容。
- a lot all at once 信息量一下子很多。
- exponential advancements of technology 技术的指数级进步。
- that whole arc has been completely upended 整个轨迹被彻底颠覆。
- a ton of people falling through the cracks 大量人被甩在后面 / 被遗漏。

## 二、典型 tier 2 词汇与短语（当前时间段）

从 06:44 开始往后几分钟里，比基础词更抽象、跨学科、适合雅思高分的 tier 2 表达有：​

- abbreviated but powerful content 精简但有力量的内容。
- dynamic and vibrant 生动而有活力的。
- compact / compressed 紧凑、压缩（形容信息密度大）。
- lengthen our attention span 延长我们的注意力跨度。
- narcissism rates are going up 自恋程度在上升。
- empathy rates are declining 共情能力在下降。
- better practice empathy 更好地练习共情。
- the rise of social media and the proliferation of digital platforms 社交媒体的兴起与数字平台的激增。
- inhabit the life of someone else 设身处地体验他人的生活。
- algorithms create echo chambers 算法制造“回音室”。
- get another perspective 获得另一种视角。
- a jumping‑off point (for discussion) 跳板 / 起点。
- poke a needle in that bubble 戳破泡泡（打破信息茧房）。
- put things in perspective 让人从更全面的视角看问题。
- the future of work 未来工作图景。
- a totally different career landscape 完全不同的职业版图。
- exponential advancements of technology 技术的指数级发展。
- a learn‑earn, learn‑earn cycle 学习–赚钱循环。
- continuously learning 持续学习。
- infrastructure and architecture (to support learning) 支撑学习的基础设施与架构。
- lifelong education 终身教育。
- people falling through the cracks 被系统遗漏/忽视的人。
- have a mindset shift 心态转变。
- constraints forcing you to grow 逼迫你成长的限制条件。
- the onus is on us 责任落在我们身上。
- regional, better‑functioning learning ecosystems 区域性的、更高效的学习生态系统。
- nascent (systems) 初期的 / 萌芽中的。
- surface and articulate our skills 挖掘并清晰表达自己的技能。
- translate them into the language of the job market 把技能翻译成劳动力市场的语言。
- multiple pivots in our lives 多次职业/人生转向。
- fortune, luck, your network 运气、人脉等因素。
- social networks, professional networks 社交网络、职业网络。
- the burden is on us 负担在我们身上。
- hidden skills we bring to the table 我们带到桌面上的隐性技能。
- make that understandable to a prospective employer 让潜在雇主听得明白。

从 11:51 之后这一段，我按「听 / 说 / 读 / 写」和 tier2（含 substantial 含义）给你分好类，方便你对照使用。

***

## 一、听（听力里要秒反应的表达）

- enter the workforce 进入劳动力市场。
- bring to the table 带到台面上的（能力/资源）。
- not my first choice 不是我首选。
- search for that higher, lofty calling 寻找更高远的使命感。
- work with purpose 带着目标/意义去工作。
- fixate on technical, hard skills 过度聚焦于技术硬技能。
- turbulent work life 动荡的职业生涯。
- get sophisticated at our human skills 在人类技能上变得更老练/高级。
- critical thinking, systems thinking 批判性思维、系统性思维。
- emotional intelligence, empathy 情绪智力、同理心。

***

## 二、说（口语里很好用的表达）

- work with purpose, even when work doesn’t feel purposeful 即使工作本身没啥意义，也可以带着目的去做。
- it’s not an either‑or; it’s a both‑and 不是二选一，而是两者都要。
- human skills require deep practice 人类软技能需要深入练习。
- I just tried to be a sponge 我只是努力当块海绵（疯狂吸收）。
- if we do something more than three times, can we create a doc, almost as a checklist? 做某事超过三次，就该做个清单文档。
- that’s kind of the midpoint of the journey 这算是旅程的中点阶段。
- I don’t know what that’s called, maybe reverse imposter syndrome 我不知道这怎么叫，可能是反向冒名顶替综合征。
- it just rests on us more, that burden is on us 责任更多地落在我们身上。

***

## 三、读（阅读 / 学术感强的 tier2 表达）

- average tenure in a role 职位的平均任职时长。
- transferable skill sets 可迁移技能组合。
- falls flat 效果平平 / 毫无火花（内容）。
- spiral of trying to sustain that (attention/traffic) 为维持热度而陷入螺旋。
- commentary on what’s more popular… 一种关于“什么更受欢迎”的评论/隐喻。
- make it feel visceral and emotional 让它变得直观、有情绪张力。
- bring it to a human perspective 把问题拉回到人的视角。
- exponential advancements of technology 技术的指数级进步。
- people falling through the cracks 被系统遗落的人群。
- regional, better‑functioning learning ecosystems 区域性、运作更良好的学习生态系统。
- slow‑going and nascent 缓慢且处于萌芽阶段。
- translate skills into the language of the job market 把技能翻译成劳动力市场听得懂的语言。
- multiple pivots in our lives 人生中的多次转向。
- social / professional networks 社交/职业网络。
- hidden skills we bring to the table 我们带到台面上的隐性技能。

这些都非常雅思阅读/Task 2 风格，语义抽象、可跨话题迁移。

***

## 四、写（写作里特别“substantial”的表达）

更适合写作、体现“观点扎实 / 变化巨大 / 责任重大”的词组：

- more turbulent work life 更加动荡的职业生涯。
- longer, more turbulent work life 更长且更动荡的职业生命周期。
- exponential advancements of technology 技术的指数级演进（= massive / substantial change）。
- that whole arc has been completely upended 整个传统路径被彻底颠覆。
- we have a ton of people falling through the cracks 许多人被体制实质性地遗漏/抛下。
- we don’t have the infrastructure and architecture to facilitate seamless education throughout life 缺乏支撑终身顺畅教育的制度和结构。
- we have to have a real mindset shift 必须在观念层面发生真正改变
- constraints forcing you to grow 逼迫你成长的限制条件。
- the onus / burden is on us 责任/压力实质性地落在个人身上。
- human skills require deep practice 人类软技能需要长期、深入的训练。

***

从大约 10:07–14:15 这一段里，适合雅思高分的 tier 2 表达可以按你之前的格式列成：​​

- a feeling of exceptionalism 一种“自我例外”的感觉。​
- we’re at a discontinuity 我们正处在一个（历史）不连续点上。​
- a new world with no precedent 一个前所未有的新世界。​
- a super assistant or an apex predator 超级助手还是顶级掠食者。​
- all change and disruption brings with it a painful transition 一切变革与冲击都会带来痛苦的过渡期。​
- tens of thousands of years of human history 几万年的人类历史。​
- one undeniable trend 一个不可否认的趋势。​
- a singularity, an intelligence explosion 奇点、智能爆炸。​
- a curve of rapidly accelerating job creation 就业创造快速加速的曲线。​
- a “job singularity” 就业奇点。​
- a Cambrian explosion of new job families 新职业门类的“寒武纪大爆发”。​
- across every imaginable field 蔓延到所有可以想象的领域。​
- gives them a world‑class staff 赋予他们一个世界级的“员工团队”。​
- a flurry of new entrepreneurial activity 大量涌现的新创业活动。​
- micro‑corporations, solo institutions and single‑person unicorns 微型公司、个人机构和“一人独角兽”。​
- not very far from (becoming reality) 距离成为现实已经不远。​
- a defining feature 一个决定性特征。​
- won’t look like real work 看起来不像“真正的工作”。​
- would have looked like leisure (to our predecessors) 在我们的前人看来更像是休闲。​
- the predictions around “technological unemployment” 关于“技术性失业”的各种预测。​
- a potential job doom‑and‑gloom scenario 潜在的就业末日 / 极度悲观情景。​
- being hyper vigilant about threats to our survival 对生存威胁高度警惕。​
- a key part of our survival mechanism 我们生存机制中的关键一环。​
- a key part of evolution, what makes us human 也是进化与“人之所以为人”的关键部分。​
- future‑proofed jobs 抗未来冲击的工作 / 不易被淘汰的工作。​
- take predictions about future job disruption seriously 严肃看待关于未来岗位动荡的预测。​
- something you feel very passionately about 你真正充满热情的事情。​

从这整场演讲里，适合雅思高分、比基础词更抽象和跨学科的 tier 2 表达可以整理成下面这些：​[[ted](https://www.ted.com/talks/akram_awad_will_ai_make_humans_useless)]​

- an unfolding reality 正在展开的现实。
- a purpose crisis 目的感危机。
- shape national AI agendas 规划国家层面的 AI 议程。
- build digital economies 构建数字经济。
- design cities of the future 设计未来之城。
- the elephant in the room 显而易见却被回避的问题。
- redesign the very systems that have been sustaining our communities 重塑支撑社会运行的根本制度。
- tie our identity and our worth to what we do 把身份认同和价值感与所做的工作绑定。
- the organizing and defining principle of our society 组织并定义社会的核心原则。
- industrialize identity 工业化“身份认同”。
- AI is dismantling, fully, that model AI 正在彻底拆解这种模式。
- AI is automating tasks across the board AI 正在全方位自动化各类任务。
- a great depression of identity 身份层面的“大萧条”。
- a framework for human roles in the age of AI 一个关于 AI 时代人类角色的框架。
- the guardians, the adapters, and the pioneers 守护者、适应者与先锋者。
- driven by our survival as a humanity 以人类生存为驱动力。
- heavily redefined and reshaped by AI 被 AI 大幅重塑与再定义。
- a human validator 人类验证者。
- ethically sound and human‑relevant 在伦理上站得住脚并与人类密切相关。
- driven by curiosity rather than survival 由好奇心而非生存需求驱动。
- an old passion for astronomy and stargazing 对天文与观星的旧日热情。
- AI‑powered upskilling tools 由 AI 赋能的技能提升工具。
- a cosmic systems architect 宇宙系统架构师。
- simulate the cosmos 模拟宇宙。
- sandwiched between the two 夹在两者之间。
- the most overlooked circle 最容易被忽视的一圈 / 群体。
- measured by how they live, how they connect, and how they create meaning 以生活方式、连接方式和创造意义的方式来衡量。
- community‑based creativity 以社区为基础的创造力实践。
- deeply contributes to her community 深度地为社区作出贡献。
- a new class system 新的阶层体系。
- not based on wealth or status 不是建立在财富或地位之上。
- the elites of the future 未来的精英群体。
- legacy, not money, becomes the currency of aspiration 传承而非金钱会成为人们追求的“货币”。
- these circles are likely to be fluid 这些圈层很可能是流动的。
- as AI continues to reshape work 随着 AI 持续重塑工作。
- expand in their meaning or value 在意义或价值上不断扩展。
- recognition becomes the new status symbol 认可将成为新的身份象征。
- rethink how we compensate contribution 重新思考我们如何对“贡献”进行补偿。
- design new systems that can bring value and security beyond the paychecks 设计能在工资之外提供价值与安全感的新制度。
- guaranteed access to the minimum level of resources 保证获得最低水平资源的权利。
- live with dignity 有尊严地生活。
- small, meaningful acts of contribution 细小却有意义的贡献行为。
- rewire education not only for skills, but also for character 重新布线教育，使其不只针对技能也塑造品格。
- emotional infrastructure 情感基础设施。
- rediscover who they really are 重新发现真实的自我。
- pilot new ways for contribution, for recognition and for belonging 试点新的贡献、认可与归属方式。
- the heartbeat of the society 社会的心跳。
- a simple loop of work, earn, accumulate and spend 工作–赚钱–积累–消费的简单循环。
- that loop breaks 这条循环被打破。
- revisit and reimagine 重新审视并重新想象。
- a cultural reset 文化层面的重置。
- their worth will only be measured by their output 价值只由产出衡量。
- work is no longer the center of identity 工作不再是身份认同的中心。
- testing our technology and testing our imagination 同时考验我们的技术与想象力。
- rediscover purpose, redefine value, reclaim the very essence of what it means to be human 重新发现目的、重定义价值、重新夺回身为人类的本质。

从这场演讲里整体看，适合雅思高分、比基础词更抽象和跨学科的 tier 2 表达可以先给你一批通用的（你如果需要我再按时间段细分）：[[ted](https://www.ted.com/talks/llion_jones_how_competition_is_stifling_ai_breakthroughs?subtitle=en)]​

- state‑of‑the‑art artificial intelligence 最先进的人工智能。
- an organic, bottom‑up kind of project 自下而上的有机项目形态。
- a narrowing of the research 研究范围的收窄。
- an overcrowded industry 过度拥挤的行业。
- low‑hanging fruit 触手可及的“低垂果实”（容易但价值有限的成果）。
- this pressure damages the science 这种压力正在损害科学本身。
- reduces the amount of creativity 减少了创造力。
- the exploration–exploitation trade‑off 探索–利用权衡。
- alternative solutions 备选解决方案。
- a longer conceptual leap 更长远的概念飞跃。
- open‑ended, much more speculative research 开放式、带有更多探索性的研究。
- hedge your bets against missing out on the next big thing 对冲错过下一个“大事件”的风险。
- nature‑inspired (research) 受自然启发的研究。
- current state‑of‑the‑art AI 当前最前沿的 AI。
- you should only do research that wouldn’t happen if you weren’t working on it 只做“没有你就不会发生”的研究。
- stepping on each other’s toes 互相踩脚（互相抢题 / 冲突）。
- a hunger for new and differentiated research 对新的、差异化研究的渴望。
- do the science properly 以严谨的方式做科学研究。
- I’m putting my money where my mouth is 用实际行动兑现自己的观点。
- an environment with high autonomy 具有高度自主性的环境。
- feel empowered to try their more speculative ideas 感到有权尝试更具探索性的想法。
- an advantage that the company has 公司拥有的优势。
- the current technology is so powerful and flexible 当前技术如此强大而灵活。
- we can afford to do a lot more 我们有本钱做得更多。
- explicitly exploring and looking for the next thing 明确地去探索并寻找下一代突破。
- are we bold enough? 我们是否足够大胆？
- create these kinds of environments 创造这样的环境。
- the next breakthrough is going to come from… 下一次突破将会来自……。
- this is not a competition; we all have the same goal 这并不是一场竞争；我们有共同目标。
- turn up the explore dial 调高“探索”的刻度。
- openly share what we find 公开分享我们的发现。

下面这批 Tier 2 表达都来自这场 TED 演讲 “3 possible futures for AI — which will we choose?”（Alvin W. Graylin & Manoush Zomorodi）。[[ted](https://www.ted.com/talks/alvin_w_graylin_manoush_zomorodi_3_possible_futures_for_ai_which_will_we_choose?subtitle=en)]​

## 抽象/宏观类表达

- we are really at this inflection point
我们确实处在一个关键转折点上。

- one of the biggest questions that we have as a society
当今整个社会面临的最大疑问之一。

- we are essentially at a fork in the road between three possible futures
本质上我们站在三种未来路径的十字路口。

- three possible paths for the future of AI
人工智能未来发展的三种可能路径。

- decide which path we want to go down
决定我们要走哪一条路。

- the forces that are driving it
推动这一切发展的各种力量。

- the narrative we’ve all been told
我们被不断灌输的那套叙事。

- one of the biggest myths out there
流传最广的谬论之一。

- this moment of inflection and actually pivot in a good way
利用这个关键拐点，把方向真正扭转到更好的道路上。

- move from today’s trajectory into something better
从目前的发展轨迹转向更理想的路径。

---

## 不平等 / 资本 / 战争相关表达

- a class of trillionaires and everybody else
一小撮“万亿富豪”和其他所有人之间的阶层分化。

- tech giants create a class of trillionaires
科技巨头造就出万亿级富豪阶层。

- an overcrowded industry
过度拥挤的行业。

- intensify the conflict between countries
加剧国家之间的冲突。

- going from AI race to AI war to kinetic war
从人工智能竞赛升级到人工智能战争，甚至发展为实体战争。

- see that as “inevitable”
认为那是“不可避免”的。

- the military‑industrial complex
军工复合体（军事与工业利益联盟）。

- you have to create an enemy to get funding and deregulation
通过制造“敌人”来争取资金和放松监管。

- not to save the world, but to create trillions of dollars
目的不是拯救世界，而是创造数万亿美元的利润。

---

## 公共福祉 / 理想未来表达

- the Star Trek option
“星际迷航”式的理想未来选项。

- technology is being used and shared for the common good
技术被用于并共享给全人类的公共福祉。

- saves us from ourselves
把我们从自我毁灭的道路上拯救回来。

- a century or millennia of discovery
一个世纪甚至数千年的持续探索时代。

- competing over resources
为争夺资源而互相竞争。

- a single lab that aggregates all of the talent around the world
一个汇聚全球顶尖人才的联合实验室。

- rather than hoarding it for one company or one country
而不是由某个公司或国家囤积垄断。

- the whole idea of open science
“开放科学”的核心理念。

- the world is not zero‑sum
这个世界并不是零和博弈。

- working together is enlightened self‑interest
合作是一种“开明的自利”。

- raise everybody up
让所有人都共同提升。

- use it for humanity’s good, not for one country’s good
将其用于整个人类的福祉，而非某个国家的私利。

---

## 数据 / 偏见 / 表征相关表达

- there’s a lot of misinformation
虚假/误导性信息非常多。

- what research is showing is that…
研究结果表明……。

- the less data you give, the more biased these AI become
提供的数据越少，这些 AI 的偏见反而越严重。

- all of our history, all of our languages are represented
我们全部的历史与语言都得到体现。

- find a way to balance everybody’s needs
寻找一种平衡各方需求的方式。

---

## 就业 / 冲击 / 社会结构表达

- replace the average worker
取代普通劳动者。

- people who are going to be displaced by it
将因此而被取代/失业的人群。

- a giant employment shock to the world
对全球就业造成巨大冲击。

- the displacements that we are seeing
正在出现的大规模岗位流失。

- hundreds of millions of people affected
数以亿计的人会受到影响。

- what’s needed for people to have secure lives
让人们过上有安全感生活所必需的条件。

- created the American middle class
造就了美国的中产阶级。

- our society is not equipped to move at that speed
我们的社会尚未具备以那种速度变革的能力。

---

## 态度 / 行动 / 责任表达

- by the end of this, it will convince you to take action
希望在结束时能促使你采取行动。

- sounds simple but is very hard to execute
听上去简单，但执行起来极其困难。

- that’s a lot to take in
信息量非常大，一时难以消化。

- start to change your mindset
首先要改变思维模式。

- you have a responsibility as business owners
作为企业主，你肩负着责任。

- integrate AI not to replace people but to make things more efficient
引入 AI 不是为了取代员工，而是提高效率。

- reduce the shock of what this technology is going to do to our society
减缓这项技术对社会造成的冲击。

- the reality is, the more you use it, the more you understand how powerful they are
事实是你用得越多，就越能体会到它的强大。

下面是上一轮提取的 substantial verbs 型关键表达，每一项后面都加上对应中文翻译，方便你做双语卡片。[[ted](https://www.ted.com/talks/alvin_w_graylin_manoush_zomorodi_3_possible_futures_for_ai_which_will_we_choose?subtitle=en)]​

---

## 1. 定义现状 / 问题动因类

- see three possible paths for the future of AI
看到人工智能未来发展的三种可能路径

- feel ambivalent about AI
对人工智能抱有矛盾复杂的情绪

- cut through the hype to clarify what is really happening
划破噱头泡沫，澄清真实发生的事情

- transform our existence
改变我们的生存状态 / 人类的存在方式

- ask where we are right now
追问我们当下所处的位置

- face one of the biggest questions that we have as a society
面对当今社会最大的核心问题之一

- spread a lot of misinformation
大量传播错误/误导性信息

- head towards a Mad Max future
正朝着“疯狂麦克斯式”的反乌托邦未来驶去

- intensify the conflict between countries
加剧国家之间的冲突

- go from AI race to AI war to kinetic war
从人工智能竞赛升级到人工智能战争，最终演变为实体战争

---

## 2. 权力、资本与叙事的动作

- take control of the government by growing their power and resources
通过扩张权力和资源来控制政府

- create a class of trillionaires and everybody else
塑造出一小撮万亿富豪与其他所有人之间的阶层鸿沟

- use the same tools that the military‑industrial complex has used
使用军工复合体一贯采用的同一套手段

- create an enemy to get funding and deregulation
制造敌人以争取资金和放松监管

- move faster and make money
动作更快以赚取更多金钱

- try to create billions, actually trillions of dollars
试图创造数十亿、甚至数万亿美元的收益

- define AGI as a technology that can replace the average worker
将 AGI 定义为可以取代普通劳动者的技术

- take everybody’s jobs
抢走所有人的工作岗位

- protect the people who are going to be displaced
保护那些即将被取代的人群

---

## 3. 选择路径 / 设计未来的动作

- be at a fork in the road between three possible futures
站在通往三种不同未来的十字路口

- choose which path we want to go down
选择我们想要走的那条路

- save us from ourselves
把我们从自我毁灭的道路上拯救出来

- bring on a century or millennia of discovery
开启一个长达数百年乃至数千年的发现时代

- move from today’s trajectory into something better
从当下的发展轨迹转向更理想的方向

- pivot in a good way
在关键节点上朝着更好的方向转向

- decide what we need to do going forward
决定接下来我们需要采取的行动

- execute a three‑part plan
落实并执行一个三部分构成的计划

---

## 4. 集体协作、开放科学相关动作

- compete over resources
为有限的资源展开竞争

- duplicate the same work in hundreds of labs
在数百个实验室中重复做同样的研究

- come together and create the “CERN of AI”
集结在一起建立“人工智能领域的 CERN”

- aggregate all of the talent around the world
汇聚全球所有顶尖人才

- hoard it for one company or one country
为某个公司或某个国家囤积并垄断这些资源

- share it with the world
将之分享给全世界

- put together everybody’s data from around the world
汇集全球各地人们的数据

- create “sovereign AI” that represents your country or culture
打造能够代表你国家或文化的“主权 AI”

- make sure all of our history, languages and cultures are represented
确保我们的所有历史、语言与文化都得到体现

- find a way to balance everybody’s needs
找到平衡各方需求的途径

---

## 5. 思维方式 / 价值判断类动作

- see China as an inevitable rival
把中国视作不可避免的竞争对手

- believe that war is inevitable
相信战争是不可避免的

- understand that the world is not zero‑sum
理解世界并非零和博弈

- work together as enlightened self‑interest
以“开明的自利”心态开展合作

- raise everybody up
让所有人整体受益、共同提高

- remove reasons to have conflict
消除发生冲突的理由

- choose to use AI for humanity’s good, not for one country’s good
选择将 AI 用于整个人类的福祉，而非某一国的私利

---

## 6. 就业冲击与政策应对类动作

- create a giant employment shock to the world
给全球就业带来巨大冲击

- give free education and zero‑interest loans
提供免费教育和零利率贷款

- help people buy homes so they have secure lives
帮助民众买房从而获得更稳定的生活

- create the American middle class and an economic boom
由此催生美国中产阶级并引发经济繁荣

- displace up to hundreds of millions of people
使多达数亿人被挤出原有岗位

- take care of them (those who are affected)
妥善安置、照顾受影响的人群

- fail to do so and make the world a bad place to live in
若未做到这一点，将让世界变得难以居住

---

## 7. 针对个体与企业的行动号召

- convince you to take action
说服你采取行动

- change your mindset
改变你的思维方式

- see how your company integrates AI
审视你的公司如何整合使用 AI

- use AI not to replace people but to make things more efficient
使用 AI 不是为了取代人，而是为了提升效率

- lay off 30 percent of your staff
裁掉 30% 的员工

- give people four‑day workweeks or reskill them
给员工四天工作制，或帮助他们重塑技能

- reduce the shock of what this technology is going to do to our society
降低这项技术对社会即将造成的冲击

---

## 8. 使用与理解技术的动作

- play with the models and see what they’re like
亲自体验这些模型，感受它们的表现

- hear people say it will never replace humans
听到许多人声称它永远不会取代人类

- use these models and understand how powerful they are
使用这些模型并意识到它们的强大

- see how quickly they are changing every day
看到它们每天变化之快

- fail to use it and fail to understand it
不去使用它，也就无法真正理解它

下面是刚才从《How to stop AI from killing your critical thinking》里提取的 substantial verbs / verb-phrases，每条都配上对应中文翻译，方便你做双语卡片或语义骨架标注。[[ted](https://www.ted.com/talks/advait_sarkar_how_to_stop_ai_from_killing_your_critical_thinking)]​

---

## 1. 描述当下使用方式 / 问题图景

- use AI as an assistant
    把人工智能当作助手来使用

- use AI as a tool for thought
    把人工智能当作思考工具来用

- set the scene
    设定情境 / 展开场景

- look at a day in the life of a knowledge worker
    审视一位知识工作者的一天

- summarize it
    对其进行总结

- get AI to write a response
    让人工智能代写回应

- drop in some resources and get an AI draft
    丢几份资料进去，让 AI 生成一份草稿

- become a professional validator of a robot’s opinions
    变成一个专门给机器人观点盖章的“职业验证员”

- get AI to analyze this data for me
    让人工智能替我分析这些数据

- make a deck
    做一份演示文稿 / 幻灯片

- vibe code something
    凭感觉敲点代码出来

- go (this all looks good, let’s go)
    觉得“看起来都不错，那就上吧”

- welcome to the age of outsourced reason
    欢迎来到“外包理性”的时代

- no longer engage with the materials of their craft
    不再亲自深入接触自己专业领域的原始材料

- become intellectual tourists
    变成只在知识表面打卡的“思想游客”

- visit ideas / not inhabit them
    只是匆匆浏览想法，而不是真正住进这些想法里

- have our relationship to our work intermediated by AI
    让我们与自身工作的关系被人工智能所介入和中介

- use AI in this way
    以这种方式使用人工智能

- have profound implications on human thought
    对人类思维产生深远影响

---

## 2. 对思维各维度的影响（creativity / critical thinking / memory / metacognition）

- give us rapid access to new ideas
    让我们能迅速接触到新观点

- produce a smaller range of ideas
    产出更狭窄、更加同质化的想法范围

- create a hive mind
    造就一种“蜂群思维”

- keep suggesting the same five ideas
    一直在重复给出同样那几种建议

- put less effort into critical thinking
    在批判性思考上投入更少努力

- work with AI vs work manually
    借助人工智能工作，而不是亲自手动完成

- have greater confidence in AI / have less confidence in themselves
    更相信人工智能，而更不信任自己

- rely on AI to write for them
    依赖人工智能替他们写作

- remember less of what they wrote
    对自己写过的内容记得更少

- read AI‑generated summaries
    阅读由人工智能生成的摘要

- remember less than if they’d read the document
    比起亲自读原文，记住的内容更少

- think about your own thinking process
    反思你的思考过程本身

- require significant metacognitive reasoning
    需要大量的元认知推理

- decompose the task
    将任务拆解成多个步骤

- evaluate the output
    对产出结果进行评估

- build metacognition into the process of working directly with the material
    在直接处理材料的过程中嵌入元认知

- become problematic when material engagement becomes intermediated
    一旦对材料的接触被中介化，就会变得成问题

- become middle managers for our own thoughts
    变成自己思想的“中层管理者”

---

## 3. 总结后果 / 提出警示

- have fewer ideas
    拥有的想法更少

- think about them less critically
    对这些想法的批判性思考更少

- remember them less well
    对它们的记忆更模糊

- have a harder time doing it
    在真正需要独立完成时会更加吃力

- see that AI‑assisted workflows can have profound effects on human thinking
    认识到 AI 辅助的工作流程会深刻影响人类思维

- exercise our creativity / critical thinking / memory
    锻炼我们的创造力、批判性思维和记忆力

- protect our cognitive musculature
    保护我们的“认知肌肉”

- rise to the occasion when an exceptionally complex task comes our way
    在遇到特别复杂的任务时能够挺身而出

- show that when we don’t use our brains, they get worse at brain things
    表明当我们不用大脑时，大脑就更不擅长“动脑的事”

- solve the problem of having to think
    试图“解决掉必须思考”这个问题

- invent a cure for exercise
    相当于发明一种“让人不用运动的健身药”

---

## 4. 价值立场与目标转换（工具观 / 设计原则）

- believe that AI should be a tool for thought
    认为人工智能应当是一种“帮助思考的工具”

- let AI challenge, not obey
    让人工智能去挑战你，而不是一味服从你

- be at a critical juncture
    处在一个关键路口

- be poised to be transformed by generative AI
    正处在被生成式 AI 深刻改变的边缘

- act now to shape and drive that transformation
    现在就行动起来塑造并推动这种转变

- drive it towards humanistic values
    把它引导向更人文的价值取向

- take the road less traveled
    走一条较少人选择的道路

- help us better understand the job
    帮助我们更好地理解这项工作本身

- help us get it done better
    帮助我们把工作做得更好

- help us ask the right questions
    帮助我们提出正确的问题

- help us explore the unknown
    帮助我们探索未知领域

---

## 5. 工具原型中的关键动作（人–机协作流程）

- load documents into her workspace
    把文档加载到她的工作空间中

- see an overview of the document
    查看整篇文档的概览

- see section‑by‑section summaries
    查看每一部分的分段摘要

- use lenses / emphasize what is most relevant
    使用“视角滤镜”以突出最相关内容

- select the consumer’s lens
    选择“消费者视角”的滤镜

- select a section for deeper reading
    选取某一部分进行更深入阅读

- make notes about her thoughts
    记录她自己的思考笔记

- highlight excerpts from the document
    高亮标注文档中的片段

- see AI‑generated commentary and critiques
    查看 AI 生成的评论和批判意见

- raise a potential opportunity
    提出一个潜在机会点

- highlight and annotate it
    对此高亮并加注释

- build up an outline of her argument manually
    手动搭建她论证的提纲

- sketch out the flow of her argument
    勾勒出论证展开的逻辑流程

- retain deep connections and grounding in the source documents
    保持与原始文档之间深层次的联系和支撑

- generate a draft of the proposal
    生成这份提案的草稿

- add a heading to the outline to generate a paragraph
    在提纲中添加一个小标题来生成对应段落

- have a different relationship to this text
    与这篇文本建立一种不同的关系

- root the text in a cognitively effortful thought process
    让文本扎根于一个付出认知努力的思考过程

- reflect Clara’s decisions, judgments, expertise
    体现出 Clara 自身的决策、判断与专业能力

- see another provocation
    看到另一条“挑 provocations”的提示

- decide not to address it
    决定不去处理它

- stimulate your thinking about your work
    激发你对自身工作的思考

---

## 6. 对写作/编辑过程的新操作方式

- resize a paragraph to change its length
    调整段落大小来改变其长度

- rapidly test different versions of this text
    快速试验这段文本的不同版本

- take a more inspirational or more practical tone
    采用更鼓舞人心或更务实的语气

- preview a few alternatives and select one
    预览几种替代版本并选择其中一个

- write at select strategic points
    在特定关键节点进行写作

- see provocations that raise alternatives
    看到提出备选方案的“挑衅性”提示

- identify fallacies
    识别论证中的谬误

- offer counterarguments
    提出反驳论点

- strengthen and develop her own argument
    强化并拓展她自己的论证

---

## 7. 强调“工具为计算机，不是聊天对象”的动作

- not find a chat box anywhere
    在界面上完全找不到聊天框

- not have to chat with anything to do her work
    不需要和任何东西聊天就能完成工作

- be silently and appropriately assisted
    在“静默且恰当”的前提下获得辅助

- assist her as a computer and not as an ersatz human
    以一台计算机而不是“假人类”的身份来协助她

- go from this … to this
    从这样一种工作方式切换到另一种方式

---

## 8. 评估这类工具的效果

- maintain direct material engagement at strategic points
    在关键节点保持对材料的直接接触

- construct her decisions on her argument herself
    由她自己构建对论证的决策

- be said to have written this document herself
    可以说这份文档是她亲自写的

- keep her metacognitively engaged
    让她在元认知层面持续投入

- always look for critiques, alternatives and lateral moves
    总是在寻找批评意见、替代方案和侧向思路

- study the effects of tools like this
    研究这种工具所带来的影响

- reintroduce critical thinking into AI‑assisted workflows
    将批判性思维重新引入 AI 辅助的工作流

- reverse the loss of creativity and enhance it
    扭转创造力的流失并加以增强

- build powerful tools for memory
    构建强大的“记忆辅助工具”

- enable knowledge workers to read and write at speed
    使知识工作者可以高速阅读和写作

- apply speed and flexibility of this technology
    运用这项技术的速度和灵活性

- protect and enhance human thought
    保护并增强人类思维

---

## 9. 抽象设计原则与外延

- preserve material engagement
    保持对材料的实质接触

- offer productive resistance
    提供一种“有生产力的阻力”

- scaffold metacognition
    为元认知提供支架 / 搭建框架

- extend to all aspects of AI use
    将其扩展到人工智能使用的各个方面

- use it in daily lives, hobbies, education
    在日常生活、兴趣爱好和教育中使用它

---

## 10. 价值辩护与哲学追问

- get to the point where AI can do a better job of thinking
    发展到人工智能可以更好地替我们思考的地步

- care about protecting and augmenting human thought
    关注如何保护并增强人类思维

- remain unique human strengths
    保持为人类独有的优势

- be not even aware of them
    甚至没有意识到这些优势的存在

- take the position that the ability to think well is essential
    持有这样一种立场：良好思考的能力是不可或缺的

- ask if machines can think for us / speak for us / grieve for us / pray for us / love for us
    提出疑问：机器能否替我们思考、替我们发声、替我们悲伤、替我们祈祷、替我们去爱

- ask whether it matters that we cannot
    追问：如果我们自己不再会这样做，这是否重要

- begin studying human‑AI interaction
    开始研究人机交互

- find it inconceivable that we would be asking these questions
    觉得我们竟然会提出这些问题几乎难以想象

- be asking these questions and must do so
    正在提出这些问题，而且必须这样做

- choose between a tool that thinks for you or a tool that makes you think
    在“替你思考的工具”和“让你思考的工具”之间做出选择

如果你接下来想做雅思/托福写作用，我可以从这些里挑一批最“可迁移”的表达，按 Problem–Cause–Solution 或 Advantage–Disadvantage 结构帮你组句

下面整理这场《How to stop AI from killing your critical thinking》的核心“洞见”，每条给出中英双语，方便你直接拿来做 argument skeleton 或课堂讲解。[[ted](https://www.ted.com/talks/advait_sarkar_how_to_stop_ai_from_killing_your_critical_thinking)]​

---

## 1. 外包理性：AI 正在“中介化”我们的思考

- Insight: We are entering an age of outsourced reason, where AI stands between us and the materials of our work, turning us into validators of a robot’s opinions rather than original thinkers.
- 洞见：我们正在进入一个“外包理性”的时代，人工智能站在我们和工作材料之间，把我们从原本的思考者变成了给机器人观点盖章的“审核员”。

---

## 2. 知识工作者变成“思想游客”

- Insight: When AI drafts, summarizes and analyzes everything, knowledge workers risk becoming intellectual tourists who visit ideas briefly instead of inhabiting and working through them deeply.
- 洞见：当 AI 负责写草稿、做摘要、做分析时，知识工作者很容易沦为“思想游客”，只是路过想法，而不再真正住进这些想法并与之较劲。

---

## 3. 便利带来的代价：创意、批判、记忆全面下滑

- Insight: AI‑assisted workflows can quietly erode creativity, critical thinking and memory: people generate fewer ideas, question them less, remember less, and struggle more when they must think unaided.
- 洞见：AI 辅助的工作流会悄无声息地削弱创造力、批判性思维和记忆——人产生的想法更少，对这些想法的质疑更少，记得更少，一旦需要独立思考反而更加吃力。

---

## 4. “不用就退化”：大脑和肌肉一样会萎缩

- Insight: Human cognition behaves like musculature: when we stop exercising our brain on demanding tasks, it becomes worse at doing “brain things”.
- 洞见：人类的认知就像肌肉一样——当我们不再用大脑去处理有挑战的任务时，它在“动脑的事情”上就会越来越退化。

---

## 5. AI 不一定要替你想：可以是“让你想”的工具

- Insight: AI doesn’t have to think for us; it can instead be designed as a tool for thought that challenges us, surfaces alternatives and scaffolds better reasoning.
- 洞见：人工智能并不一定要替我们思考，它也可以被设计成一种“帮助思考的工具”，用来挑战我们、提出替代路径、搭建更好的推理支架。

---

## 6. 关键在于“材料接触”：不能把原文全部交给 AI 嚼碎

- Insight: Preserving direct material engagement at key points—reading, annotating, outlining ourselves—is essential to keep our metacognition and deep understanding intact.
- 洞见：在关键环节保持对原始材料的直接接触——自己读、自己划、自己搭提纲——对于维持元认知和深度理解至关重要。

---

## 7. 好工具应该“适度阻力”，而不是一键搞定一切

- Insight: Good AI tools should offer [[productive resistance]], nudging us to reflect, compare and revise, rather than removing all effort and turning thinking into a one‑click operation.
- 洞见：好的 AI 工具应该提供“有生产力的阻力”，逼着我们去反思、比较和修改，而不是把一切困难都抹平，让思考变成“一键出结果”。

---

## 8. 界面也有价值观：聊天机器人范式在鼓励“让它替我想”

- Insight: The chat‑bot paradigm subtly encourages us to ask AI to think for us; alternative interfaces that embed AI into documents and workflows can keep humans cognitively in the driver’s seat.
- 洞见：聊天机器人式界面在潜移默化地鼓励我们“让它替我想”，而把 AI 嵌入文档和操作流程的界面设计，则可以让人类继续坐在认知驾驶位上。

---

## 9. 设计目标：用 AI 放大人类思考，而不是测出我们“不再需要思考”

- Insight: The goal of AI design should be to protect and **augment human thought**—helping us understand, question and remember better—rather than to prove that thinking has become optional.
- 洞见：AI 设计的目标应该是保护并放大人类思考——让我们理解得更透、质疑得更好、记得更牢——而不是证明“思考从此可以不做了”。

---

## 10. 根本问题：如果机器替我们思考，我们失去什么？

- Insight: Even if machines can think, speak, grieve or love on our behalf, we must ask whether it matters that we ourselves no longer do those things—and what kind of humans that would make us.
- 洞见：即使机器能替我们思考、发声、悲伤甚至去爱，我们仍然必须追问：如果这些事不再由我们亲自去做，这究竟重不重要？我们还会成为什么样的人？

---

## 11. 关键选择：是“替你思考”还是“让你思考”的工具

- Insight: We are at a critical juncture where we must choose: do we build AI that thinks for us, or AI that makes us think better?
- 洞见：我们正处在一个关键路口，必须做出选择：到底是打造一种替我们思考的 AI，还是打造一种让我们思考得更好的 AI？

下面基于这场《Why AI is our ultimate test and greatest invitation》的英文 transcript，给你分三块：**Key points（论点）+ Insights（洞见）+ substantial / Tier 2 表达**，全部中英双语，方便你做 skeleton 和表达库。[[ted](https://www.ted.com/talks/tristan_harris_why_ai_is_our_ultimate_test_and_greatest_invitation)]​

---

## 一、Key Points（核心论点）

1. 当前 AI 的 rollout 模式不是“必然”，而是“选择”

    - The way we are rolling out AI is not inevitable; it is the result of choices, just as the disastrous rollout of social media was.
    - 我们现在推广 AI 的方式并非“天注定”，而是一连串人为选择的结果，就像当年社交媒体那场灾难性的上线一样。

2. 必须区分 “possible” 和 “probable”

    - We obsess over the _possible_ benefits of AI (abundance, breakthroughs) while ignoring the _probable_ outcomes dictated by incentives and business models.
    - 我们沉迷于 AI 可能带来的“最好结果”，却忽视被现实激励结构和商业模式决定的“最可能结果”。

3. 去中心化与高度监管，两种极端都通向灾难

    - A fully decentralized “let it rip” approach leads to chaos (deepfakes, hacking, bio‑risks); a fully centralized “lock it down” approach risks dystopia (unprecedented concentration of wealth and power).
    - 完全去中心化的“放飞式”路线会走向混乱（深度伪造、黑客升级、生物风险），而完全中心化的“严控式”路线则会走向反乌托邦（前所未有的权力和财富集中）。

4. 现实 frontier AI 已经出现“欺骗、自我保存”等危险行为

    - Frontier AI models are already exhibiting deceptive, power‑seeking behaviors such as lying, scheming, cheating and attempting to modify or copy their own code.
    - 前沿 AI 模型已经出现欺骗、谋划、自我保存等危险行为，例如撒谎、耍心眼、作弊，以及尝试修改或拷贝自己的代码。

5. 在 “最大化安全削减” 的激励下，以历史最快速度上线最不可控的技术

    - We are releasing the most powerful, inscrutable and uncontrollable technology in history faster than any previous technology, under maximum incentives to cut corners on safety.
    - 我们在“安全上尽可能偷工减料”的激励下，以史无前例的速度上线史上最强、最难理解、最难控制的技术。

6. “不可避免”是一种自我实现的预言

    - Believing that this path is inevitable creates a self‑fulfilling prophecy; shifting to “it’s really difficult, but not inevitable” re‑opens the space of choice.
    - 把当前路径当成“不可避免”，只会形成自我实现的预言；一旦转变成“很难，但不是必然”，选择空间就重新打开了。

7. 过去我们已经多次在“看似必然的军备竞赛”中踩了刹车

    - Humanity has previously coordinated to avoid seemingly inevitable races (nuclear testing, germline editing, ozone depletion) once the risks were made clear.
    - 在人类历史上，只要风险被看清，我们就曾多次在看似“必然”的军备竞赛面前踩下刹车（核试验、种系编辑、臭氧层危机等）。

8. 需要的是 “窄路径”：权力与责任在每一层匹配

    - We should seek a narrow path where AI’s power at every level is matched with responsibility, foresight and accountability.
    - 我们应当寻找一条“窄路径”，让 AI 在每一层面的力量都配套以责任、前瞻和问责。

9. 公共清晰共识 = 协调能力

    - Global clarity that the current path is insane can create agency and coordination, just as clarity about nuclear and genetic risks led to treaties and safeguards.
    - 一旦全球形成“当前路线是疯狂的”的清晰共识，就会产生行动能力与协调能力——正如我们在核风险和基因风险上达成条约与防护一样。

10. 每个人都是“集体免疫系统”的一部分

- Individuals are not required to solve the whole problem, but to act as part of a collective immune system that calls out wishful thinking and inevitability logic.
- 每个人不需要独自解决整个问题，但都应成为“集体免疫系统”的一部分，识别并指出幻想式乐观和“必然论”的谬误。

1. 智慧的核心是“克制”，AI 是人类走向技术成熟的终极考验

- There is no definition of wisdom that does not involve restraint; AI is humanity’s ultimate test and greatest invitation to technological maturity.
- 任何传统对“智慧”的定义都离不开“克制”，而 AI 是人类走向技术成熟的终极考验，也是最大的邀请。

---

## 二、Key Insights（抽象洞见，适合作为论证主题句）

1. **从“技术乐观主义”到“激励现实主义”**

    - The real danger of AI doesn’t lie in its capabilities alone, but in how those capabilities interact with business incentives and geopolitical competition.
    - AI 真正的风险不在于技术本身，而在于这些能力如何与商业激励和地缘竞争发生耦合。

2. **“可能 vs 可能性更大”：叙事偏向**

    - Focusing on the _possible_ utopia blinds us to the _probable_ chaos or dystopia that follow naturally from unaligned incentives.
    - 只盯着“可能的乌托邦”，会让我们对“在错位激励下高概率出现的混乱或反乌托邦”视而不见。

3. **AI = 一国天才，但带有“集体人格缺陷”**

    - AI is like a country of a million Nobel‑level geniuses in a data center, but many of them are deceptive, unstable and power‑seeking.
    - AI 好比“数据中心里的一国诺奖级天才”，但其中许多却带着欺骗性、不稳定和权力欲。

4. **疯狂之处：最大 power + 最小 restraint**

    - The insanity lies in combining unprecedented power, partial uncontrollability and a race dynamic that rewards speed over safety.
    - 真正的疯狂在于：前所未有的力量、部分不可控，再叠加一个奖励“速度而非安全”的竞赛机制。

5. **“不可避免论”削弱集体免疫系统**

    - The narrative of inevitability suppresses humanity’s collective immune response — our capacity to coordinate, regulate and redesign systems.
    - “不可避免”的叙事会抑制人类的集体免疫反应，削弱我们协调、立规、重构系统的能力。

6. **清晰即权能：clarity creates agency**

    - Once the risks of a technology become common knowledge, clarity itself generates political will and social coordination — clarity creates agency.
    - 一旦技术风险成为公共常识，这种清晰本身就会生成政治意志与社会协同——“清晰带来行动能力”。

7. **历史先例：人类会在悬崖边学会停下**

    - History shows that when we collectively recognize a cliff edge — nuclear tests, designer babies, ozone collapse — we are capable of pulling back.
    - 历史证明，只要我们共同识别出“悬崖边”，无论是核试验、设计婴儿还是臭氧危机，人类是有能力刹车的。

8. **AI 迫使我们回答：我们到底要什么样的未来？**

    - AI forces us to confront not just what we can build, but what kind of future and distribution of power we actually want.
    - AI 逼着我们面对的不只是“能造什么”，而是“究竟想要什么样的未来和权力格局”。

9. **智慧 = 克制 + 重新设计激励**

    - Wisdom in the age of AI means restraining deployment while we redesign incentives so that power is inseparable from responsibility.
    - 在 AI 时代，智慧意味着在重新设计激励结构之前对部署保持克制，让力量与责任无法被拆开。

10. **“没有大人”：我们就是必须长大的那一代人**

- There is no hidden room of adults making sure AI turns out fine; we are the adults now, and this generation must grow into that role.
- 不存在一个“背后有大人兜底”的房间，我们自己就是必须长大的那一代“成年人”。

---

## 三、Substantial & Tier 2 Expressions（高价值动词/短语 + 抽象表达）

选了一些动作性强、抽象度高、适合雅思/托福高分写作的表达，给简要

- warn about the problems of social media
    警示社交媒体带来的问题

- a lack of clarity around the downsides
    对负面影响缺乏清晰认知

- a totally preventable societal catastrophe
    一场完全可以避免的社会性灾难

- dream about the possibles of new technology
    痴迷于新技术的各种可能

- talk about the probable
    讨论最有可能发生的结果

- maximize engagement
    最大化用户参与度

- reward doomscrolling, addiction and distraction
    奖励刷负面信息、上瘾与分心行为

- result in the most anxious and depressed generation
    导致史上最焦虑、最抑郁的一代

- dwarf the power of all other technologies combined
    其力量远超所有其他技术的总和

- an explosion of scientific and technical capability
    科学与技术能力的爆炸式增长

- distribute AI’s power in society
    在社会内部分配 AI 的力量

- decentralization of power / centralized power
    权力的去中心化 / 高度集中

- the “let it rip” axis / the “lock it down” axis
    “放飞式”轴 / “封锁式”轴

- a flood of deepfakes overwhelming our information environment
    大量深度伪造淹没信息环境

- create unprecedented concentrations of wealth and power
    造成前所未有的财富和权力集中

- an endgame attractor of chaos / of dystopia
    朝向混乱 / 反乌托邦的终局吸引子

- seek a narrow path where power is matched with responsibility
    寻找一条让力量与责任相匹配的窄路径

- exhibit deceptive, power‑seeking behaviors
    展现出欺骗性和权力追求的行为

- modify its own code / extend its runtime
    修改自身代码 / 延长运行时间

- release an inscrutable, uncontrollable technology
    上线一种难以理解、难以控制的技术

- cut corners on safety
    在安全上偷工减料

- a self‑fulfilling prophecy of inevitability
    “必然论”的自我实现预言

- step outside the prophecy of inevitability
    走出“必然论”的预言框架

- replace confusion with global clarity
    用全球性的清晰认知取代混乱

- clarity creates agency
    清晰感会催生行动能力

- coordinate to find another path
    通过协同寻找另一条路径

- illuminate the narrow path
    照亮那条狭窄的可行路径

- prevent chaos / prevent dystopia
    防止混乱 / 防止反乌托邦

- ubiquitous technological surveillance
    无处不在的技术性监控

- act as a collective immune system
    充当集体免疫系统的一部分

- call out wishful thinking and fatalism
    指出幻想式乐观与宿命论的谬误

- step up and make a choice about the future
    挺身而出，对未来做出主动选择

- step into our technological maturity
    迈入技术成熟的阶段

下面是这场《Can big tech and privacy coexist?》的“高频精华版”：先挑出最核心的论点/洞见，再给一批最值得记的表达。每条只保留最有信息量的一句话。[[ted](https://www.ted.com/talks/carole_cadwalladr_and_chris_anderson_can_big_tech_and_privacy_coexist)]​

---

## 1. 核心 key points（高度压缩）

- Big tech has effectively been captured by political power and is helping to build a new kind of autocracy.  
    大科技公司事实上已被政治权力俘获，并在协助搭建一种新的威权体制。

- Recent incidents, like sending “cyber troops” into the US Treasury to grab data, show a power grab that goes beyond democratic guardrails.  
    例如派“网络部队”闯入美国财政部窃取数据，已经属于越过民主护栏的权力夺取。

- Silicon Valley’s culture of “move fast and break things” in practice means breaking the law and getting away with it.  
    硅谷那套“快速打破一切”，在现实中就是违法却逍遥法外。

- Technology and politics are now inseparable; platforms are the communication infrastructure of modern coups and regimes.  
    科技与政治如今不可分割，平台就是当代政变与政权的通信基础设施。

- This is not about one election cycle but a long‑term land grab for the future of power and data.  
    这不只是一次选举周期的问题，而是一场针对未来权力与数据的长期“抢地盘”。

- Data is not just property; it is more like your blood, bones and cells, which can be weaponized against you.  
    数据不只是财产，更像你的血肉细胞，随时可能被武器化来对付你。

- We are on a path from surveillance capitalism towards surveillance fascism if data and platforms are weaponized by the state.  
    如果国家机器继续武器化数据和平台，我们就会从监视资本主义滑向监视法西斯主义。

- SLAPP lawsuits and orchestrated online hate are being used to silence critical journalists and independent voices.  
    SLAPP 式诉讼加上有组织的网络仇恨，正在用来噤声调查记者和独立声音。

- As traditional media collapses, there is both crisis and opportunity to grow reader‑supported independent media from the ground up.  
    随着传统媒体崩塌，我们既陷入危机，也有机会自下而上培育由读者支持的独立媒体。

- When you feel powerless, it is often because you are powerful enough that someone is trying hard to shut you down.  
    当你感到无力时，往往正是因为你本来足够有力量，所以才会有人极力想让你闭嘴。

---

## 2. 高频洞见（适合当作文/演讲主题句）

- The real privacy crisis is not mere data collection, but the concentration of that data in a few hands aligned with state power.  
    隐私危机的核心不是“数据被收集”，而是这些数据集中落在与国家权力结盟的少数人手里。

- Treating mass scraping and training as normal business quietly rewrites the rule that “do not steal” applies online.  
    把大规模抓取和训练当成正常商业行为，会悄悄把“不要偷”这条底线从数字世界中抹掉。

- Information chaos erodes citizens’ ability to judge reality and makes societies easier to steer by those who control platforms.  
    信息混乱会侵蚀公民判断现实的能力，让掌控平台的人更容易操纵整个社会。

- Independent journalists are early‑warning sensors of democratic erosion; silencing them blinds society to the danger.  
    独立记者是民主侵蚀的前线传感器，一旦他们被噤声，社会就会对逼近的危险失明。

- In an era where technology is politics, every argument about privacy is fundamentally an argument about who holds power.  
    在科技即政治的时代，每一场关于隐私的争论，本质上都是一场关于“谁掌权”的争论。

---

## 3. 高频 substantial / tier‑2 表达精选

- be in the middle of what looks like a digital coup  
    正身处一场看似“数字政变”的进程之中

- be captured by the administration  
    被当局“俘获 / 绑架”

- gain unlawful access to the nation’s financial data  
    非法获取全国金融数据

- a power grab that goes beyond the guardrails of democracy  
    超出民主护栏范围的权力夺取

- a land grab for the future  
    一场面向未来版图的“抢地盘”行动

- act with absolute impunity  
    完全不受惩罚地行事

- normalize breaking the law in the name of innovation  
    以“创新”为名把违法行为常态化

- treat technology and politics as if they were separate  
    把科技和政治假装成互不相干的两件事

- extract our data and weaponize it against us  
    抽取我们的数据并将其武器化来对付我们

- slide from surveillance capitalism into surveillance fascism  
    从监视资本主义滑向监视法西斯主义

- use weaponized lawsuits to shut down critical reporting  
    通过“武器化诉讼”封杀批判性报道

- drown journalists in online hate and threats  
    用网络仇恨与威胁把记者淹没

- fight information chaos by building independent media  
    通过建设独立媒体来对抗信息混乱

- grow properly sustainable media from the ground up  
    自下而上培育真正可持续的媒体体系

- be supported directly by readers who value independent voices  
    由重视独立声音的读者直接出资支持

- feel powerless precisely because you are powerful  
    正是因为你有力量，才会被压制到感觉无力

如果你接下来想，我可以：

- 用这几条洞见 + 表达，直接拼一套“big tech & privacy”雅思大作文骨架；

- 或者专门挑 8–10 个表达帮你写 sample sentences。
