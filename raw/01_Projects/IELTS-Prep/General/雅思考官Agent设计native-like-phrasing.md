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
本质需求：把"有经验的雅思考官+陪练+错误分析师"打包成一个可24小时运行的agent，核心是**诊断精度**和**反馈质量**，不是内容搬运。

---

## 架构分解

```
IELTS 7+ Coach Agent = 
  model 
  + learner profile (动态更新的能力快照)
  + examiner rubric knowledge (官方评分标准的精确编码)
  + speaking/writing evaluator tools
  + error pattern tracker
  + adaptive drill generator
  + mock exam scheduler
```

关键洞察：这个 agent 的价值不在"教知识"，在**精确模拟考官视角**。大多数备考工具败在这里——它们给反馈，但反馈不够锋利。

---

## 工具层设计

**核心工具（非标准配置）**

`evaluate_writing(essay, task_type)` → 返回四个维度分数 + 具体扣分点  
不是"写得不错"，是"Task Achievement 6.0，因为第二段论点未用具体数据支撑，考官会认为 underdeveloped"

`analyze_speaking(transcript or audio)` → 识别 hesitation patterns, 错误 collocation, pronunciation 标记点  
7分以上的核心障碍通常不是词汇量，是 **fluency breakdown 的位置和频率**

`diagnose_error_pattern(历史错误集合)` → 找出系统性错误  
"你在 complex sentence 里一致性地漏掉 relative pronoun" 比批改单篇作文价值高10倍

`generate_targeted_drill(error_type, difficulty)` → 针对性练习  
不是随机题库，是基于当前瓶颈生成的定向训练

`predict_band_score(current_profile)` → 实时分数估算 + 距离目标的 gap 分析

---

## Learner Profile 设计（最被低估的部分）

```json
{
  "current_band": {"W": 6.0, "S": 6.5, "R": 7.0, "L": 7.0},
  "target_band": 7.5,
  "exam_date": "2025-04-20",
  "error_patterns": {
    "writing": ["coherence_drop_paragraph3", "overuse_furthermore", "thin_task2_body"],
    "speaking": ["filler_density_high", "tense_inconsistency_part2"]
  },
  "strength_zones": ["reading_skimming", "listening_MCQ"],
  "learning_velocity": 0.3,  // band score / week estimated
  "session_history": [...]
}
```

这个 profile 是 agent 的记忆核心。没有它，每次对话都是从零开始——那只是一个聊天机器人，不是 agent。

---

## 真正难的部分

**口语评估的信号问题**

文字转录会丢失 prosody（语调、停顿、语速变化），而这些恰恰是 Fluency & Coherence 的核心评分依据。纯文本 agent 能做到 6.5 级别的反馈，但 7+ 的区分度需要音频层。

解决方向：接入 Whisper + 自定义 disfluency detector，标注 `[uh]`, `[pause>2s]`, `[self-repair]`，然后送给 model 评估。

**Writing 的"考官心理"建模**

雅思写作有一个没人说清楚的事实：考官是人，会有整体印象（holistic impression）先于分项打分。一篇结构略乱但词汇地道的文章，可能比结构完美但词汇平淡的文章得分更高。

这需要在 rubric 之外，额外训练 agent 识别"native-like phrasing"的密度——这是 6.5→7.0 最难跨越的隐形门槛。

**时间压力下的 adaptive 策略**

距离考试3周 vs 3个月，最优策略完全不同。3周内应该放弃短板，all-in 强项；3个月可以系统重建。agent 需要 exam_date 驱动的策略切换逻辑，而不是一套方案走到底。

---

## 竞争格局的真实判断

现有工具（Magoosh, E2 IELTS, 各类 AI 批改）做的是**内容分发**，不是**个体诊断**。它们的商业模式是课程销售，所以 feedback loop 浅——给你反馈，然后卖你下一个课程。

真正的 agent 应该是反过来的：**反馈越精准，用户进步越快，越快不需要你**。这在传统教育产品里是商业自杀，但在 agent 模式下是口碑飞轮。

