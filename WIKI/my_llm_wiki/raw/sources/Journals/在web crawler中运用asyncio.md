在 web crawler 里用 `asyncio` 的核心思路就是：**把大量 I/O 请求（HTTP 请求、解析队列等）变成协程并发执行**，典型组合是 `asyncio + aiohttp`。 [scrapingbee](https://www.scrapingbee.com/blog/async-scraping-in-python/)

## 最小可用示例：并发抓很多 URL

```python
import asyncio
import aiohttp

async def fetch(session: aiohttp.ClientSession, url: str) -> str:
    try:
        async with session.get(url, timeout=10) as resp:
            resp.raise_for_status()
            return await resp.text()
    except Exception as e:
        print(f"error fetching {url}: {e}")
        return ""

async def crawl(urls: list[str]) -> list[str]:
    async with aiohttp.ClientSession() as session:
        tasks = [asyncio.create_task(fetch(session, url)) for url in urls]
        # 并发抓取所有 URL
        html_list = await asyncio.gather(*tasks)
        return html_list

if __name__ == "__main__":
    urls = [
        "https://example.com",
        "https://www.python.org",
        "https://www.baidu.com",
    ]
    html_pages = asyncio.run(crawl(urls))
    print(len(html_pages), "pages fetched")
```
这里 `fetch` 是协程，`asyncio.gather` 会把多个请求一起挂到事件循环里并发执行，而不是一个个阻塞等待。 [stackoverflow](https://stackoverflow.com/questions/35926917/asyncio-web-scraping-101-fetching-multiple-urls-with-aiohttp)

## 控制并发：Semaphore 防止打爆对方站点

```python
import asyncio
import aiohttp

SEM = asyncio.Semaphore(10)  # 限制最多 10 个并发请求

async def fetch(session, url):
    async with SEM:  # 进入临界区，超过 10 就会等待
        async with session.get(url) as resp:
            return await resp.text()

async def crawl(urls):
    async with aiohttp.ClientSession() as session:
        tasks = [asyncio.create_task(fetch(session, u)) for u in urls]
        return await asyncio.gather(*tasks)
```

使用 semaphore 是实际生产中很常见的模式，用来平衡“抓得快”和“不被封”。 [pythontutorials](https://www.pythontutorials.net/blog/asyncio-web-scraping-101-fetching-multiple-urls-with-aiohttp/)

## 用队列管理 URL：BFS/DFS + 去重

更完整一点的 crawler 会有“发现新链接 -> 入队 -> worker 消费”的流程，这里 `asyncio.Queue` 非常好用。 [aosabook](https://aosabook.org/en/500L/a-web-crawler-with-asyncio-coroutines.html)

```python
import asyncio
import aiohttp
from urllib.parse import urljoin, urldefrag
from bs4 import BeautifulSoup

class AsyncCrawler:
    def __init__(self, root: str, max_tasks: int = 10):
        self.root = root
        self.seen: set[str] = set()
        self.queue: asyncio.Queue[str] = asyncio.Queue()
        self.max_tasks = max_tasks

    async def fetch(self, session, url):
        async with session.get(url) as resp:
            if resp.status != 200:
                return ""
            return await resp.text()

    async def handle_url(self, session):
        while True:
            url = await self.queue.get()
            try:
                if url in self.seen:
                    continue
                self.seen.add(url)
                html = await self.fetch(session, url)
                if not html:
                    continue

                # 解析 HTML，提取链接
                soup = BeautifulSoup(html, "html.parser")
                for a in soup.find_all("a", href=True):
                    href = urljoin(url, a["href"])
                    href, _ = urldefrag(href)  # 去掉 fragment
                    if href.startswith(self.root) and href not in self.seen:
                        await self.queue.put(href)
            finally:
                self.queue.task_done()

    async def run(self):
        async with aiohttp.ClientSession() as session:
            await self.queue.put(self.root)
            workers = [
                asyncio.create_task(self.handle_url(session))
                for _ in range(self.max_tasks)
            ]
            await self.queue.join()      # 等队列清空
            for w in workers:
                w.cancel()               # 结束 worker

async def main():
    crawler = AsyncCrawler("https://example.com", max_tasks=10)
    await crawler.run()
    print("total pages:", len(crawler.seen))

if __name__ == "__main__":
    asyncio.run(main())
```

这里 asyncio 的几个典型用法都出现了：  
- `asyncio.Queue` 做 URL 任务池（生产者/消费者模式）。 [andreygubarev](https://andreygubarev.com/web-crawler-with-python-asyncio.html)
- 多个 worker 协程 `handle_url` 并发消费任务。 [andreygubarev](https://andreygubarev.com/web-crawler-with-python-asyncio.html)
- `queue.join()` 等待所有任务处理完，再 `cancel` 掉 worker 做优雅退出。 [aosabook](https://aosabook.org/en/500L/a-web-crawler-with-asyncio-coroutines.html)

## 设计要点与最佳实践

- 永远复用一个 `aiohttp.ClientSession`，不要每个请求新建 session，会慢也浪费连接。 [scrapingbee](https://www.scrapingbee.com/blog/async-scraping-in-python/)
- 用 `asyncio.gather` 或 `create_task` 管理一批协程；对大量 URL 时配合 semaphore/queue 控制并发。 [stackoverflow](https://stackoverflow.com/questions/35926917/asyncio-web-scraping-101-fetching-multiple-urls-with-aiohttp)
- 做好异常处理、重试、超时，避免单个失败卡死整个抓取流程。 [stackoverflow](https://stackoverflow.com/questions/56840527/fetch-multiple-urls-with-asyncio-aiohttp-and-retry-for-failures)
- 尊重 robots.txt、User-Agent、限速（`asyncio.sleep` 小延时）等，不然很容易被封 IP。 [pythontutorials](https://www.pythontutorials.net/blog/asyncio-web-scraping-101-fetching-multiple-urls-with-aiohttp/)

如果你贴一下你现在的 crawler 代码结构（同步版也可以），我可以直接帮你改成一版基于 `asyncio + aiohttp + Queue` 的版本。