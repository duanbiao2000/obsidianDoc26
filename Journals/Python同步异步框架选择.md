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
---

可以粗暴地记：**同步框架简单好用；异步框架在“高并发 I/O 场景”才明显有优势，CPU 密集型业务用异步意义不大。**hataftech+1

## 概念和典型框架

- 同步（sync）
    - 处理模型：每个请求同步执行，I/O 时阻塞当前线程/进程。builtin+1
    - 典型：Flask、Django（默认模式）、Requests 等。[[dev](https://dev.to/engrmark/synchronous-vs-asynchronous-in-python-understanding-the-key-differences-d7g)]​
- 异步（async）
    - 处理模型：基于事件循环，I/O 使用非阻塞调用，可以在等待期间切换处理其他请求。superfastpython+1
    - 典型：FastAPI、Sanic、aiohttp、Django+ASGI（Channels）、基于 asyncio 的各类框架。geekflare+2

## 能力和特点对比

|维度|同步框架|异步框架|
|---|---|---|
|编程模型|顺序、阻塞，代码直观，调试简单|基于 async/await，有事件循环，心智负担更高|
|并发能力|依赖多进程/多线程，几十~几百并发常见|单进程就能高并发（成百上千连接），适合大量 I/O|
|适用任务类型|CPU 密集、简单 I/O|I/O 密集（HTTP 调用、DB、外部 API、爬虫）|
|性能瓶颈|高频 I/O 时容易“线程堆积”|在 I/O 场景显著提升吞吐，CPU 场景提升不明显|
|生态成熟度|历史长、资料多、坑少|生态还在演进，需要理解 asyncio/ASGI 细节|

## 适用场景：什么时候用同步？

更适合同步框架的情况：reddit+1

- 小中型 Web 应用 / 内部管理后台：
    - 请求量不算很大，主要是经典 CRUD + 常规数据库访问。
- CPU 密集任务主导的服务：
    - 例如本地跑模型、做复杂计算，瓶颈在 CPU 而不是 I/O；这类场景 async 帮不上忙。
- 团队经验以同步为主、希望代码简单易读：
    - 同步代码更好 debug，也更适合新人快速上手。

实践上：很多公司后端业务仍大量使用 Flask / Django 同步模式，只在需要时局部引入异步组件。

## 适用场景：什么时候用异步？

更适合异步框架的情况：burr.apache+2

- 高并发 I/O 密集型服务：
    - 例如：
        - 网关 / BFF 层，需要同时调用多个下游 HTTP 服务。
        - 对外 API，大量短连接请求。
        - 爬虫、批量 HTTP 请求任务，动辄成百上千并发。
- 需要长连接 / 实时通信：
    - WebSocket、实时推送、聊天系统、在线协作、SSE 等，需要维护大量长连接。[[superfastpython](https://superfastpython.com/python-async-web-servers-and-frameworks/)]​
- 下游依赖有高延迟 I/O：
    - 调用外部第三方 API、慢数据库、云存储等，等待时间长，async 可以在等待时处理其他请求。hataftech+1

这些情况下，同样硬件上 async 一般能比 sync 扛更多并发，资源利用率更好。

## 注意点：异步并不是“到处都更快”

- 如果大部分时间在跑纯 Python 计算，async 带不来速度提升，还会引入额外复杂度。stackoverflow+1
- 如果并发规模很小（几十级别），线程/进程模型完全够用，reactor 模式反而增大心智成本。ramotion+1
- 异步栈要和依赖配套：你用的 DB 客户端、HTTP 客户端等也要提供 async 版本，否则中途加 `await` 意义有限。dev+1

## 实战选型建议

可以简单按下面规则来：

- 优先选同步框架（Flask / Django）：
    - 业务逻辑为主、并发不极端、团队经验以同步为主。
- 考虑选异步框架（FastAPI / aiohttp / Sanic）：
    - 需求中明确有：高并发 I/O、重度外部 API 调用、实时服务、WebSocket。
- 你也可以组合：
    - 用同步框架做主业务，用专门的异步服务或任务队列（Celery + aiohttp 等）处理高并发 I/O 场景。

如果你把自己一个具体项目（比如“高并发网关” / “内部管理后台” / “爬虫系统”等）说一下，我可以给到“同步 vs 异步”的具体推荐 + 框架选择。