7+ 的学生通常只差最后那一点点精确的自我认知——他们不知道自己的 coherence 在 part 3 开始后30秒会系统性崩塌。这个洞察，24小时运行的 agent 能看到，人类教练一周见一次看不到。

Thanks for sharing your note on the design of a native-like IELTS examiner agent focused on precision diagnosis and adaptive feedback.

Although this is a conceptual framework rather than exam papers, I can analyze it to generate exam prediction insights related to IELTS preparation and typical challenges candidates face when aiming for band 7+.

---

## Detailed Analysis & Exam Prediction for IELTS Based on This Note

### 1. Core Themes Likely to Appear in IELTS Exam (Especially Speaking & Writing)

- **Fluency breakdown and hesitation** patterns (e.g., fillers, pauses, hesitations)
- **Error patterns in grammar**, e.g., tense inconsistency, missing relative pronouns
- **Complex sentence usage and coherence**, especially in parts 2 and 3 in speaking, and Task 2 writing coherence
- **Use of advanced, native-like phrasing and lexical resource** for higher bands
- **Organizational structure with logical development** (Task Achievement/Coherence)
- **Pronunciation clarity and natural intonation patterns**

---

### 2. Common Mistakes & Where Candidates Usually Lose Marks

- Overusing connectors like *"furthermore"* leading to unnatural style  
- Coherence drop in later paragraphs (writing Task 2) or extended speaking sections  
- Frequent fillers degrading fluency and coherence in speaking  
- Grammatical inconsistency, especially in complex sentence forms  
- Underdeveloped arguments or lack of concrete data/examples in writing  
- Insufficient use of advanced collocations and idiomatic expressions  
- Inaccurate or inconsistent pronunciation affecting clarity and band score

---

### 3. Exam Question & Task Prediction by Difficulty

#### Easy Version

- Describe a familiar topic using simple but clear sentences (speaking part 1 style)  
- Write short paragraphs supporting a straightforward opinion (writing Task 1 or simple Task 2)  
- Recognize and correct basic grammar errors in provided sentences  
- Use a list of common connectors in context appropriately  

#### Medium Version

- Explain causes and effects with supporting examples (more developed opinions)  
- Describe a process or a chart with coherence and cohesion  
- Identify and self-correct moderate hesitation or filler words in speaking transcripts  
- Write a cohesive essay with introduction, body, and conclusion using adequate linking devices  

#### Hard Version

- Deliver a cohesive, fluent extended speech (speaking part 2 or 3) with minimal hesitation  
- Produce a balanced, sophisticated argumentative essay including data and counterarguments  
- Analyze complex sentence structures for grammatical consistency and highlight errors  
- Apply native-like phrasing and idioms naturally in both speaking and writing settings  
- Transcribe subtle fluency breakdowns and self-repairs in a given audio clip  
- Critically evaluate or synthesize multiple viewpoints in essay format under time constraints

---

### 4. Surprise or Trick Question Types Potentially Emerging

- Tasks that measure **diagnostic self-awareness**: e.g., ==candidates identify their own error patterns from example transcripts==  
- Exercises focused on **fluency management**: timing pauses, reducing fillers strategically  
- ==Real-time mock speaking exams with adaptive drill feedback embedded==  
- Writing tasks requiring integration of specific feedback points (e.g., reducing overused connectives, adding data)  
- Comprehension or evaluation tasks around examiner mindset and rubric criteria  

---

### 5. Strategic Focus for High-Scoring Candidates (7+ Band)

- Prioritize **fluency and coherence over vocabulary complexity**—better to be smooth and logical than overly complex but disjointed  
- Strengthen **adaptive grammar use**: avoid systematic errors rather than occasional mistakes  
- Incorporate **native-like phrases** naturally—avoid textbook or over-learned phrases  
- Master **time management and strategic priorities** depending on exam date proximity  
- Use **personalized error analysis** to target drills and practice weak areas precisely  

