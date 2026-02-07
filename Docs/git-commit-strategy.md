# Git 提交策略

## 项目类型

- **项目**: Obsidian 知识库
- **性质**: 个人文档仓库
- **推荐策略**: 粗粒度提交

## 粗粒度提交策略

### 原则

相关的变更可以合并为一个提交，优先考虑逻辑完整性而非原子性。

### 提交组合建议

| 组合 | 说明 | 示例 |
|------|------|------|
| **配置变更** | 单独提交 | `.obsidian/`, `.sisyphus/`, 插件配置 |
| **同一框架的文档** | 合并提交 | `DocFramework/Diataxis/` 的所有相关变更 |
| **学习材料** | 合并提交 | 所有 `03-Exercises/` 练习文件 |
| **日记条目** | 可合并 | 同一天的多个日记可以合并 |
| **子模块更新** | 单独提交 | `system_prompts_leaks` 引用更新 |

### 不合并的情况

- **跨主题的变更** - 如配置更新和文档添加应分开
- **子模块引用** - 始终单独提交，便于追溯
- **重大功能变更** - 如新增一个完整的学习框架

## 示例对比

### 细粒度（不推荐）
```
aef0d30 chore: add Sisyphus plugin configuration
a84b80f docs: add Diataxis classification exercise
73ef687 docs: add Google style guide exercise
b41a8fe docs: add Microsoft style guide exercise
2c5392b docs: add grep.app usage notes
b41a8fe docs: add system prompts learning notes
774b3a3 chore: update submodule reference
```

### 粗粒度（推荐）
```
aef0d30 chore: add Sisyphus plugin configuration
a84b80f docs: add framework exercises and journal entries
774b3a3 chore: update submodule reference
```

## 未来提交建议

### 添加新文档时

```bash
# 如果添加多个相关文档，合并为一次提交
git add DocFramework/NewFramework/01-Original/ DocFramework/NewFramework/02-Annotated/
git commit -m "docs: add NewFramework with annotations"
```

### 更新日记时

```bash
# 同一天的多个日记可以合并
git add Journals/2026-02-05-*.md
git commit -m "docs: add daily journal entries (2026-02-05)"
```

### 更新子模块时

```bash
# 子模块始终单独提交
cd system_prompts_leaks
git commit -m "..."
cd ..
git add system_prompts_leaks
git commit -m "chore: update submodule reference"
```
