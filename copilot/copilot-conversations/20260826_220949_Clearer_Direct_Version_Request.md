---
epoch: 1787753389624
modelKey: "d29fd84b-5b44-4d98-b4ab-570006bd0449"
topic: "Clearer Direct Version Request"

tags:
  - copilot-conversation
---

**user**: 更清晰直接的版本
[Context: Notes: raw/03_Resources/Tools/2026-08-20-手机无线投屏.md]
[Timestamp: 2026/08/26 22:09:49]

**ai**: 
<think>The user is asking for a "更清晰直接的版本" (a clearer and more direct version) of the note content. The active note is about 手机无线投屏 (phone wireless screen mirroring) using scrcpy. The current note is quite long and verbose, with lots of troubleshooting details, repeated explanations, and multiple scenarios.

The user wants me to rewrite/summarize this into a clearer, more direct version. I should condense the content into a concise, actionable guide. Let me restructure it:

1. Current status: connected, device V2115A (Android 11), wireless debugging (TLS/mDNS)
2. Direct command to use
3. One-click script setup
4. Troubleshooting only if needed (brief)

Let me create a clean, direct version. The note should keep the essential commands and information but remove repetition and verbosity.

Key content to keep:
- Direct launch command: `.\scrcpy.exe --max-size=1600 --video-bit-rate=12M`
- If device not found: run `adb devices` first, then scrcpy
- One-click PowerShell script (mirror.ps1)
- Note about max-size=1600 matching actual 720×1600 resolution, so no quality loss
- Optional: lower latency settings `--max-fps=60 --video-bit-rate=8M`
- Brief troubleshooting: kill-server/start-server if needed

I should present this as a clean rewrite. Since this is the active note, I could offer to replace the content or just provide the rewritten version. The user said "更清晰直接的版本" - they likely want me to produce a clearer version. I'll write it out in a structured way.

Let me draft it in Chinese (the query is in Chinese).

---

# 手机无线投屏 (scrcpy)

## 现状
- 手机已通过无线调试连接，设备名 `V2115A`（vivo T1，Android 11）
- 无需重新配对或 `adb connect`

## 直接投屏
```powershell
.\scrcpy.exe --max-size=1600 --video-bit-rate=12M
```

## 一键启动脚本
在 `D:\Devtools\scrcpy41` 新建 `mirror.ps1`：

```powershell
$adb = Join-Path $PSScriptRoot 'adb.exe'
$scrcpy = Join-Path $PSScriptRoot 'scrcpy.exe'

& $adb start-server | Out-Null
Start-Sleep -Milliseconds 1200
& $adb devices | Out-Null
Start-Sleep -Milliseconds 500
& $scrcpy --max-size=1600 --video-bit-rate=12M
```

运行：
```powershell
Set-ExecutionPolicy -Scope Process Bypass
.\mirror.ps1
```

## 遇到 "Could not find any ADB device"
- 原因：ADB server 刚启动，mDNS 还没发现手机
- 解决：先执行 `.\adb.exe devices` 等 1-2 秒，再运行 scrcpy

## 备注
- 手机实际输出 720×1600，`--max-size=1600` 不压缩画质
- 若追求更低延迟：`--max-fps=60 --video-bit-rate=8M`

This is much cleaner. Should I present it as a replacement for the note? The user asked for a clearer direct version. I'll provide the rewritten content and ask if they want to replace the note, or just provide it. Given the instruction to use [[title]] format for note titles, I could mention the note. Let me just present the cleaner version and offer to update the note.

Actually, let me reconsider - the user might just want the content directly. I'll provide the clean version and say I can replace the note content if desired. I should keep it concise.</think>下面是更精简直接的版本，按“怎么用 → 脚本 → 遇到问题怎么办”组织：

---

## 手机无线投屏（scrcpy）

### 现状
- 手机已通过无线调试连接（设备名 `V2115A`，Android 11），**无需重新配对**。

### 直接投屏
```powershell
.\scrcpy.exe --max-size=1600 --video-bit-rate=12M
```

### 一键启动脚本
在 `D:\Devtools\scrcpy41` 新建 `mirror.ps1`：

```powershell
$adb = Join-Path $PSScriptRoot 'adb.exe'
$scrcpy = Join-Path $PSScriptRoot 'scrcpy.exe'

& $adb start-server | Out-Null
Start-Sleep -Milliseconds 1200
& $adb devices | Out-Null
Start-Sleep -Milliseconds 500
& $scrcpy --max-size=1600 --video-bit-rate=12M
```

运行：

```powershell
Set-ExecutionPolicy -Scope Process Bypass
.\mirror.ps1
```

### 遇到 "Could not find any ADB device"
- **原因**：ADB server 刚启动，mDNS 还没发现手机。
- **解决**：先执行 `.\adb.exe devices`，等 1-2 秒，再运行 scrcpy。