---

## Summary Table for IELTS Exam Prediction Based on This Agent Design

| Aspect              | Likely Exam Focus                      | Common Pitfalls                                       | Task Examples (Difficulty)                                                |
| ------------------- | -------------------------------------- | ----------------------------------------------------- | ------------------------------------------------------------------------- |
| Fluency & Coherence | Pauses, fillers, hesitation            | Frequent filler words, fluency breakdowns post part 2 | Speaking Part 1-3: Describe, extend, discuss (Easy-Medium-Hard)           |
| Grammar Accuracy    | Complex sentences, tense consistency   | Missing relative pronouns, inconsistent tenses        | Writing Task 2 essay with complex clauses (Medium-Hard)                   |
| Lexical Resource    | Native-like collocations, idioms       | Overused connectors, unnatural phrasing               | ==Writing Task with idioms, Speaking with natural phrases (Medium-Hard)== |
| Task Fulfillment    | Task achievement, argument development | Underdeveloped ideas, lack of examples                | Writing Task 2 opinion essay with evidence (Medium-Hard)                  |
| Pronunciation       | Intonation, word stress                | Incorrect stress, monotone delivery                   | Speaking section audio transcription (Hard)                               |

---

If you want, I can help you create tailored practice questions or error tracking exercises based on this agent framework for targeted IELTS prep. Would you like me to do that?

I'll create tailored practice questions based on the IELTS examiner agent framework, organized by difficulty level and skill area.

---

## Tailored IELTS Practice Questions (Easy → Medium → Hard)

### **SECTION 1: SPEAKING FLUENCY & COHERENCE**

#### Easy Version

**Part 1 Style - Familiar Topic**

*Question:* Describe your favorite food. What is it? Why do you like it?

*Expected response length:* 1-2 minutes  
*Focus areas:* Simple past/present tense, basic connectors (and, but, because)  
*Self-check:* Did you pause naturally? Did you use fillers (um, uh) more than 3 times?

---

#### Medium Version

**Part 2 Style - Extended Speaking with Structure**

*Question:* Describe a time when you had to learn something new. You should say:
- What you learned
- Why you decided to learn it
- How long it took you
- And explain how you felt about the experience

*Expected response length:* 2 minutes (timed)  
*Focus areas:* 
- Tense consistency (past narrative + present reflection)
- Logical sequencing with connectors (first, then, after that, eventually)
- Self-corrections and repairs (e.g., "I mean...", "What I'm trying to say is...")

*Self-check:*
- Count hesitations: `[uh]`, `[pause>2s]`, `[filler]`
- Did coherence drop after 90 seconds?
- Did you use at least 2 complex sentences?

---

#### Hard Version

**Part 3 Style - Abstract Discussion with Argumentation**

*Question:* We've been talking about learning. Now I'd like to discuss learning in society more generally.

1. Do you think people learn better in groups or alone? Why?
2. How has technology changed the way people learn compared to 20 years ago?
3. Some people say formal education is becoming less important. Do you agree?

