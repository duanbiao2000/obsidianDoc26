# Git 提交检查清单

## 提交前检查

### 1. 检查暂存内容

```bash
git status
git diff --cached --stat
```

**提问**：这些文件属于同一逻辑变更吗？

### 2. 确认提交类型

| Type | 说明 | 示例 |
|------|------|------|
| `docs` | 文档变更 | 新增、修改、删除文档 |
| `chore` | 构建/工具变更 | 配置、依赖、子模块 |
| `feat` | 新功能 | 功能开发 |
| `fix` | 修复 | Bug 修复 |
| `refactor` | 重构 | 代码重构 |
| `style` | 格式 | 格式调整（不影响功能） |
| `perf` | 性能 | 性能优化 |
| `test` | 测试 | 测试相关 |

### 3. 编写提交消息检查点

- [ ] **Type 是否正确？** 根据变更性质选择合适的类型
- [ ] **Subject 是否清晰且不超过 50 字符？** 使用祈使句现在时态
- [ ] **Body 是否说明了 what, why, how？** 提供足够的上下文
- [ ] **是否引用了相关 issue 或文档？** 如 `Related: path/to/file.md`

### 4. 提交消息示例

```
docs: add Microsoft Style Guide word choice exercise

Add a practical exercise for learning Microsoft Writing Style Guide
principles focused on word choice and vocabulary optimization.

What:
- 5 practice cases covering contractions, simple words, consistency
- Bilingual content (Chinese/English) for accessibility
- Before/after comparisons with detailed analysis

Why:
Help learners apply Microsoft style guide principles through
hands-on practice with real-world examples.

How:
Each case includes:
- "Before" version with common mistakes
- "After" version with corrections
- Foldable analysis section explaining the changes

Meta Information:
- Difficulty: beginner
- Estimated time: 20-30 minutes
- Tags: doc-framework, microsoft-style-guide, exercise, word-choice

Related: DocFramework/Microsoft-Style-Guide/02-Annotated/welcome.md

Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>
```

## 提交策略选择

### 策略 1：细粒度提交（适合大型项目/团队协作）

**适用场景**：
- 团队协作，需要代码审查
- 频繁发布，需要可回滚的细粒度历史
- CI/CD 流水线

**原则**：一个提交只做一件事

### 策略 2：粗粒度提交（适合个人项目/知识库）

**适用场景**：
- 个人知识库（如 Obsidian vault）
- 独立开发
- 不需要细粒度回滚

**原则**：相关的变更可以合并

## 快速参考

### 常用命令

```bash
# 查看当前状态
git status

# 查看暂存的变更
git diff --cached

# 提交（会使用 .gitmessage 模板）
git commit

# 查看最近提交
git log --oneline -5

# 查看完整提交消息
git log -1 --format="%B"
```

### 交互式 Rebase（整理提交历史）

```bash
# 整理最近 N 个提交
git rebase -i HEAD~N

# 常用操作：
# pick  - 保留该提交
# squash - 合并到前一个提交
# drop  - 删除该提交
# reword - 编辑提交消息
```
