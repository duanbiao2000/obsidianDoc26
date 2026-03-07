---
workflow_id: deep-research-analysis
name: Deep Research Analysis
description: 多维度并行研究并综合分析，适用于复杂技术主题的深入研究
pattern: hybrid
agents:
  - EMP_R001_research-planner
  - EMP_R101_web-researcher
  - EMP_R102_academic-searcher
  - EMP_R103_codebase-analyzer
  - EMP_S001_information-synthesizer
  - EMP_S003_report-generator
context_requirements:
  shared_knowledge_base: true
  cross_agent_communication: true
  result_merging_strategy: weighted_confidence
monitoring:
  progress_tracking: true
  intermediate_outputs: true
  quality_threshold: 0.8
---

# 深度研究分析工作流 (Deep Research Analysis)

## 工作流概述

这是一个混合式研究工作流，结合了顺序规划和并行执行的策略，适用于需要多维度信息收集的复杂技术主题研究。

```
研究请求
    ↓
┌───────────────────────────────────────┐
│ Phase 1: 研究规划 (Pipeline)          │
│ Agent: research-planner               │
│ 输出: 研究计划                        │
└───────────────────────────────────────┘
    ↓
┌───────────────────────────────────────┐
│ Phase 2: 并行调研 (Parallel)          │
│ ├─ web-researcher (Web搜索)          │
│ ├─ academic-searcher (学术论文)      │
│ └─ codebase-analyzer (代码分析)      │
│ 输出: 多维度调研结果                 │
└───────────────────────────────────────┘
    ↓
┌───────────────────────────────────────┐
│ Phase 3: 信息综合 (Pipeline)          │
│ Agent: information-synthesizer        │
│ 输出: 综合分析报告                    │
└───────────────────────────────────────┘
    ↓
┌───────────────────────────────────────┐
│ Phase 4: 报告生成 (Pipeline)          │
│ Agent: report-generator               │
│ 输出: 最终研究报告                    │
└───────────────────────────────────────┘
    ↓
研究完成
```

---

## Phase 1: 研究规划 (Planning Phase)

### 目标
制定系统性研究计划，明确研究范围、信息源和执行路径。

### 执行Agent
- **主Agent**: `EMP_R001_research-planner`

### 输入
- 用户的研究问题/主题
- 研究背景和上下文
- 可用的研究资源（时间、访问权限等）

### 输出
```yaml
research_plan:
  problem_analysis:
    core_question: "核心研究问题"
    sub_questions:
      - "子问题1"
      - "子问题2"
    key_concepts:
      - concept1: "定义"
      - concept2: "定义"

  information_sources:
    priority_1:
      - type: "官方文档"
        examples: ["具体资源"]
        rationale: "为什么重要"
    priority_2:
      - type: "学术论文"
        examples: ["具体资源"]

  research_path:
    phase_1_overview:
      duration: "20分钟"
      agents: ["web-researcher"]
      output: "主题概览和主要资源"
    phase_2_deep_dive:
      duration: "60分钟"
      agents: ["web-researcher", "academic-searcher", "codebase-analyzer"]
      mode: "parallel"
      output: "详细的多维度分析"
    phase_3_synthesis:
      duration: "30分钟"
      agents: ["information-synthesizer"]
      output: "综合分析报告"

  success_criteria:
    - "明确回答核心问题"
    - "覆盖所有子问题"
    - "提供可操作的建议"
```

### 成功标准
- ✅ 研究问题清晰分解
- ✅ 信息源具体且可访问
- ✅ 时间估算合理
- ✅ 输出格式明确

---

## Phase 2: 并行调研 (Investigation Phase)

### 目标
从多个维度并行收集信息，实现广度覆盖和深度探索。

### 执行Agents
- **Web Researcher**: `EMP_R101_web-researcher`
- **Academic Searcher**: `EMP_R102_academic-searcher`
- **Codebase Analyzer**: `EMP_R103_codebase-analyzer`

### 执行模式
**PARALLEL** - 三个agents同时工作，各自专注于不同的信息维度。

#### 2.1 Web Researcher任务

**输入**: 从research-planner接收的搜索策略
**输出**:
```markdown
web_research_output:
  topic_overview: "主题的总体概览"
  key_resources:
    - name: "资源名称"
      url: "链接"
      credibility: "评级"
      summary: "简短摘要"
  practical_insights:
    - "实践洞察1"
    - "实践洞察2"
  community_perspectives:
    - "社区观点1"
    - "社区观点2"
```