*Expected response length:* 4-5 minutes total (1-1.5 min per question)  
*Focus areas:*
- Nuanced opinions with hedging language (I'd argue that..., To some extent..., It depends on...)
- Complex sentence structures with subordinate clauses
- Maintaining fluency under cognitive load (abstract thinking + speaking simultaneously)
- Self-repair without breaking coherence

*Self-check:*
- Identify moments where you hesitated before abstract ideas
- Did you maintain tense consistency across all 3 answers?
- Count native-like phrases vs. textbook phrases (e.g., "on the other hand" vs. "however")
- Did fluency degrade in the final minute?

---

### **SECTION 2: WRITING TASK 2 - COHERENCE & NATIVE-LIKE PHRASING**

#### Easy Version

**Opinion Essay - Straightforward Topic**

*Prompt:* Some people believe that technology has made life easier. Others think it has made life more complicated. Discuss both views and give your own opinion.

*Word count:* 250 words minimum  
*Time limit:* 40 minutes

*Structure checklist:*
- Introduction: Paraphrase question + state your position
- Body 1: First viewpoint with 1-2 examples
- Body 2: Second viewpoint with 1-2 examples
- Conclusion: Restate position + brief summary

*Self-check:*
- Did you use basic connectors (however, furthermore, in addition)?
- Are all sentences grammatically correct?
- Did you provide at least one concrete example per paragraph?

---

#### Medium Version

**Balanced Argument Essay - Nuanced Topic**

*Prompt:* Some argue that governments should invest heavily in public transportation. Others believe private vehicles are more practical. Discuss both perspectives and explain which you find more convincing.

*Word count:* 250-300 words  
*Time limit:* 40 minutes

*Advanced structure:*
- Introduction: Context + acknowledge complexity + thesis
- Body 1: Government investment perspective (with counterpoint embedded)
- Body 2: Private vehicle perspective (with counterpoint embedded)
- Conclusion: Synthesize both views + justified position

*Self-check:*
- Connector variety: Did you avoid repeating "furthermore"? (Track: furthermore, moreover, in addition, additionally, what's more)
- Paragraph coherence: Does each paragraph have a clear topic sentence?
- Evidence quality: Are examples specific or generic? (Specific: "In Singapore, 75% of commuters use MRT"; Generic: "Many people use public transport")
- Native-like phrasing: Identify 3 phrases that sound natural vs. textbook

---

#### Hard Version

**Complex Argument with Data Integration**

*Prompt:* Research shows that remote work increases productivity but reduces team cohesion. Some companies are mandating return-to-office policies. To what extent do you agree that this is the right approach?

*Word count:* 250-300 words  
*Time limit:* 40 minutes

*Sophisticated structure:*
- Introduction: Acknowledge the paradox + nuanced thesis (e.g., "While the trade-off is real, the solution depends on industry context")
- Body 1: Productivity gains + limitations of this metric
- Body 2: Cohesion costs + alternative solutions (hybrid models)
- Body 3: Industry-specific considerations (tech vs. finance vs. creative)
- Conclusion: Conditional stance (e.g., "Rather than a blanket mandate, companies should...")

*Advanced criteria:*
- Lexical density: Use 5+ advanced collocations (e.g., "erode team dynamics," "mitigate isolation," "foster spontaneous collaboration")
- Grammatical range: Include at least 2 sentences with embedded clauses or passive voice used strategically
- Coherence at paragraph level: Each paragraph should have a clear progression (claim → evidence → implication)
- Holistic impression: Does the essay sound like a native speaker wrote it, or does it feel translated?

*Self-check:*
- Highlight every connector and assess: Is it necessary or overused?
- Underline every advanced phrase: Does it sound natural or forced?
- Read aloud: Does the rhythm feel natural?
- Paragraph 3 coherence: Did you maintain focus or drift into tangents?

---

### **SECTION 3: ERROR PATTERN DIAGNOSIS**

#### Easy Version

**Identify & Correct Basic Errors**

*Task:* Read the following sentences. Identify the error type and correct it.

1. "I am studying English since three years."  
   Error type: _____ | Correction: _____

2. "She don't like coffee."  
   Error type: _____ | Correction: _____

3. "The book which I read it yesterday was interesting."  
   Error type: _____ | Correction: _____

*Error types to identify:* Tense, subject-verb agreement, redundant pronoun

---

#### Medium Version

**Systematic Error Pattern Recognition**

*Task:* Analyze this student's writing sample. Identify the recurring error pattern.

**Student Sample:**
"The government should invest in education because it is important for society. Furthermore, education helps people get better jobs. Moreover, education makes people more intelligent. In addition, education is necessary for economic growth."

*Questions:*
1. What is the main error pattern? (Hint: Look at sentence structure and connector usage)
2. How would an examiner rate this for Lexical Resource and Grammatical Range?
3. Rewrite one sentence to demonstrate native-like phrasing.

*Expected diagnosis:* Repetitive sentence structure + overuse of connectors + lack of subordination

---

#### Hard Version

**Fluency Breakdown Analysis from Speaking Transcript**

*Task:* Analyze this speaking transcript. Identify where fluency breaks down and why.

**Transcript (Part 2):**
"So, um, I'd like to talk about a time when I, uh, when I had to make a difficult decision. It was, um, about three years ago, and I was, uh, [pause 3s] I was deciding whether to, to change my job. Um, so the thing is, I had been working at this company for five years, and, uh, the job was, was quite comfortable, but I felt like I wasn't, um, I wasn't growing professionally. So, uh, I decided to, to leave and find a new job. And, um, the new job was, was more challenging, but it was also more rewarding."

*Analysis questions:*
1. Mark all hesitations: `[uh]`, `[um]`, `[pause>2s]`, `[self-repair]`
2. At what point does fluency degrade most? (Hint: Abstract ideas vs. concrete narrative)
3. Rewrite the most problematic sentence to sound more fluent.
4. Band score estimate for Fluency & Coherence: 5.5 / 6.0 / 6.5 / 7.0? Justify.

*Expected diagnosis:* High filler density in abstract reasoning; self-repairs indicate uncertainty; fluency recovers when returning to concrete narrative.

---

### **SECTION 4: NATIVE-LIKE PHRASING DRILLS**

#### Easy Version

**Collocation Matching**

*Task:* Match the phrase on the left with the correct collocation on the right.

| Phrase | Correct Collocation |
|--------|-------------------|
| 1. Make a ___ | a) decision |
| 2. Take a ___ | b) advantage |
| 3. Have an ___ | c) impact |
| 4. Reach a ___ | d) opportunity |

