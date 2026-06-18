---
title: "文档分类练习 | Document Classification Exercise"
framework: "Diataxis"
exercise_type: "classification"
difficulty: "beginner"
estimated_time: "15-20 minutes"
cssclasses: doc-exercise
tags:
  - doc-framework
  - diataxis
  - exercise
  - classification
date: 2026-02-05
---

# 文档分类练习 | Document Classification Exercise

> [!abstract] 练习目标 | Exercise Goal
>
> 通过判断不同类型的文档片段，熟练掌握 Diátaxis 框架的四个维度：**Tutorials**（教程）、**How-to Guides**（操作指南）、**Reference**（参考）、**Explanation**（解释）。

---

## 练习一：基础分类 | Basic Classification

> [!info] 说明 | Instructions
>
> 阅读以下 8 个文档片段，判断它们属于 Diátaxis 的哪个维度。将答案写在每个片段下方。
>
> 参考框架：
>
> - **Tutorials | 教程** - 学习导向，面向初学者，完整的步骤
> - **How-to Guides | 操作指南** - 问题导向，面向实践者，解决具体问题
> - **Reference | 参考** -信息导向，面向专家，结构化数据
> - **Explanation | 解释** - 理解导向，面向理解者，解释背景和概念

---

### 片段 1 | Fragment 1

> **Flask 快速入门**
>
> 在这个教程中，我们将从零开始创建一个简单的博客应用。你将学习：
>
> - 如何安装 Flask
> - 如何创建路由
> - 如何使用模板
>
> 完成后，你将拥有一个可以运行的基础博客应用。
>
> 让我们开始吧！首先，确保你已经安装了 Python...

**你的答案 | Your Answer**: _______________

<details>
<summary>查看答案 | View Answer</summary>

**答案 | Answer**: **Tutorials | 教程**

**理由 | Reason**:

- ✅ 面向初学者（"从零开始"）
- ✅ 完整的学习路径（从安装到完成应用）
- ✅ 学习导向（"你将学习..."）
- ✅ 有明确的终点（"完成应用"）

</details>

---

### 片段 2 | Fragment 2

> **Flask 路由函数**
>
> `@app.route(route, options, methods)`
>
> **参数**:
>
> - `route` (str) - URL 规则字符串
> - `options` (dict) - 可选参数
> - `methods` (list) - 允许的 HTTP 方法列表
>
> **返回值**: Response 对象
>
> **示例**: `@app.route('/api/users', methods=['GET'])`

**你的答案 | Your Answer**: _______________

<details>
<summary>查看答案 | View Answer</summary>

**答案 | Answer**: **Reference | 参考**

**理由 | Reason**:

- ✅ 结构化数据格式（参数列表）
- ✅ 技术性强，简洁
- ✅ 面向需要查找具体信息的用户
- ✅ 不解释"为什么"，只提供"是什么"

</details>

---

### 片段 3 | Fragment 3

> **为什么 Flask 使用上下文变量？**
>
> Flask 使用上下文变量（如 `current_app`）是因为 WSGI 应用需要同时处理多个请求。每个请求需要访问当前应用和请求对象，但传统的全局变量在并发环境下无法正常工作。
>
> 上下文变量使用线程局部存储（Thread Local Storage）来确保每个请求都能访问正确的数据...

**你的答案 | Your Answer**: _______________

<details>
<summary>查看答案 | View Answer</summary>

**答案 | Answer**: **Explanation | 解释**

**理由 | Reason**:

- ✅ 解释"为什么"（Why）
- ✅ 提供背景知识
- ✅ 帮助理解概念和设计原理
- ✅ 不是操作步骤，也不是参考数据

</details>

---

### 片段 4 | Fragment 4

> **如何在 Flask 中添加用户身份验证**
>
> 要在 Flask 应用中添加用户登录功能，最简单的方法是使用 Flask-Login 扩展：
>
> 1. 安装 Flask-Login: `pip install flask-login`
> 2. 初始化 LoginManager: `login_manager = LoginManager()`
> 3. 配置用户加载器: `@login_manager.user_loader`
> 4. 添加登录路由: 处理用户凭据
> 5. 保护路由: 使用 `@login_required` 装饰器

**你的答案 | Your Answer**: _______________

<details>
<summary>查看答案 | View Answer</summary>

**答案 | Answer**: **How-to Guide | 操作指南**

**理由 | Reason**:

- ✅ 解决具体问题（"添加用户身份验证"）
- ✅ 面向已有基础的实践者
- ✅ 步骤化指导
- ✅ 假设用户已有基本知识
- ❌ 不是教程（不是从零开始）
- ❌ 不是参考（不是 API 文档）

</details>

---

### 片段 5 | Fragment 5

> **创建你的第一个 Flask 应用**
>
> 第一步：创建项目目录
>
> ```
> mkdir myapp
> cd myapp
> ```
>
> 第二步：创建应用文件 `app.py`
>
> ```python
> from flask import Flask
> app = Flask(__name__)
>
> @app.route('/')
> def home():
>     return 'Hello, World!'
> ```
>
> 第三步：运行应用
>
> ```
> flask run
> ```
>
> 访问 <http://localhost:5000，你将看到> "Hello, World!"

**你的答案 | Your Answer**: _______________

<details>
<summary>查看答案 | View Answer</summary>

**答案 | Answer**: **Tutorials | 教程**

**理由 | Reason**:

- ✅ 从零开始（"第一个应用"）
- ✅ 完整的步骤序列
- ✅ 学习导向
- ✅ 有明确的起点和终点

</details>

---

### 片段 6 | Fragment 6