### 备注
- 手机实际输出 720×1600，`--max-size=1600` 不会压缩画质。
- 更看重低延迟可改用：`.\scrcpy.exe --max-fps=60 --video-bit-rate=8M`

---

需要我把 [[2026-08-20-手机无线投屏]] 的正文替换成这个版本吗？
[Timestamp: 2026/08/26 22:10:11]

**user**: 简洁版
[Context: Notes: raw/03_Resources/Tools/2026-08-19-电子书按章节拆分方案.md]
[Timestamp: 2026/08/26 22:11:06]

**ai**: 
<think>The user wants a concise version of the note "2026-08-19-电子书按章节拆分方案". This note is about splitting ebooks by chapters. It's quite long and detailed. The user asks for "简洁版" (concise version).

I should summarize the key points clearly and directly, similar to what I did for the previous note. Let me distill:

Main content:
1. EPUB splitting: Calibre + EpubSplit (recommended)
2. EPUB → Markdown for Obsidian/LLM: reader3 or manual parsing
3. PDF with bookmarks: PyMuPDF script (complete script provided)
4. CLI alternatives: pdfcpu, cpdf
5. Recommendation: EPUB first, PDF as fallback

I should condense this into a clean, actionable guide. Keep the essential commands/scripts but trim the verbosity. The PyMuPDF script is long — I can keep it but maybe simplify, or reference it more tersely. Actually for a concise version, maybe I should keep the core script but present it compactly. The user asked for 简洁版, so I'll produce a condensed version.

Let me structure:

## 电子书按章节拆分方案（简洁版）

### 核心思路
- 优先用 EPUB（结构天然好），PDF 依赖书签
- 目标决定方案：
  - 拆成多个 EPUB → Calibre + EpubSplit
  - 拆成 Markdown 进 Obsidian/LLM → reader3 或直接解析
  - PDF 拆章节 → PyMuPDF 脚本 / pdfcpu

### EPUB → 多个 EPUB (Calibre + EpubSplit)
1. 装 Calibre
2. 下载 EpubSplit 插件 ZIP → 首选项 → 插件 → 从文件加载
3. 导入书籍 → EpubSplit → 按 TOC 一级章节选切分点 → 生成 01_章节名.epub
4. 只适用于无 DRM

也可 CLI: `calibre-debug --run-plugin EpubSplit -- [options] input.epub [line-numbers...]`

### EPUB → Markdown (Obsidian/LLM)
目录结构：
```
英语教材/
  00-目录.md
  Unit 01 教育 Education/
    01-一般词汇 General Words.md
    ...
```
每章开头 YAML:
```yaml
---
book: 英语教材
unit: Unit 1 教育 Education
chapter: 04 学生、学位 Student, Degree
source: original.epub
---
```
reader3 适合边读边复制章节给 LLM。

### PDF（有书签）→ 章节 PDF
PyMuPDF 脚本（保存为 split_pdf_by_bookmarks.py）:

```python
from __future__ import annotations
import re, sys
from pathlib import Path
import pymupdf

def safe_name(name, max_len=100):
    name = re.sub(r'[<>:"/\\|?*\x00-\x1f]', "_", name)
    name = re.sub(r"\s+", " ", name).strip(" .")
    return (name or "untitled")[:max_len]

def split_by_bookmark_level(input_file, output_dir, level=1):
    output_dir.mkdir(parents=True, exist_ok=True)
    with pymupdf.open(input_file) as src:
        toc = src.get_toc(simple=True)
        chapters = [(t, p-1) for l, t, p in toc if l == level and p > 0]
        if not chapters:
            raise RuntimeError(f"没有找到第 {level} 级书签")
        for i, (title, start) in enumerate(chapters, 1):
            end = (chapters[i][1] - 1) if i < len(chapters) else src.page_count - 1
            if end < start: continue
            out = pymupdf.open()
            out.insert_pdf(src, from_page=start, to_page=end)
            out.save(output_dir / f"{i:02d}_{safe_name(title)}.pdf", garbage=4, deflate=True)
            out.close()
            print(f"{i:02d}_{safe_name(title)}.pdf: 第 {start+1}-{end+1} 页")

if __name__ == "__main__":
    split_by_bookmark_level(Path(sys.argv[1]), Path(sys.argv[2]), int(sys.argv[3]) if len(sys.argv) > 3 else 1)
```

用法：
```bash
pip install pymupdf
python split_pdf_by_bookmarks.py book.pdf chapters 1
```

### 替代 CLI
- pdfcpu: `pdfcpu split -m bookmark book.pdf output/`
- cpdf: `cpdf -split-bookmarks 0 book.pdf -utf8 -o @B.pdf`

