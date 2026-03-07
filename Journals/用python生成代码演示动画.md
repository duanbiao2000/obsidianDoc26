用 Python 生成“代码演示动画”（如展示代码执行过程、变量变化、算法可视化），最核心库是 **Manim**（数学动画框架）和 **Matplotlib Animation**（简单图表动画），再结合 **Pygame**（交互游戏式演示）。matplotlib+2  
这些技术能用纯代码控制动画帧、对象变换、渲染视频，适合教学/演示代码逻辑。smashingmagazine+1

## Manim（推荐首选：最专业、代码驱动）

Manim 是 3Blue1Brown 风格的数学/代码动画库，用 Python 类定义场景和动画。manim+1  
核心技术：Mobjects（数学对象，如文本、代码块、箭头）、Transform（变换动画，如代码行高亮、变量更新）、Scene（场景管理）。reddit+1  
渲染成 MP4/GIF：`manim -pql file.py SceneName`，支持 LaTeX 公式。[[youtube](https://www.youtube.com/watch?v=Uy7ceou-iVs)]​  
示例：动画展示排序算法中数组交换，用 `self.play(Transform(arr[i], arr[j]))`。[[github](https://github.com/manimCommunity/manim)]​

## Matplotlib Animation（简单数据/图表演示）

用 `matplotlib.animation.FuncAnimation` 或 `ArtistAnimation` 创建帧序列动画，适合可视化代码输出如图表变化。stackoverflow+1  
核心技术：`update()` 函数每帧更新 plot 数据（模拟代码迭代），`save('anim.gif')` 导出。geeksforgeeks+1  
易上手，无需 GUI：如动画显示循环中变量轨迹。[[matplotlib](https://matplotlib.org)]​

## Pygame（交互/实时演示）

Pygame 适合实时运行的交互代码演示动画，如算法图遍历、代码执行模拟。[[github](https://github.com/aditikute24/python-animation)]​[[youtube](https://www.youtube.com/watch?v=z14lm74wK40)]​  
核心技术：主循环 + `clock.tick(60)` 控制帧率，`screen.blit()` 绘制代码文本/节点，事件处理模拟“step by step”。[[youtube](https://www.youtube.com/watch?v=z14lm74wK40)]​  
适合游戏化演示，但导出视频需额外 ffmpeg。[[reddit](https://www.reddit.com/r/Python/comments/7yomou/python_libraries_for_animations_and_generative_art/)]​

## 其他辅助库/工具

- **Plotly**：交互 web 动画，`fig.show()` 直接浏览器播放代码结果变化。[[plotly](https://plotly.com/python/animations/)]​

- **MoviePy**：后处理视频剪辑/叠加代码截图。[[reddit](https://www.reddit.com/r/Python/comments/7yomou/python_libraries_for_animations_and_generative_art/)]​

- **Cairo + FFmpeg**（Manim 底层）：矢量渲染高质量视频。[[reddit](https://www.reddit.com/r/manim/comments/g6gtbe/how_does_manim_work/)]​

如果你想具体 demo（如排序动画），告诉我算法类型，我可以给代码片段！[[youtube](https://www.youtube.com/watch?v=Uy7ceou-iVs)]​
