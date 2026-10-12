---
title:
date:
tags:
aliases:
  - Github榜单
cssclasses:
status: in-progress
rating:
due:
source:
domain:
core_concepts:
---
有。检索下来，除你已经提到的 Trendshift、DeepWiki、Zread，我建议优先看 **LibHunt**、Star History、HelloGitHub、OpenAlternative、GitTrend 和 Show HN：它们分别补上“社区讨论热度、增长曲线、中文精选、同类替代品、上升榜单、早期新项目”这几种发现渠道。 [libhunt](https://www.libhunt.com/)

## 一、最接近 Live Trending：看什么项目正在升温

| 网站与入口 | 主要看点 | 适合怎么用 |
|---|---|---|
| [GitTrend](https://gittrend.io/) | 每日更新，按 Star 增长速度排列项目，定位就是发现正在上升的 GitHub 仓库。注意它和下面的 GitTrends 不是同一个网站。 [gittrend](https://gittrend.io/) | 作为 Trendshift 的补充榜单，交叉寻找新项目。 |
| [GitTrends](https://git-trends.github.io/) | 提供日、周、月趋势和编程语言维度，也能探索新创建的仓库，按 Stars 或 Forks 排序。 [git-trends.github](https://git-trends.github.io/) | 比起只追大项目，更适合额外挖一挖刚出现的小项目。 |
| [Star History](https://www.star-history.com/) | 不只是画 Star 历史曲线；首页还有 Weekly、All-time 等榜单，并支持比较多个项目的增长历史。 [star-history](https://www.star-history.com/) | 先用周榜发现项目，再用曲线比较几个同类候选。 |
| [GitHub Trending](https://github.com/trending) | 官方趋势入口，可切换日、周、月与语言维度。 [github](https://github.com/trending) | 作为对照基线，和第三方榜单一起看，而不是只依赖某一个排序。 |

这里我最推荐你补上 Star History。它把“发现项目”和“查看项目增长过程”放在了一起，与你已有的趋势榜入口互补，而不只是再增加一个相似列表。 [star-history](https://www.star-history.com/)

### OSSInsight：值得收藏，但当前要注意数据限制

[OSSInsight](https://ossinsight.io/) 本来是这一类里很值得关注的平台：覆盖 Stars、提交、PR、Issues、贡献者等指标，支持项目比较和按技术领域整理的 Collections。 [github](https://github.com/pingcap/ossinsight)

但这次查看其官网时，首页明确写着：

- 基于 Star 的排名已经暂停。
- 由于 GitHub 公共事件流分页变化，平台对 2025 年中以来的 Star、PR 和 Issue 事件采集严重不足。
- 2025 年 5 月以前的历史、从 GitHub 直接同步的仓库总量，以及提交活动不受影响。 [ossinsight](https://ossinsight.io/)

所以，目前更适合把它当作“分类目录和项目分析工具”，不宜把它的相关事件增量当作最新趋势依据。它的部分分类页搜索摘要仍然展示排名介绍，但使用时应以首页的数据警告为准。 [ossinsight](https://ossinsight.io/)

## 二、比 Star 榜更有补充价值：社区讨论与早期发现

这类入口看的不只是“谁涨了多少 Star”，而是“大家在讨论什么”和“作者刚做出了什么”。

### 1. LibHunt：发现热门项目，也找同类替代品

入口：[libhunt.com](https://www.libhunt.com/)

它跟踪开发者社区中对开源项目和软件库的提及，首页提供 Trending projects、Latest discoveries 和 Popular Topics；其同类推荐还结合社区共同提及、用户推荐和项目比较。 [libhunt](https://www.libhunt.com/)

值得关注的原因：

- 发现维度不同于单纯 Star 排名：它能补上社区讨论信号。
- 找到一个项目后，可以继续探索相关项目和替代品。
- 对“我已经知道一个工具，但还想看看同类方案”尤其有用。 [libhunt](https://www.libhunt.com/)

结合你经常比较本地 AI、自动化和开源工具的需求，这是我会优先加入书签的网站。

### 2. Hacker News · Show HN：发现尚未登上 GitHub 热榜的项目

入口：[Show HN](https://news.ycombinator.com/show)

这是作品展示频道，当前页面就包含直接链接 GitHub 的项目，例如自托管 AI 代码沙箱；其他页面也能看到本地优先笔记工具、Linux 工具、视频处理和开发工具等项目。 [news.ycombinator](https://news.ycombinator.com/show)

它的价值在于：

- 你能从“作者展示作品”这个入口发现候选，而不必等它进入 GitHub 热榜。
- 展示页通常附带社区讨论，可以一起看项目受到怎样的反馈。
- 并非所有作品都开源，也并非都托管于 GitHub，需要逐项确认。 [news.ycombinator](https://news.ycombinator.com/show)

如果你的目标是“更早看到有意思的新东西”，我会把它排在再增加一个普通趋势镜像站之前。

## 三、中文精选：减少刷榜和读 README 的成本

| 网站与入口 | 特点 | 对你的用途 |
|---|---|---|
| [HelloGitHub](https://hellogithub.com/) | 专注发现和分享有趣、入门级开源项目；其“热点速览”也会结合 GitHub Trending 和 Hacker News 热帖，以新发布、实用、有趣为筛选方向。 [hellogithub](https://hellogithub.com/) | 快速理解项目用途，再决定是否去 GitHub 深挖。 |
| [GitHubDaily](https://github.com/GitHubDaily/GitHubDaily) | 持续整理高质量、有趣、实用的开源项目、教程、开发者工具和技术资讯。 [github](https://github.com/githubdaily/githubdaily) | 适合找实用工具和自动化方案，也能回查分类整理。 |

这两个不是纯粹的实时数据榜单，而是内容筛选渠道。对你来说，它们与 DeepWiki、Zread 的关系更像是“先帮你挑出值得了解的项目，再进入项目理解阶段”。Zread 本身也有 Discover 和 Trending Repos 入口，因此它兼有发现与阅读入口。 [hellogithub](https://hellogithub.com/)

## 四、按需求发现：开源替代品目录

如果你想找的是“能替代某个软件、接入自己工作流的工具”，以下两个网站往往比综合热榜更直接。

### 1. OpenAlternative

入口：[openalternative.co](https://openalternative.co/)  
趋势页：[Trending](https://openalternative.co/collections/trending)

主站整理日常 SaaS 产品的开源替代品；此外，它有单独的趋势集合，按最近 30 天 GitHub Star 增长率而不是总 Star 数排序。 [openalternative](https://openalternative.co/collections/trending)

因此它兼顾两种用途：

- 按需求找工具：例如先确定需要哪类软件，再寻找开源方案。
- 看新兴替代品：用增长率榜补充传统总 Star 排名。 [openalternative](https://openalternative.co/collections/trending)

对你偏好的开源、本地或可自托管方案来说，这个方向比只看“全站最热项目”更有针对性；不过具体项目是否支持本地部署，仍需检查各自说明。

### 2. OpenSourceAlternative.to

入口：[opensourcealternative.to](https://www.opensourcealternative.to/)

它也是专门整理商业软件开源替代品的目录，首页提供数百个候选。 [opensourcealternative](https://www.opensourcealternative.to/)

与 OpenAlternative 相比，我会把它作为第二个目录交叉查询，而不是当成实时 GitHub 趋势站。

## 五、低频跟踪：不必每天刷网页

### Console.dev

入口：[console.dev](https://console.dev/)

它是免费的开发工具周刊，每周四发布，提供历史评测和 RSS；官方说明每周挑选并评测 2–3 个开发工具，也关注 Beta 版本。 [console](https://console.dev/)

这类入口适合你的原因是：不用每天翻几十个仓库，而是定期接收少量经过筛选的工具介绍。需要注意，它面向开发工具整体，不保证每个推荐都是开源项目或 GitHub 仓库。 [console](https://console.dev/selection-criteria)

## 六、我建议你实际保留的组合

没必要把所有网站都变成每日必刷项。结合你关注本地 AI、开发工具、自动化和知识管理的方向，我会这样分工：

| 目的 | 推荐入口 | 为什么这样搭配 |
|---|---|---|
| 看当前热度 | 你已有的 Trendshift + Star History | 一个看当前上升项目，一个看周榜和增长历史。 [trendshift](https://trendshift.io/) |
| 扩展同类候选 | LibHunt | 同时覆盖社区热度、相关项目和替代品。 [libhunt](https://www.libhunt.com/) |
| 发现早期新作品 | Show HN | 补上作者展示和社区反馈这个入口。 [news.ycombinator](https://news.ycombinator.com/show) |
| 找实用中文推荐 | HelloGitHub + GitHubDaily | 以人工筛选和中文介绍降低初筛成本。 [hellogithub](https://hellogithub.com/) |
| 按需求找开源工具 | OpenAlternative | 兼有替代品目录和近 30 天增长率榜。 [openalternative](https://openalternative.co/) |
| 定期接收少量精选 | Console.dev 的 RSS | 每周精选，避免把发现项目变成持续刷榜。 [console](https://console.dev/) |

如果只新增三个书签，我的选择是：LibHunt、Star History、OpenAlternative。它们分别补上“同类发现”“增长验证”“需求导向”三种能力，比再添加三个类似的热榜更互补。 [libhunt](https://www.libhunt.com/)

