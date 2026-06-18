---
title: "改进前后对比 | Before and After Improvement"
framework: "Google Style Guide"
exercise_type: "rewrite"
difficulty: "beginner"
estimated_time: "20-30 minutes"
cssclasses: doc-exercise
tags:
  - doc-framework
  - google-style-guide
  - exercise
  - rewrite
date: 2026-02-05
---

# 改进前后对比 | Before and After Improvement

> [!abstract] 练习目标 | Exercise Goal
>
> 通过对比"改进前"和"改进后"的文档，学习 Google Developer Documentation Style Guide 的核心原则：
>
> - 使用第二人称（"you"）和主动语态
> - 将条件放在指令之前
> - 使用描述性链接文本
> - 保持对话式且专业的语气

---

## 练习一：主动语态 vs 被动语态 | Active vs Passive Voice

> [!info] Google 原则 | Google Principle
> **Use active voice | 使用主动语态**：让行动者清晰可见。

### 案例 1 | Case 1

#### ❌ 改进前 | Before

> The application can be configured by the user through the settings panel. Authentication is required before access to the API is granted. The documentation should be consulted for additional information.

#### ✅ 改进后 | After

> You can configure the app in **Settings**. You must authenticate before accessing the API. For more information, see the [documentation](https://example.com/docs).

<details>
<summary>查看解析 | View Analysis</summary>

**改进点 | Improvements**:

1. ✅ "The application can be configured by the user" → "You can configure the app"
   - 主动语态 + 第二人称
2. ✅ "authentication is required" → "You must authenticate"
   - 主动语态，明确谁需要执行操作
3. ✅ "The documentation should be consulted" → "see the documentation"
   - 更直接、更简洁
4. ✅ UI 元素加粗（**Settings**）

</details>

---

### 练习 1.1 | Practice 1.1

#### ❌ 改进前 | Before

> The system will automatically restart when the configuration file is modified by the administrator. A notification will be sent to the user when the process is completed.

#### 你的改进 | Your Rewrite

<details>
<summary>查看参考答案 | View Reference Answer</summary>

**参考答案 | Suggested Answer**:

> The system restarts automatically when you modify the configuration file. You'll receive a notification when the process completes.

**改进点 | Improvements**:

- "when the configuration file is modified by the administrator" → "when you modify..."
- "A notification will be sent" → "You'll receive a notification"
- 更简洁、更直接

</details>

---

## 练习二：条件前置 | Conditions Before Instructions

> [!info] Google 原则 | Google Principle
> **Put conditions before instructions | 将条件放在指令之前**：让读者在开始前就知道是否满足要求。

### 案例 2 | Case 2

#### ❌ 改进前 | Before

> 1. Navigate to the **Settings** menu.
> 2. Select **Preferences** from the dropdown.
> 3. Click the **Enable** toggle.
>
> **Note**: You must have administrator privileges to change this setting.

#### ✅ 改进后 | After

> **To** enable this feature **if** you have admin privileges:
>
> 1. Go to **Settings**.
> 2. Select **Preferences**.
> 3. Click the **Enable** toggle.

<details>
<summary>查看解析 | View Analysis</summary>

**改进点 | Improvements**:

1. ✅ 条件前置：在步骤前说明需要 admin 权限
2. ✅ 使用 "To" + 动词的结构
3. ✅ 简化步骤描述（去掉不必要的词语）
4. ✅ UI 元素加粗

</details>

---

### 练习 2.1 | Practice 2.1

#### ❌ 改进前 | Before

> 1. Open the **Terminal** app.
> 2. Type `pip install package-name` and press Enter.
> 3. Wait for the installation to complete.
> 4. Verify the installation by typing `package-name --version`.
>
> **Important**: Python 3.8 or higher is required.

#### 你的改进 | Your Rewrite

<details>
<summary>查看参考答案 | View Reference Answer</summary>

**参考答案 | Suggested Answer**:

> **To** install the package **if** you have Python 3.8 or higher:
>
> 1. Open **Terminal**.
> 2. Run `pip install package-name`.
> 3. Verify the installation:
>
>    ```bash
>    package-name --version
>    ```

**改进点 | Improvements**:

- 条件前置：说明 Python 版本要求
- 简化动词："Type" → "Run"
- 合并步骤：安装和验证可以合并
- 代码块格式更清晰

</details>

---

## 练习三：描述性链接文本 | Descriptive Link Text

> [!info] Google 原则 | Google Principle
> **Use descriptive link text | 使用描述性链接文本**：让读者在点击前就知道会去哪里。

### 案例 3 | Case 3

#### ❌ 改进前 | Before

> To learn more about our API, **click here**. For troubleshooting, **go to this page**. You can also **read more** about authentication.

#### ✅ 改进后 | After

> To learn more about our API, see the [API reference](https://example.com/api). For troubleshooting, see the [troubleshooting guide](https://example.com/troubleshoot). You can also learn more about [authentication](https://example.com/auth).

<details>
<summary>查看解析 | View Analysis</summary>

**改进点 | Improvements**:

1. ✅ "click here" → "API reference" - 描述目的地
2. ✅ "go to this page" → "troubleshooting guide" - 说明页面内容
3. ✅ "read more" → "authentication" - 明确主题

**关键原则 | Key Principle**:
> 链接文本应该独立传达信息。即使只有链接文本（没有上下文），读者也应该知道点击后会发生什么。
</details>

---

### 练习 3.1 | Practice 3.1

#### ❌ 改进前 | Before

> If you need help, **click this link**. For more information, **visit our website**. You can also **download the file** from our server.

#### 你的改进 | Your Rewrite

<details>
<summary>查看参考答案 | View Reference Answer</summary>

**参考答案 | Suggested Answer**:

> If you need help, see the [help center](https://example.com/help). For more information, visit [example.com](https://example.com). You can also [download the SDK](https://example.com/download).

**改进点 | Improvements**:

- "click this link" → "help center" - 明确是帮助中心
- "visit our website" → 实际域名或具体页面名称
- "download the file" → "download the SDK" - 具体说明是什么文件

</details>

---

## 练习四：词汇简化 | Word Simplification

> [!info] Google 原则 | Google Principle
> **Use simple words | 使用简单词汇**：用最简单的词表达意思。

### 案例 4 | Case 4

#### ❌ 改进前 | Before

> To **utilize** the functionality, **execute** the application and **navigate** to the configuration section. **Subsequent** to completion, **verify** that the settings are **appropriate**.

#### ✅ 改进后 | After

> To **use** the feature, **open** the app and **go** to **Settings**. When you're done, **check** that the settings are correct.

<details>
<summary>查看解析 | View Analysis</summary>

**词汇替换 | Word Replacements**:

| 复杂词 | 简单词 | 中文 |
|--------|--------|------|
| utilize | use | 使用 |
| execute | open/run | 打开/运行 |
| navigate | go | 前往 |
| subsequent to | after/when | 之后/当...时 |
| verify | check | 检查 |
| appropriate | correct | 正确 |

**原则 | Principle**:
> 每个复杂的词都会增加认知负担。简单的词让读者专注于内容，而不是词汇。
</details>

---

### 练习 4.1 | Practice 4.1

#### ❌ 改进前 | Before

> Prior to **initiating** the process, ensure that all **prerequisites** are **met**. The system will **commence** operations **subsequent** to your confirmation. Should you **encounter** any **difficulties**, **proceed** to contact support.

#### 你的改进 | Your Rewrite

<details>
<summary>查看参考答案 | View Reference Answer</summary>

**参考答案 | Suggested Answer**:

> Before you start, make sure you meet all requirements. The system starts working after you confirm. If you have any problems, contact support.

**词汇替换 | Word Replacements**:

| 复杂词 | 简单词 |
|--------|--------|
| initiating | starting |
| prerequisites | requirements |
| met | have/fulfill |
| commence | start/begin |
| subsequent to | after |
| encounter | have/run into |
| difficulties | problems/issues |
| proceed | (omit - 不需要) |

**改进点 | Improvements**:

- 删除不必要的 "proceed"（直接说 "contact support"）
- 用常见词替换学术词汇
- 更自然的表达

</details>

---

## 练习五：综合改写 | Comprehensive Rewrite

> [!question] 挑战练习 | Challenge Exercise
>
> 将以下"改进前"的段落改写为符合 Google Style Guide 的版本。应用你学到的所有原则。

### 案例 5 | Case 5

#### ❌ 改进前 | Before

> **User Account Management Functionality**
>
> The system administrator is provided with the capability of user account management through the utilization of the administrative interface. Authentication credentials are required to be possessed by the user prior to the access of said functionality being granted.
>
> In order to add a new user account, the following sequential steps must be executed:
>
> 1. The administrator should navigate to the user management section.
> 2. The "Add User" control element should be activated.
> 3. The applicable user information is to be input into the designated fields.
> 4. The "Submit" action is to be performed.
>
> **Note**: Administrative privileges are mandatory for this operation.
>
> For additional information, **click here**.

#### 你的改进 | Your Rewrite

<details>
<summary>查看参考答案 | View Reference Answer</summary>

**参考答案 | Suggested Answer**:

> **Manage user accounts**
>
> As an admin, you can manage user accounts in the admin interface. You need to sign in to access this feature.
>
> **To** add a user **if** you have admin privileges:
>
> 1. Go to the **Users** page.
> 2. Click **Add User**.
> 3. Enter the user information.
> 4. Click **Submit**.
>
> For more information, see [Manage users](https://example.com/users).

**改进点总结 | Summary of Improvements**:

| 方面 | 改进前 | 改进后 |
|------|--------|--------|
| **标题** | User Account Management Functionality | Manage user accounts |
| **人称** | The system administrator... | As an admin, you... |
| **语态** | is provided with, are required | can, need to |
| **词汇** | utilization, possessed, prior to | use, have, before |
| **条件** | 放在最后 Note | 前置在标题中 |
| **步骤** | should be executed, is to be | 直接动词 |
| **链接** | click here | see [Manage users] |
| **UI 元素** | (无格式) | **加粗** |

**字数对比 | Word Count**:

- 改进前：~95 词
- 改进后：~45 词
- **减少 50%+，但信息更清晰！**

</details>

---

## 自我检查清单 | Self-Check Checklist

> [!question] 检查理解 | Check Understanding
>
> 完成练习后，用以下清单检查你的改写：

### ✅ Google Style Guide 检查清单

| 原则 | 检查项 | 通过 |
|------|--------|------|
| **第二人称** | 是否使用 "you" 而不是 "the user/we"？ | ☐ |
| **主动语态** | 行动者是否清晰？是否避免被动语态？ | ☐ |
| **条件前置** | 条件是否在步骤之前说明？ | ☐ |
| **描述性链接** | 链接文本是否描述目的地？ | ☐ |
| **简单词汇** | 是否用简单词替换复杂词？ | ☐ |
| **UI 加粗** | UI 元素是否加粗？ | ☐ |
| **代码字体** | 代码相关文本是否使用代码字体？ | ☐ |
| **简洁性** | 是否删除不必要的词语？ | ☐ |

---

## 实践应用 | Real-World Practice

> [!tip] 课后练习 | Homework
>
> 从你自己的项目或文档中找出一段需要改进的文字，应用 Google Style Guide 的原则进行改写。

**改写模板**：

```markdown
## 原文 | Original

[粘贴你的原文]

## 问题分析 | Issues Identified

1. ___
2. ___
3. ___

## 改写后 | Rewritten

[你的改写版本]

## 改进说明 | Improvements Made

1. ___
2. ___
3. ___
```

---

## 相关资源 | Related Resources

- [[../02-Annotated/highlights|Google Style Guide 重点摘要]]
- [[../02-Annotated/writing-clearly|清晰写作指南]]
- [[sentence-rewrite|句子改写练习]]

---

**完成日期 | Completion Date**: _______________
**用时 | Time Spent**: _______________
**自我评分 | Self-Rating**: ⭐⭐⭐⭐⭐ (1-5)
