这个网页是 skills.sh 上的一个“技能（skill）”页面：**python-performance-optimization**，来自仓库 `wshobson/agents`，用于指导如何对 Python 代码进行性能分析与优化，并提供安装命令与大量示例代码。[[skills](https://skills.sh/wshobson/agents/python-performance-optimization)]​

## 页面在讲什么

它定位为一份“Python 性能优化”综合指南，覆盖性能剖析（profiling）、瓶颈定位、CPU/内存/I/O 优化与实现层面的最佳实践。[[skills](https://skills.sh/wshobson/agents/python-performance-optimization)]​  
页面也给出用 `npx skills add ... --skill python-performance-optimization` 来安装该 skill 的方式。[[skills](https://skills.sh/wshobson/agents/python-performance-optimization)]​

## 适用场景

列出典型使用时机：定位性能瓶颈、降低延迟、优化 CPU 密集任务、减少内存占用/排查内存泄漏、改进数据库查询、优化 I/O、加速数据处理流水线、以及对生产环境进行性能分析等。[[skills](https://skills.sh/wshobson/agents/python-performance-optimization)]​

## 核心内容结构

- Profiling 类型：CPU profiling、memory profiling、line profiling、call graph（调用关系可视化）。[[skills](https://skills.sh/wshobson/agents/python-performance-optimization)]​

- 常见性能指标：执行时间、内存使用、CPU 利用率、I/O 等待时间。[[skills](https://skills.sh/wshobson/agents/python-performance-optimization)]​

- 优化策略分类：算法与数据结构、代码实现技巧、并行化、缓存、以及用 C/Rust 等原生扩展加速关键路径。[[skills](https://skills.sh/wshobson/agents/python-performance-optimization)]​

## 主要工具与模式示例

页面按“Pattern”给出大量可复制的示例，包括：`timeit` 计时、`cProfile/pstats`、`line_profiler`、`memory_profiler`、`py-spy`（生产环境采样与火焰图）、以及常见代码层优化（列表推导 vs 循环、生成器节省内存、`join` 拼接字符串、dict 查找、减少全局变量访问与函数调用开销等）。[[skills](https://skills.sh/wshobson/agents/python-performance-optimization)]​  
还扩展到 NumPy 向量化、`functools.lru_cache` 缓存、`__slots__` 降内存、`multiprocessing` 处理 CPU-bound、`asyncio/aiohttp` 处理 I/O-bound、以及数据库批量写入与查询优化（如索引与 EXPLAIN）。[[skills](https://skills.sh/wshobson/agents/python-performance-optimization)]​

## 最佳实践与检查清单

强调“先 profile 再优化”“聚焦热点路径”“避免过早优化”“用内置函数与缓存”“批量 I/O/DB 操作”“对生产环境做剖析”等，并附带常见坑点与一份可勾选的性能检查清单（profile、数据结构、缓存、DB、生成器、并发、内存泄漏、优化前后基准测试等）。[[skills](https://skills.sh/wshobson/agents/python-performance-optimization)]​
