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
source: https://github.com/openai/openai-cookbook/blob/main/articles/what_makes_documentation_good.md
---
这篇文章里有几个我觉得对你这种经常写技术文档的人特别有价值的洞见： [github](https://github.com/openai/openai-cookbook/blob/main/articles/what_makes_documentation_good.md)

### 1. 把“可扫读性”当成首要目标  
- 绝大多数人不会从头到尾顺着读，而是疯狂上下扫，只看对自己有用的段落。 [github](https://github.com/openai/openai-cookbook/blob/main/articles/what_makes_documentation_good.md)
- 所以要用清晰的小节标题、目录、短段落、列表和表格，把信息切成易扫的块，让读者几秒钟就知道“这一段值不值得看”。 [github](https://github.com/openai/openai-cookbook/blob/main/articles/what_makes_documentation_good.md)
- 段落第一句要能独立理解，像“摘要版结论”，不依赖上一段，否则扫读时完全抓不到重点。 [github](https://github.com/openai/openai-cookbook/blob/main/articles/what_makes_documentation_good.md)

### 2. 标题要直接给结论，而不是抽象名词  
- 相比“Results”这种空标题，“Streaming reduced time to first token by 50%”直接把有价值的信息塞进标题里，让读者不点进去就知道你要说什么。 [github](https://github.com/openai/openai-cookbook/blob/main/articles/what_makes_documentation_good.md)
- 一篇长文如果每个小节标题都像这样“信息密度高”，整篇文档的体验会好一个维度。  

### 3. 写作风格要降低“解析负担”  
- 避免让读者在脑子里“悬着”很多未完成的信息，比如左分支句子那种，把真正的主干拖到句末；更推荐“先说框架，再补细节”的右分支句子。 [github](https://github.com/openai/openai-cookbook/blob/main/articles/what_makes_documentation_good.md)
- 尽量让句子在语法和语义上都**不含糊**，比如用“Write section titles as sentences”取代“Title sections with sentences”，避免读者在前几个词就猜错词性。 [github](https://github.com/openai/openai-cookbook/blob/main/articles/what_makes_documentation_good.md)
- 少用“this/that”这种指示代词，尤其跨句；直接重复具体名词（比如“function calling”），减少读者在上下文里来回找指代。 [github](https://github.com/openai/openai-cookbook/blob/main/articles/what_makes_documentation_good.md)

### 4. 假定读者背景差异巨大，而不是只面向专家  
- 即使你面向的是“经验丰富的开发者”，文档也应该照顾英语非母语、刚入门某语言或某框架的读者，所以建议“写得比你直觉上认为的更简单一点”。 [github](https://github.com/openai/openai-cookbook/blob/main/articles/what_makes_documentation_good.md)
- 多解释一些“看似基础”的步骤（比如安装依赖、环境变量配置），对专家的成本很低，但对新人是卡点；遗漏这些说明会直接让一部分人放弃。 [github](https://github.com/openai/openai-cookbook/blob/main/articles/what_makes_documentation_good.md)

### 5. 对术语和示例的取舍要“利他”  
- 尽量不用内部行话，优先选“对新人自解释”的术语，比如用“max token limit”而不是“context limit”。 [github](https://github.com/openai/openai-cookbook/blob/main/articles/what_makes_documentation_good.md)
- 代码示例要尽量通用、依赖少、可直接复制运行，不要让读者必须在多个页面来回跳才能跑通一个 demo。 [github](https://github.com/openai/openai-cookbook/blob/main/articles/what_makes_documentation_good.md)
- 示例绝不能教坏习惯，比如绝不在代码里硬编码 API Key，一旦写坏示例，很多人会原样照抄。 [github](https://github.com/openai/openai-cookbook/blob/main/articles/what_makes_documentation_good.md)

### 6. 最高原则是“同理心”，规则可以为读者让路  
- 文中最后明确说，这些“规则”都可以被打破，只要你有充分理由 —— 文档的本质是“把有用信息放进别人的脑子里”，一切以读者收益为准绳。 [github](https://github.com/openai/openai-cookbook/blob/main/articles/what_makes_documentation_good.md)
- 换句话说，不要为形式而形式，永远先问：对这个读者群体，此时此地，什么写法最帮得上忙。 [github](https://github.com/openai/openai-cookbook/blob/main/articles/what_makes_documentation_good.md)

如果你愿意，我可以帮你把你现有的一篇中文技术文档，按照这些原则一起“重排版+重写一小节”，做成一个实战版对照。