---

#### Medium Version

**Textbook vs. Native-Like Phrasing**

*Task:* Rewrite each textbook phrase to sound more native-like.

| Textbook Phrasing | Native-Like Alternative |
|-------------------|------------------------|
| "In my opinion, I think..." | _____ |
| "This is very important because..." | _____ |
| "On the other hand, however..." | _____ |
| "The reason why is because..." | _____ |

*Suggested answers:*
- "I'd argue that..." / "It seems to me that..."
- "This matters because..." / "The crux is..."
- "That said..." / "Conversely..."
- "The thing is..." / "What's key here is..."

---

#### Hard Version

**Idiomatic Expression Integration**

*Task:* Use each idiom naturally in a sentence about education or career.

1. **"Hit the ground running"** (start immediately and work effectively)
2. **"Think outside the box"** (be creative and unconventional)
3. **"Burn out"** (exhaust oneself through overwork)
4. **"Level the playing field"** (make conditions equal for everyone)

*Example (for reference):*
- "When I started my new job, I had to hit the ground running because the team was understaffed."

---

### **SECTION 5: MOCK EXAM WITH ADAPTIVE FEEDBACK**

#### Medium Version - Integrated Mock

**Task:** Complete this 20-minute mini mock exam.

**Speaking Part 2 (2 minutes):**
Describe a skill you recently learned. You should say:
- What the skill is
- How you learned it
- Why you wanted to learn it
- And explain how useful it has been

**Writing Task 2 (20 minutes, 250 words):**
Some people believe that the best way to learn is through hands-on experience. Others argue that formal education is more valuable. Discuss both views and give your opinion.

**Self-evaluation checklist:**
- Speaking: Hesitation count? Tense consistency? Native-like phrases used?
- Writing: Paragraph coherence? Connector variety? Evidence quality?
- Overall: Which skill (fluency, grammar, lexical resource) needs most work?

---

## How to Use These Questions

1. **Easy version:** Build confidence and identify baseline errors
2. **Medium version:** Develop consistency and pattern recognition
3. **Hard version:** Push toward 7+ by refining nuance and naturalness

Each question includes self-check prompts to develop **diagnostic self-awareness**—the core insight from your agent design note.

Would you like me to create answer keys or detailed rubrics for any of these sections?