**搜索重点**:
- 官方文档和教程
- 技术博客和文章
- 社区讨论（Stack Overflow, Reddit）
- GitHub项目和issues
- 实战案例和示例

#### 2.2 Academic Searcher任务

**输入**: 研究主题的学术关键词
**输出**:
```markdown
academic_research_output:
  key_papers:
    - title: "论文标题"
      authors: ["作者列表"]
      venue: "发表场所"
      year: 年份
      citations: 引用数
      key_findings: "主要发现"
      relevance: "与主题的相关性"
  research_trends:
    - "趋势1: 描述"
    - "趋势2: 描述"
  theoretical_foundation:
    - "理论基础1"
    - "理论基础2"
  open_questions:
    - "未解决问题1"
    - "未解决问题2"
```

**研究重点**:
- arXiv预印本（最新研究）
- 顶级会议论文
- 期刊综述文章
- 引用网络分析
- 研究方法论评估

#### 2.3 Codebase Analyzer任务

**输入**: 相关的开源项目或代码库
**输出**:
```markdown
codebase_analysis_output:
  projects_analyzed:
    - name: "项目名称"
      repository: "GitHub链接"
      architecture: "架构概述"
      key_implementations:
        - feature: "特性"
          location: "文件路径"
          approach: "实现方法"
      code_quality: "质量评估"
      learning_points:
        - "可学习的点1"
        - "可学习的点2"
  implementation_patterns:
    - "模式1: 描述和示例"
    - "模式2: 描述和示例"
  practical_considerations:
    - "实际考虑1"
    - "实际考虑2"
```

**分析重点**:
- 主流开源项目的实现
- 架构设计模式
- 关键算法和数据处理
- 代码质量和可维护性
- 实际应用案例

### 并行协调
- 三个agents独立工作，无需等待
- 每个agent有自己的超时时间（15-20分钟）
- 通过Context Bridge共享进度（可选）
- 完成后将结果写入共享上下文

---

## Phase 3: 信息综合 (Synthesis Phase)

### 目标
整合三个维度的调研结果，提取关键洞察，生成连贯的分析。

### 执行Agent
- **主Agent**: `EMP_S001_information-synthesizer`

### 输入
- 从Phase 2获得的三个调研输出
- 从Phase 1获得的研究计划

### 处理流程

```
1. 信息清洗和分类
   - 去除重复信息
   - 标准化格式
   - 按主题分类

2. 冲突检测和解决
   - 识别不同源之间的矛盾
   - 评估可信度
   - 标注未解决冲突

3. 模式和关系分析
   - 发现共同主题
   - 识别趋势
   - 建立概念间的连接

4. 洞察提炼
   - 综合推理
   - gap分析
   - 生成可操作建议

5. 叙事构建
   - 组织信息流
   - 突出重点
   - 确保逻辑连贯
```

### 输出
```markdown
synthesis_output:
  executive_summary: "2-3段话总结"

  key_findings:
    - finding_1:
        title: "发现标题"
        confidence: 5/5
        evidence: ["源A", "源B"]
        insight: "深层洞察"
    - finding_2:
        title: "发现标题"
        confidence: 4/5
        evidence: ["源C"]
        caveat: "需要验证"

  comparative_analysis:
    comparison_table: |
      | 维度 | 选项A | 选项B | 选项C |
      |------|-------|-------|-------|
      | ... | ...   | ...   | ...   |

  conflicts_and_resolutions:
    resolved:
      - conflict: "描述冲突"
        resolution: "如何解决"
    unresolved:
      - conflict: "描述冲突"
        status: "需要进一步研究"

  patterns_and_trends:
    common_themes: ["主题1", "主题2"]
    emerging_trends: ["趋势1", "趋势2"]
    stable_patterns: ["模式1"]

  insights_and_recommendations:
    key_insights:
      - "洞察1"
      - "洞察2"
    actionable_recommendations:
      short_term:
        - "短期建议"
      medium_term:
        - "中期建议"
      long_term:
        - "长期建议"

  information_gaps:
    identified_gaps:
      - "缺失信息1"
      - "缺失信息2"
    suggested_follow_up:
      - topic: "后续研究主题"
        rationale: "为什么需要"
        priority: "high"
```

### 成功标准
- ✅ 信息整合完整，无重大遗漏
- ✅ 冲突信息得到处理和标注
- ✅ 洞察有深度，超越表面信息
- ✅ 建议具体可操作