### 建议
1. EPUB → EpubSplit 按 Unit 拆
2. 再转 Markdown 进 Obsidian
3. PDF 有书签才用脚本，没书签手工给起始页表
4. 阅读时用 reader3

That's a good concise version. Note the original script had some weird artifacts: `chapters[index] [github](...) - 1` — that's corrupted content in the note where URLs got pasted into code. I should clean that up to `chapters[index][1] - 1`. Also `Path(sys.argv [github](...))` artifacts. I'll clean those in my version.

The user's query is just "简洁版" — they want a concise version of this note. I'll provide it, similar to before, and ask if they want to update the note. Keep the response in Chinese.</think>以下是精简版：

---

## 电子书按章节拆分方案

### 核心思路
- **EPUB**：结构天然可拆，优先使用。
- **PDF**：靠书签（outline）定位章节。
- 按目标选工具：

| 目标 | 方案 |
|---|---|
| EPUB → 多个 EPUB | **Calibre + EpubSplit** |
| EPUB → Markdown（Obsidian/LLM） | 自行解析或 reader3 |
| PDF（有书签）→ 章节 PDF | **PyMuPDF 脚本** |
| PDF → CLI 快速拆 | pdfcpu / cpdf |

### 1. EPUB → 独立 EPUB：Calibre + EpubSplit
1. 安装 [Calibre](https://calibre-ebook.com/)，下载 [EpubSplit](https://github.com/JimmXinu/EpubSplit/releases) 插件 ZIP。
2. `首选项 → 插件 → 从文件加载插件`。
3. 导入书籍 → 调用 EpubSplit → 按 TOC 一级章节切分 → 输出 `01_章节名.epub`。

CLI 方式：
```bash
calibre-debug --run-plugin EpubSplit -- input.epub [line-numbers...]
```

### 2. EPUB → Markdown（Obsidian）
产出目录结构：

```text
英语教材/
  Unit 01 教育 Education/
    01-一般词汇 General Words.md
    02-教育机构 Educational Institution.md
```

每章开头加 YAML 定位信息：

```yaml
---
book: 英语教材
unit: Unit 1 教育 Education
chapter: 04 学生、学位 Student, Degree
source: original.epub
---
```

阅读时逐章复制给 LLM，可直接用 [Karpathy reader3](https://github.com/karpathy/reader3)（本地 Web 阅读器，一次显示一章）。

### 3. PDF（有书签）→ 章节 PDF：PyMuPDF
保存为 `split_pdf_by_bookmarks.py`：

```python
import re, sys
from pathlib import Path
import pymupdf

def safe_name(name, max_len=100):
    name = re.sub(r'[<>:"/\\|?*\x00-\x1f]', "_", name)
    name = re.sub(r"\s+", " ", name).strip(" .")
    return (name or "untitled")[:max_len]

def split_by_bookmark_level(input_file, output_dir, level=1):
    output_dir.mkdir(parents=True, exist_ok=True)
    with pymupdf.open(input_file) as src:
        toc = src.get_toc(simple=True)
        chapters = [(t, p - 1) for l, t, p in toc if l == level and p > 0]
        if not chapters:
            raise RuntimeError(f"没有找到第 {level} 级书签")
        for i, (title, start) in enumerate(chapters, 1):
            end = (chapters[i][1] - 1) if i < len(chapters) else src.page_count - 1
            if end < start:
                continue
            out = pymupdf.open()
            out.insert_pdf(src, from_page=start, to_page=end)
            out.save(output_dir / f"{i:02d}_{safe_name(title)}.pdf",
                     garbage=4, deflate=True)
            out.close()
            print(f"{i:02d}_{safe_name(title)}.pdf: 第 {start+1}-{end+1} 页")

if __name__ == "__main__":
    split_by_bookmark_level(
        Path(sys.argv[1]), Path(sys.argv[2]),
        int(sys.argv[3]) if len(sys.argv) > 3 else 1,
    )
```

用法：
```bash
uv add pymupdf   # 或 pip install pymupdf
uv run python split_pdf_by_bookmarks.py book.pdf chapters 1
# 若 Unit 在第二级书签，level 改为 2
```

### 4. CLI 替代方案
```bash
pdfcpu split -m bookmark book.pdf output/
cpdf -split-bookmarks 0 book.pdf -utf8 -o @B.pdf
```

### 建议链路
1. **EPUB 优先** → Calibre + EpubSplit 按 Unit 拆成多个 EPUB；
2. 需要进 Obsidian/LLM 时再转 Markdown，保留书名/Unit/章节 YAML；
3. PDF 有书签才用 PyMuPDF 脚本；没书签则手工提供章节起始页表再批量切分；
4. 阅读时用 reader3 逐章与 LLM 对话。

---

需要我把 [[电子书按章节拆分方案]] 正文替换成这个版本吗？
[Timestamp: 2026/08/26 22:11:20]