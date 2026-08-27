---
title:
date:
tags:
aliases:
cssclasses:
status: in-progress
rating:
due:
source:
domain:
core_concepts:
---
针对 YouTube 和 B 站视频课程这种素材来源，整个 pipeline 可以拆成"取材"和"生成"两大块，取材阶段完全不需要大模型，生成阶段才是模型和 effort 该发力的地方。

## 完整 Pipeline 拆解

| 阶段 | 具体操作 | 是否需要大模型 | 工具 |
|---|---|---|---|
| 1. 下载视频/音频 | yt-dlp 拉取原视频+音频流 | 否 | yt-dlp |
| 2. 获取文字稿 | 优先用官方字幕，没有再用 Whisper 转录 | 否（Whisper 本身不是 LLM 推理） | yt-dlp + Whisper |
| 3. 知识点提取与卡片设计 | 判断哪些内容值得做卡片、如何拆分成最小信息单元 | **是，核心环节** | 强推理模型 |
| 4. 截图/插图提取 | 根据知识点时间戳截取对应画面 | 否 | ffmpeg |
| 5. 语音片段剪辑 | 根据时间戳切出对应音频 | 否 | ffmpeg |
| 6. 卡片文案润色排版 | 生成最终 Anki 正反面文本 | 是，但可轻量 | 中等模型 |

## 第一步：取字幕的优先级

YouTube 优先拿人工字幕，没有就用自动字幕，B 站类似但覆盖率较低，实在没字幕再走本地 Whisper 转录： [mcpservers](https://mcpservers.org/agent-skills/michalparkola/youtube-transcript)

```bash
# 优先尝试人工字幕
yt-dlp --write-sub --skip-download --sub-lang "zh-Hans,en" "URL"
# 没有则用自动字幕
yt-dlp --write-auto-sub --skip-download "URL"
```

如果视频完全没字幕（B 站很常见），走本地 Whisper 转录，这一步不占用你选的大模型额度，纯本地计算： [sendrec](https://sendrec.eu/blog/how-we-added-automatic-transcription-with-whisper/)

```bash
yt-dlp -x --audio-format mp3 "URL" -o audio.mp3
whisper audio.mp3 --model medium --language auto
```

`medium` 模型对中英混讲的技术课程精度足够，如果预算充足可以升到 `large-v3` 提高专业术语识别准确率。 [github](https://github.com/jonradoff/transcriptor/)

## 第二步：知识点提取——这是唯一该"烧"高 effort 的环节

拿到带时间戳的文字稿后，让模型做的事情是：判断哪些是核心概念、哪个时间段对应哪个知识点、要不要配图或配音。这一步直接决定卡片质量，建议用 high 或 xhigh effort 的旗舰模型，理由和之前讨论 CLAUDE.md 时的逻辑一致——这一步出错会级联影响后面所有卡片。 [learn.microsoft](https://learn.microsoft.com/en-us/azure/foundry/openai/how-to/reasoning)

Prompt 里务必让模型输出结构化 JSON，包含知识点、对应字幕时间戳区间、是否需要插图/语音，方便后续脚本自动调用 ffmpeg，例如：

```json
{"concept": "...", "start": "00:03:12", "end": "00:03:28", "needs_image": true, "needs_audio": false}
```

## 第三步：ffmpeg 按时间戳自动切图切音

模型输出的时间戳直接喂给脚本，不再经过任何大模型推理： [sendrec](https://sendrec.eu/blog/how-we-added-automatic-transcription-with-whisper/)

```bash
# 截取插图
ffmpeg -ss 00:03:20 -i video.mp4 -frames:v 1 image_01.jpg
# 截取语音片段
ffmpeg -ss 00:03:12 -to 00:03:28 -i video.mp4 -vn -acodec libmp3lame clip_01.mp3
```

## 第四步：卡片文案生成——可以降 effort

有了知识点和素材后，把文字稿片段+插图/音频路径丢给模型生成 Anki 正反面文案，这一步逻辑相对简单（遵循最小信息原则、格式规范），可以用 medium effort 甚至换一个更便宜的模型跑批量生成，再抽查修正。 [linkedin](https://www.linkedin.com/posts/naveenbalani_gpt5-promptengineering-aiproductivity-activity-7361322789439533056-d78g)

## Effort 与模型选择总结

- 知识点判断/结构化拆解：xhigh/high + 旗舰推理模型（如 GPT-5.x 或同级），这是唯一值得花钱花时间的环节。 [learn.microsoft](https://learn.microsoft.com/en-us/azure/foundry/openai/how-to/reasoning)
- 转录：本地 Whisper medium/large，不涉及 effort 参数，是纯 ASR 任务。 [sipsip](https://sipsip.ai/blog/open-source-video-transcriber)
- 卡片文案润色：medium 甚至 low，用性价比模型批量跑。 [qwe.edu](https://www.qwe.edu.pl/tutorial/reasoning-effort-levels-guide/)
- 下载/剪辑：全部脚本化，effort=none，不经过大模型。 [nxcode](https://www.nxcode.io/resources/news/gpt-5-4-api-developer-guide-reasoning-computer-use-2026)

B 站因为分辨率限制（默认常只给到 720p/480p），如果需要更清晰的插图，下载时要显式指定格式参数，否则默认拿到的画质可能不够做插图。 [github](https://github.com/yt-dlp/yt-dlp/issues/5655)