> **Flask `request` 对象**
>
> **属性**:
>
> - `request.form` - 包含表单数据的字典
> - `request.args` - 包含 URL 参数的字典
> - `request.files` - 包含上传文件的字典
> - `request.method` - 当前 HTTP 方法
> - `request.headers` - HTTP 头部字典
>
> **方法**:
>
> - `request.get_json()` - 解析 JSON 请求体

**你的答案 | Your Answer**: _______________

<details>
<summary>查看答案 | View Answer</summary>

**答案 | Answer**: **Reference | 参考**

**理由 | Reason**:

- ✅ 结构化的属性/方法列表
- ✅ 技术参考性质
- ✅ 用于查找信息而非学习

</details>

---

### 片段 7 | Fragment 7

> **Flask 的请求响应循环**
>
> 当用户访问 Flask 应用时，请求会经过以下流程：
>
> 1. Web 服务器接收请求
> 2. WSGI 将请求转发给 Flask 应用
> 3. Flask 匹配 URL 路由
> 4. 调用对应的视图函数
> 5. 视图函数返回响应
> 6. WSGI 将响应返回给 Web 服务器
>
> 理解这个循环有助于你调试应用和优化性能...

**你的答案 | Your Answer**: _______________

<details>
<summary>查看答案 | View Answer</summary>

**答案 | Answer**: **Explanation | 解释**

**理由 | Reason**:

- ✅ 解释系统如何工作
- ✅ 提供概念理解
- ✅ 帮助读者建立心智模型
- ❌ 不是教程（不教你怎么做）
- ❌ 不是操作指南（不解决具体问题）

</details>

---

### 片段 8 | Fragment 8

> **解决 Flask CORS 错误**
>
> 如果你的前端在访问 Flask API 时遇到 CORS 错误：
>
> 1. 安装 flask-cors: `pip install flask-cors`
> 2. 初始化 CORS:
>
>    ```python
>    from flask_cors import CORS
>    CORS(app)
>    ```
>
> 3. 或者在特定路由上启用:
>
>    ```python
>    @cross_origin()
>    def api_route():
>        ...
>    ```

**你的答案 | Your Answer**: _______________

<details>
<summary>查看答案 | View Answer</summary>

**答案 | Answer**: **How-to Guide | 操作指南**

**理由 | Reason**:

- ✅ 解决具体问题（CORS 错误）
- ✅ 问题导向（"如果...遇到..."）
- ✅ 提供解决方案
- ❌ 不解释 CORS 是什么（那是 Explanation）

</details>

---

## 练习二：进阶分类 | Advanced Classification

> [!question] 思考题 | Thinking Question
>
> 以下文档片段混合了多个维度。请指出主要维度，并说明它还包含了哪些其他维度的元素。

### 片段 A | Fragment A

> **Flask 用户认证完整指南**
>
> 在本教程中，我们将学习如何为 Flask 应用添加用户认证系统。你将理解认证的工作原理，并学会实现登录、注册和密码重置功能。
>
> **认证是什么？** 用户认证是确认用户身份的过程...
>
> **开始之前**，确保你已经安装了 Flask...
>
> **Flask-Login API 参考**:
>
> - `login_user(user)` - 登录用户
> - `logout_user()` - 登出用户
> - `current_user` - 当前用户对象
>
> 让我们开始创建你的认证系统...

<details>
<summary>查看分析 | View Analysis</summary>

**主要维度 | Primary Dimension**: **Tutorials | 教程**

**包含的其他维度元素 | Other Dimensions Present**:

- **Explanation**: "认证是什么？" 部分解释概念
- **Reference**: "Flask-Login API 参考" 部分提供参考信息
- **How-to Guide**: 具体步骤部分

**问题 | Issue**:
这个文档试图涵盖所有维度，结果可能导致：

1. **初学者**被技术细节淹没（API 参考）
2. **实践者**找不到快速解决方案（教程太长）
3. **专家**觉得内容冗余（不需要教程部分）

**建议 | Suggestion**:
拆分为独立的文档：

- `User Authentication Tutorial` - 教程
- `Understanding Authentication` - 解释
- `Flask-Login API Reference` - 参考
- `How to Add Login to Your App` - 操作指南

</details>

---

## 练习三：实际应用 | Real-World Application

> [!tip] 实践练习 | Practice Exercise
>
> 从你正在使用的项目中找出一个文档，分析它属于哪个维度。如果它混合了多个维度，尝试描述如何拆分它。

**项目文档分析模板**：

```
文档名称: _______________
文档链接: _______________

主要维度: _______________

理由:
1. _______________
2. _______________
3. _______________

是否混合其他维度?
- [ ] 是 - 哪些: _______________
- [ ] 否

如果混合，如何拆分:
1. _______________
2. _______________
3. _______________
```

---

## 自我检查 | Self-Check

> [!question] 检查理解 | Check Understanding
>
> 完成练习后，问自己：
>
> 1. 我能否快速识别文档的维度？
> 2. 我能否解释为什么某个片段属于特定维度？
> 3. 我能在自己的写作中应用这个分类吗？

**记分卡 | Scorecard**:

| 练习 | 正确数 | 总数 | 正确率 |
|------|--------|------|--------|
| 练习一 | ___ | 8 | ___% |
| 练习二 | ___ | 1 | ___% |

**目标 | Target**: 正确率 ≥ 75%

---

## 相关资源 | Related Resources

- [[../02-Annotated/start-here|Diátaxis 框架概述]]
- [[../02-Annotated/practical-application|Diátaxis 实际应用]]
- [[classification-practice-2|进阶分类练习]]

---

**完成日期 | Completion Date**: _______________
**用时 | Time Spent**: _______________
**自我评分 | Self-Rating**: ⭐⭐⭐⭐⭐ (1-5)
