# 📚 Agent Team Orchestration System - 文档导航

> 欢迎使用Agent Team编排系统！这里是为您准备的所有文档。

---

## 🎯 新用户？从这里开始

### 1. 系统概览

首先了解系统是什么，能做什么：

📖 **[README - 系统概述](./README.md)**

- 系统介绍和特性
- 快速开始指南
- 核心组件说明
- 使用示例

### 2. 验证安装

确保系统正常运行：

```bash
bash scripts/orchestration/test-agents.sh
```

### 3. 第一次使用

启动您的研究任务：

```bash
bash scripts/orchestration/research-launcher.sh \
  "Agent Orchestration框架对比"
```

---

## 📖 文档分类

### 用户文档

| 文档 | 适合人群 | 内容 |
|------|---------|------|
| [README](./README.md) | 所有用户 | 系统概述和快速开始 |
| [快速参考](./QUICK_REFERENCE.md) | 所有用户 | 常用命令和代码片段 |
| [使用指南](#user-guide) | 终端用户 | 详细使用说明 |

### 开发者文档

| 文档 | 适合人群 | 内容 |
|------|---------|------|
| [开发者指南](./DEVELOPER_GUIDE.md) | 开发者 | 完整的开发文档 |
| [实施总结](../IMPLEMENTATION_SUMMARY.md) | 技术负责人 | 实施概览和技术细节 |

---

## 🚀 快速导航

### 我想

#### 🎯 使用系统进行研究

```bash
# 启动研究工作流
bash scripts/orchestration/research-launcher.sh "你的研究问题"
```

详见: [README - 使用示例](./README.md#快速开始)

#### 🔧 创建新Agent

1. 查看 [开发者指南 - Agent开发](./DEVELOPER_GUIDE.md#4-agent开发指南)
2. 使用Agent模板创建文件
3. 测试Agent

```bash
# 创建agent
touch agents/definitions/EMP_R1XX_my-agent.md

# 验证
python3 scripts/orchestration/agent-team-coordinator.py --list-agents
```

#### 🔄 创建新工作流

1. 查看 [开发者指南 - 工作流开发](./DEVELOPER_GUIDE.md#5-工作流开发指南)
2. 定义工作流
3. 测试执行

```bash
# 创建工作流
touch agents/workflows/my-workflow.md

# 验证
python3 scripts/orchestration/agent-team-coordinator.py --list-workflows
```

#### 🐛 调试问题

查看 [快速参考 - 调试技巧](./QUICK_REFERENCE.md#-调试技巧) 或 [开发者指南 - 故障排除](./DEVELOPER_GUIDE.md#9-故障排除)

#### 📚 了解API

查看 [开发者指南 - 核心API参考](./DEVELOPER_GUIDE.md#3-核心api参考)

---

## 📋 完整文档目录

### 系统文档

#### [README.md](./README.md)

- 系统概述
- 目录结构
- 快速开始
- 核心组件
- 使用方法
- 监控和调试
- 扩展和定制

#### [QUICK_REFERENCE.md](./QUICK_REFERENCE.md)

- 快速开始
- 常用命令
- Python API速查
- Agent模板
- 工作流模板
- 常见模式
- 调试技巧
- 配置参考

#### [DEVELOPER_GUIDE.md](./DEVELOPER_GUIDE.md)

1. [系统架构](./DEVELOPER_GUIDE.md#1-系统架构)
2. [开发环境设置](./DEVELOPER_GUIDE.md#2-开发环境设置)
3. [核心API参考](./DEVELOPER_GUIDE.md#3-核心api参考)
4. [Agent开发指南](./DEVELOPER_GUIDE.md#4-agent开发指南)
5. [工作流开发指南](./DEVELOPER_GUIDE.md#5-工作流开发指南)
6. [扩展和定制](./DEVELOPER_GUIDE.md#6-扩展和定制)
7. [测试和调试](./DEVELOPER_GUIDE.md#7-测试和调试)
8. [性能优化](./DEVELOPER_GUIDE.md#8-性能优化)
9. [故障排除](./DEVELOPER_GUIDE.md#9-故障排除)
10. [最佳实践](./DEVELOPER_GUIDE.md#10-最佳实践)
11. [贡献指南](./DEVELOPER_GUIDE.md#11-贡献指南)

#### [IMPLEMENTATION_SUMMARY.md](../IMPLEMENTATION_SUMMARY.md)

- 实施概览
- 核心功能实现
- 文件结构
- 测试结果
- 使用方法
- 关键洞察

### Agent定义

#### 研究类Agents (R-Series)

- [EMP_R001_research-planner](./definitions/EMP_R001_research-planner.md) - 研究规划
- [EMP_R101_web-researcher](./definitions/EMP_R101_web-researcher.md) - Web搜索
- [EMP_R102_academic-searcher](./definitions/EMP_R102_academic-searcher.md) - 学术搜索
- [EMP_R103_codebase-analyzer](./definitions/EMP_R103_codebase-analyzer.md) - 代码分析

#### 综合类Agents (S-Series)

- [EMP_S001_information-synthesizer](./definitions/EMP_S001_information-synthesizer.md) - 信息综合
- [EMP_S003_report-generator](./definitions/EMP_S003_report-generator.md) - 报告生成

### 工作流定义

- [deep-research-analysis](./workflows/deep-research-analysis.md) - 深度研究分析
- [technical-decision-analysis](./workflows/technical-decision-analysis.md) - 技术决策分析

---

## 🎓 学习路径

### 初学者路径

```
1. README.md (系统概述)
   ↓
2. QUICK_REFERENCE.md (常用命令)
   ↓
3. 运行第一个研究任务
   ↓
4. 查看生成的报告
```

### 开发者路径

```
1. DEVELOPER_GUIDE.md (完整指南)
   ↓
2. 理解系统架构
   ↓
3. 创建第一个Agent
   ↓
4. 创建第一个工作流
   ↓
5. 测试和调试
```

### 高级用户路径

```
1. 实施总结 (了解技术细节)
   ↓
2. 自定义协调器
   ↓
3. 性能优化
   ↓
4. 集成外部工具
```

---

## 💬 获取帮助

### 常见问题

**Q: 如何开始第一个研究任务？**

```bash
bash scripts/orchestration/research-launcher.sh "你的研究问题"
```

**Q: 如何查看所有可用的agents？**

```bash
python3 scripts/orchestration/agent-team-coordinator.py --list-agents
```

**Q: Agent执行失败怎么办？**

1. 查看日志: `cat .agent-state/collaboration-logs/coordinator.log`
2. 检查tmux: `tmux ls`
3. 参考: [故障排除](./DEVELOPER_GUIDE.md#9-故障排除)

**Q: 如何创建自定义Agent？**
参考: [Agent开发指南](./DEVELOPER_GUIDE.md#4-agent开发指南)

### 获取支持

- 📖 查看 [快速参考](./QUICK_REFERENCE.md)
- 📘 阅读 [开发者指南](./DEVELOPER_GUIDE.md)
- 🔍 搜索 [已知问题](./DEVELOPER_GUIDE.md#9-故障排除)
- 📝 提交 Issue (如果适用)

---

## 🔄 文档更新

### 最新更新

- **2025-02-13**: 初始版本发布
  - 完整的开发者指南
  - 快速参考指南
  - 文档导航

### 文档版本

- README.md: v1.0.0
- QUICK_REFERENCE.md: v1.0.0
- DEVELOPER_GUIDE.md: v1.0.0
- IMPLEMENTATION_SUMMARY.md: v1.0.0

---

## 🎯 快速链接

### 按角色

- 👤 **终端用户**: [README](./README.md) → [快速参考](./QUICK_REFERENCE.md)
- 👨‍💻 **开发者**: [开发者指南](./DEVELOPER_GUIDE.md)
- 🏢 **架构师**: [实施总结](../IMPLEMENTATION_SUMMARY.md)

### 按任务

- 🚀 **快速开始**: [README - 快速开始](./README.md#快速开始)
- 🔧 **创建Agent**: [开发指南 - Agent开发](./DEVELOPER_GUIDE.md#4-agent开发指南)
- 🔄 **创建工作流**: [开发指南 - 工作流开发](./DEVELOPER_GUIDE.md#5-工作流开发指南)
- 🐛 **调试问题**: [快速参考 - 调试](./QUICK_REFERENCE.md#-调试技巧)
- ⚡ **性能优化**: [开发指南 - 性能优化](./DEVELOPER_GUIDE.md#8-性能优化)

---

## 📊 系统状态

### 当前版本

- **版本**: 1.0.0
- **状态**: ✅ 生产就绪
- **测试**: ✅ 11/11 通过
- **文档**: ✅ 完整

### 可用资源

- **Agents**: 6个
- **工作流**: 2个
- **核心脚本**: 3个
- **测试脚本**: 1个

---

**祝您使用愉快！** 🎉

如有任何问题或建议，请参考相关文档或提交反馈。