---

## Phase 4: 报告生成 (Reporting Phase)

### 目标
将综合分析转化为结构化、易读的Obsidian Markdown文档。

### 执行Agent
- **主Agent**: `EMP_S003_report-generator`

### 输入
- Phase 3的综合输出
- Phase 1的研究计划

### 报告结构
1. **标题页**: 标题、日期、作者、版本
2. **执行摘要**: 核心发现和建议
3. **研究背景**: 问题和动机
4. **研究方法**: 数据来源和分析方法
5. **核心发现**: 主要发现的详细阐述
6. **对比分析**: 多选项对比（如适用）
7. **洞察和建议**: 可操作的建议
8. **后续研究**: 已识别的缺口
9. **附录**: 参考资料、术语表、相关笔记

### Obsidian集成
- 使用YAML frontmatter存储元数据
- 添加相关标签（#research, #topic）
- 创建wikilinks到相关笔记
- 使用callouts突出重要信息
- 包含Mermaid图表可视化

### 输出文件
```bash
Research/outputs/{project_name}/{date}_research_report.md
```

---

## 执行时间和资源估算

### 时间估算
| Phase | 预计时间 | 备注 |
|-------|---------|------|
| Phase 1: 规划 | 5-10分钟 | 取决于问题复杂度 |
| Phase 2: 并行调研 | 15-20分钟 | 受最慢的agent限制 |
| Phase 3: 综合 | 10-15分钟 | 取决于信息量 |
| Phase 4: 报告 | 5-10分钟 | 报告长度 |
| **总计** | **35-55分钟** | 典型情况 |

### 资源需求
- **网络**: 需要稳定的网络连接（搜索和读取在线资源）
- **计算**: 标准CPU即可，无特殊GPU需求
- **存储**: 研究输出约1-5MB

---

## 质量保证

### Phase间质量门禁

**Phase 1 → Phase 2**:
- ✅ 研究计划是否完整？
- ✅ 信息源是否具体？
- ✅ 时间估算是否合理？

**Phase 2 → Phase 3**:
- ✅ 每个维度都有输出？
- ✅ 信息源可信度已评估？
- ✅ 原始信息已保存？

**Phase 3 → Phase 4**:
- ✅ 所有信息已整合？
- ✅ 冲突已标注？
- ✅ 洞察有证据支持？

**最终输出**:
- ✅ 报告结构完整
- ✅ 链接可点击
- ✅ 引用格式正确
- ✅ YAML frontmatter有效

---

## 使用示例

### 启动工作流

```bash
# 使用协调器启动
python3 scripts/orchestration/agent-team-coordinator.py \
  --workflow deep-research-analysis \
  --context '{"research_question": "2024年最新的Agent Orchestration框架对比"}'
```

### 直接调用agents

```bash
# Phase 1: 规划
claude agent agents/definitions/EMP_R001_research-planner.md

# Phase 2: 并行调研（在tmux中）
tmux new-session -s web-research -d "claude agent agents/definitions/EMP_R101_web-researcher.md"
tmux new-session -s academic-research -d "claude agent agents/definitions/EMP_R102_academic-searcher.md"
tmux new-session -s code-analysis -d "claude agent agents/definitions/EMP_R103_codebase-analyzer.md"

# Phase 3: 综合（等待Phase 2完成）
claude agent agents/definitions/EMP_S001_information-synthesizer.md

# Phase 4: 报告
claude agent agents/definitions/EMP_S003_report-generator.md
```

---

## 扩展和定制

### 添加新的调研维度
在工作流中添加新的agent（如`security-analyzer`）：
1. 创建新的agent定义
2. 在Phase 2中添加该agent
3. 更新Phase 3的整合逻辑

### 调整执行模式
将某些phase改为顺序或并行：
- 修改`pattern`字段
- 调整agents列表和依赖关系

### 自定义输出格式
修改Phase 4的报告模板以适应特定需求。

---

## 监控和调试

### 进度追踪
- 每个phase的输出保存在`.agent-state/`
- Collaboration log记录所有事件
- Context cache存储中间结果

### 调试提示
- 如果某个agent失败，检查其日志
- 使用`--status`参数查看tmux会话
- 查看collaboration-log.jsonl了解执行流程

---

*此工作流设计为可扩展和可定制的。根据具体研究需求，可以调整agents、phases和输出格式。*
