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

> Generating an executive summary of the video

> Emulating Key points from the video:

1. Start from “what moves the needle”
    
    - 每天先问：对产品/业务现在最有价值的事情是什么（比如本视频里先做订阅 Analytics 总览），而不是先做好玩、好看的功能。[[youtube](https://www.youtube.com/watch?v=uMFAgOLppDk&t=4s)]​
        
2. 先想数据流，再写代码
    
    - 从「需要在前端展示什么信息」反推后端 DTO 结构，再设计查询与分类逻辑（active / churn / transactions 等），尽量让前端拿到即用的数据，减少前端计算。[[youtube](https://www.youtube.com/watch?v=uMFAgOLppDk&t=4s)]​
        
3. 新功能从 UX 开始分解
    
    - 做多订阅层级时，先想：
        - 页面上按钮和多个订阅选项怎么展示。
        - 哪个订阅是“主订阅”、如何让创作者选择优先展示的 tier。
        - 删除、隐藏订阅时，用户体验会发生什么。[[youtube](https://www.youtube.com/watch?v=uMFAgOLppDk&t=4s)]​
            
4. 系统性考虑边界与约束
    
    - 设计多价格、多货币、多 tier 时，提前问清：
        - 是否允许重复价格。
        - 删除订阅但还有活跃订阅者时怎么办（软删除、前端隐藏但后台保留数据）。
        - 是否允许从前端 checkout 中移除某个 tier 但保留历史订阅者。[[youtube](https://www.youtube.com/watch?v=uMFAgOLppDk&t=4s)]​
            
5. 后端规则优先、防蠢保护
    
    - 不仅前端要阻止无意义操作（如创建重复价格），后端也要有 hard guard（例如同用户同价格同货币只能有一条），避免数据层混乱。[[youtube](https://www.youtube.com/watch?v=uMFAgOLppDk&t=4s)]​
        
6. 拆问题、简化再推进
    
    - 当逻辑变复杂（连接 Discord/Telegram、多个价格对应不同权限）时，他会先画图，把「连接」和「价格/权限」分离，再一步步重构，而不是一口吃掉全部复杂度。[[youtube](https://www.youtube.com/watch?v=uMFAgOLppDk&t=4s)]​
        
7. 审慎对待“删除”和历史数据
    
    - 对订阅这种牵涉真实付费和权限的对象，尽量不用硬删除，而是软删除并继续显示关键数据（如某 tier 仍有 20 个订阅者），保证创作者不会因为 UI 隐藏而搞不清现状。[[youtube](https://www.youtube.com/watch?v=uMFAgOLppDk&t=4s)]​
        
8. 清楚区分“当下优先级”和“以后再说”
    
    - 即便他很想先做漂亮的主题和 UI，仍然把多订阅 tier、免费试用等直接影响收入和创作者体验的功能排在更前面，把 purely cosmetic 的改动留到之后。[[youtube](https://www.youtube.com/watch?v=uMFAgOLppDk&t=4s)]​

