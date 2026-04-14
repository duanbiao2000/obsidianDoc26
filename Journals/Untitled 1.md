---

title: "Why Everyone's Switching to Rust (And Why You Shouldn't)"  
type: note  
program: "IBM-GEN_AI_ENGINEERING"  
course: null  
module: null  
lecture: null  
start_date: null  
end_date: null  
tags: [rust, systems_programming, memory_safety, performance, language_choice, borrow_checker]  
source: "[https://www.youtube.com/watch?v=meEXag1XCFw](https://www.youtube.com/watch?v=meEXag1XCFw)"  
duration: "14:43"  
status: TODO  
aliases: ["Rust Hype vs Reality", "Why Everyone's Switching to Rust"]

---

## [[SOURCE INFORMATION]]

YouTube video by ForrestKnight (Aug 19, 2025) discussing why Rust is so hyped, where it genuinely excels, and why it still may not be the right choice for every team or project. The video mixes concrete case studies (Discord, Dropbox, Microsoft, AWS) with a developer-experience perspective on Rust's strengths, weaknesses, and tradeoffs.​

## [[LEARNING FOCUS]]

> [!tip] Learning Objectives
> After this material, you will be able to:
>
> 1. Explain Rust’s core promise of “memory safety without garbage collection” and how the borrow checker enforces it.​
>     
> 2. Compare Rust to C, C++, Go, and Zig in terms of performance, safety, and complexity.​
>     
> 3. Describe real-world Rust adoption stories (Discord, Dropbox, Microsoft, AWS) and what they actually gained.​
>     
> 4. Articulate the learning curve and mindset shift required to become productive with Rust.​
>     
> 5. Identify scenarios where Rust is a great fit and cases where other languages (like Go) are more pragmatic.​

## [[NOTES]]

## Introduction: Rust Hype and Central Question

- “Everyone's rewriting everything in Rust” — examples: Discord rewrote backend and got 10x performance; Dropbox spent four years rewriting their sync engine; Microsoft is putting Rust into Windows itself.​
- At the same time, Microsoft’s TypeScript team evaluated Rust and chose Go instead because it was easier to port TypeScript to Go within their constraints.​
- Rust keeps appearing in discussions that are not even about Rust, which raises the question: is Rust really that good, or is it just hype?​
- The video’s goal: after six months of learning Rust, look at the state of Rust in 2025 — what it actually is (performance, memory management), how it compares to other languages, why people are obsessed with it, what writing Rust feels like, and where it falls short.​

## Rust’s Core Promise: Memory Safety Without Garbage Collection

- Rust is presented as a **systems programming language** that promises a seemingly impossible combination: **memory safety without garbage collection**.​

> [!important] Core Rust Promise
> Rust guarantees memory safety at compile time without a garbage collector, aiming to be as fast as C, as safe as Java, and as expressive as Python.​

- C / C++ example: allocate a pointer with `malloc`, `free` it, then use it again; it compiles but creates a security vulnerability (use-after-free).​
- Microsoft has said that about 70% of their security bugs come from memory safety issues like these.​
- Java / Python avoid such bugs with a garbage collector (GC), but GC introduces performance overhead and unpredictable pauses.​
- Rust’s solution is the **borrow checker**:
    - Example: create a `Box`, drop it, then try to use it again in Rust.​
    - This code does **not** compile; the compiler catches the bug before the code runs.​
    - No runtime overhead, no GC, but also no memory safety bugs of this class.​
- Resulting marketing line: a language “as fast as C, as safe as Java, and as expressive as Python” — at least, that is the promise.​

## Comparing Rust to C, C++, Go, and Zig

- The speaker built a small CLI application in C, C++, Rust, Go, and Zig to compare the experience.​
- **C**:
    - Gives raw speed and complete control.​
    - Memory is managed manually with `malloc`/`free`.​
    - One mistake leads to segfaults or memory leaks.​
- **C++**:
    - Adds modern conveniences like vectors and smart pointers.​
    - Offers more abstraction but also high complexity.​
    - “There are like six different ways to do basically everything.”​
- **Go**:
    - Strips away complexity for simplicity and fast compilation.​
    - You lose some low-level control and some performance (this point is contentious; the speaker notes people argue with him about it).​
- **Zig**:
    - Described as “like C but with better tooling and compile-time safety.”​
    - Ecosystem is tiny; the language has been in beta (or similar status) for 8–9 years.​
    - Very low-level, “basically you’re shaking hands with the CPU.”​
- Rust:
    - Sits in a “unique sweet spot”: C-like performance and control, but borrow checker-enforced memory safety at compile time.​
    - Trade-off: you “fight the compiler upfront” and face what feels like never-ending borrow-checker bugs.​
    - The alternative is debugging crashes later; the speaker says he still prefers the borrow checker.​

## Rust Success Stories in Industry

## Discord

- Discord had a read state service implemented in Go with **two-minute garbage collection spikes**.​
- During these GC pauses, users saw the UI freeze.​
- They rewrote the service completely in Rust and:
    - Got **10x performance improvement**.​
    - Completely eliminated those GC pauses.​

## Dropbox

- Dropbox rewrote their entire desktop sync engine in Rust over four years, handling hundreds of billions of files.​
- Their takeaway quote: “Rust has been a force multiplier in our team.”​

## Microsoft and Windows

- Microsoft Azure’s CTO said: “It’s time to halt starting any new projects in C or C++.”​
- There was a call from Bjarne Stroustrup to “help save C++” because new projects were being built in Rust instead — even from people who wrote Windows in C++.​
- Microsoft has rewritten major Windows components in Rust:
    - Example: 152,000 lines of Rust for font rendering.​
    - Benefits: 5–15% performance improvements plus addressing the 70% security vulnerabilities attributed to memory safety issues.​

## AWS and Others

- AWS built **Firecracker**, a microVM for serverless computing, using Rust.​
- Rust is increasingly used in web development:
    - Frameworks and runtimes are being built in Rust.​
- CLI tools are a major Rust strength:
    - Examples mentioned: `ripgrep` (rg), `fd`, `bat`, `exa` (heard as “X”).
    - These tools are “so much faster than their traditional Unix equivalents” that people are switching entire toolchains.​
    - Example: grepping a massive codebase in milliseconds instead of seconds changes how you work.​

> [!note] Pattern in Success Stories
> Rust is adopted where performance and reliability directly affect user experience: real-time services, OS components, microVMs, and developer tools.​

## What It’s Like to Write Rust Day to Day

- Example: a simple function to find the largest item in a list:
    - Syntax looks normal but involves generics, trait bounds, and borrowing instead of owning.​
    - All constraints are checked at compile time by the borrow checker.​
- Learning Rust often means “fighting the borrow checker”: you write code that seems reasonable, and the compiler rejects it.​
- Example situation:
    - Create a vector.
    - Get a reference to the first element.
    - Try to push another element.
    - Compiler error: you cannot modify the vector while there is an active reference to its contents.​
- Early confusion examples:
    - Wondering when to use the `vec![]` macro vs. `Vec::new` (a “rabbit hole” when first learning).​
    - Initially writing Rust like Java, with `for` loops everywhere and not using iterators.​

> [!note] Learning Curve Moment
> The speaker describes a “click” moment when he finally learned ownership and realized the compiler is helping, not hindering, and questioned how he survived years of C++ without this model.​

- Common claim: it takes **3–6 months** to get comfortable with the borrow checker.​
- The speaker thinks this investment is worth it, partly because the tooling is strong:
    - `cargo` “just works” and error messages are very helpful, guiding you to fix problems.​

## Tooling: Cargo, Error Messages, and Compile Times

- Cargo:
    - Described as excellent but opinionated.​
    - Compared to Gradle:
        - Gradle lets you build any kind of infrastructure; you “never outgrow” it.​
        - Cargo is more constrained, though the speaker hasn’t built something large enough to fully test its limits.​
- Error messages:
    - Rust’s compiler messages are described as genuinely helpful; they often suggest specific fixes rather than just flagging errors.​
- Compile times:
    - Can be rough; even small projects can take 15–20 seconds to compile.​
    - Coming from hot-reload environments, this breaks workflow.​
    - A joke reference: the creator of Flash said the Rust community has a “collective Stockholm syndrome” around compile times.​

## Why Isn’t Everyone Using Rust?

## Learning Curve and Mindset Shift

- Rust’s learning curve is not just about time but also about mindset.​
- Rust forces explicit thinking about:
    - Ownership.
    - Borrowing.
    - Lifetimes.​
- For developers from garbage-collected languages, this is a completely different mental model.​
- Quoted observation:
    - “I’ve seen junior devs excel at Rust with no prior training and senior engineers struggle for weeks or even months or give up entirely.”​
    - It’s not about intelligence or overall experience; it is about whether your brain “clicks” with Rust’s way of thinking.​
- Onboarding times of 3–6 months make it hard for companies to hire someone and expect immediate productivity; this can create unacceptable bottlenecks.​

## Integration with Existing Systems

- Many organizations already have large Java, .NET, or C++ codebases.​
- Integrating Rust into these existing systems can be difficult and costly.​
- The benefits of Rust may not justify integration overhead for all projects.​

## Concept Fatigue

- Rust has many concepts:
    - Ownership.
    - Borrowing.
    - Lifetimes.
    - Traits.
    - Generics.
    - Macros.
    - `async/await`.​
- Each concept makes sense individually, but together they create a steep learning curve.​
- Comparison:
    - JavaScript developers talk about “framework fatigue.”​
    - Rust has “concept fatigue.”​

## Rust Rejection Stories: When Rust Is Not Chosen

## TypeScript Team Choosing Go

- TypeScript team liked Rust but chose Go when porting TypeScript.​
- Their goal: use the lowest-level language they could ship **within a reasonable time**.​
- Porting to Rust would have taken many years; porting to Go took about a year.​
- Attempts to use Rust involved:
    - Lots of `unsafe` code.
    - “Write your own garbage-collection style strategies.”​
- A quote from the TypeScript dev lead (paraphrased):
    - Rust succeeds wildly at its design goals.
    - “Straightforward to port to Rust from this particular Java codebase” is **not** one of those goals.​
- Key takeaway: Rust is amazing at what it was designed to do, but your specific needs may not align with those design goals.​

## Language Choice Is Contextual

- The speaker notes that whenever a team doesn’t choose Rust, the internet often asks, “Why not Rust?”​
- Reality:
    - Rust is excellent for **performance-critical systems, security-sensitive applications, and long-running services**.​
    - Rust may be a poor fit for:
        - Rapid prototyping.​
        - Teams with tight deadlines and no Rust experience.​
        - Projects with extensive legacy integration requirements where Rust’s benefits are outweighed by migration cost.​
- Ecosystem:
    - Mature for systems programming and CLI tools.​
    - Less mature for GUI development and machine learning.​
    - Community is growing, but adoption is uneven across domains.​

> [!note] Practical Rule of Thumb
> If you want speed to market, Go is often chosen; for game development, C++ is still dominant due to ecosystem; Rust fits where performance + safety + long-term reliability directly matter.​

## Conclusion: Hype vs Reality

- Rust is described as a genuinely impressive technology solving real, large-scale problems.​
- Performance gains and safety benefits in the cited case studies are real and measurable.​
- Technology is not a zero-sum game:
    - Different problems need different tools.
    - Organizational context often matters more than raw benchmarks.​
- You cannot just ask, “Should everyone use Rust?” without asking:
    - What problem are we solving?
    - What tradeoffs exist between languages?
    - What constraints (time, team skill, legacy systems) do we have?​
- Final stance:
    - Rust is not “just hype” — it is worthy of some hype.
    - Perhaps it gets more hype than it deserves because not everything needs to be rewritten in Rust.​
    - Rust is **carving out strategic positions** where its combination of performance, safety, and reliability provides clear business value.​
    - That is described as “sustainable technology adoption,” not hype.​

## [[EXAMPLES, PATTERNS, OR DEMONSTRATIONS]]

## Language Comparison Table (From Video Narrative)

|Language|Strengths|Weaknesses / Tradeoffs|
|---|---|---|
|C|Raw speed, full control over memory.​|Manual memory mgmt, easy to introduce serious security bugs.​|
|C++|Modern conveniences (vectors, smart pointers), powerful abstractions.​|High complexity, many ways to do everything, hard to reason about.​|
|Go|Simplicity, fast compilation, easy to learn.​|Less low-level control, some performance tradeoffs, GC pauses.​|
|Zig|C-like control with better tooling and compile-time safety.​|Tiny ecosystem, long beta period, very low-level.​|
|Rust|C-like performance + memory safety, expressive, strong tooling.​|Steep learning curve, concept fatigue, long compile times, integration costs.​|

## Rust Adoption Scenarios (ASCII Flow)

text

`Use Rust when: - You need performance-critical services   AND - Memory safety / security is a first-class requirement   AND - The team can invest months in learning Rust   AND/OR - You are building long-lived infra (OS, VM, critical backend) Use other languages when: - Time-to-market is top priority - You are deeply invested in an existing stack (Java, .NET, C++) - The problem is simple CRUD / scripting / glue code`

## Mindmap of Rust Pros and Cons

text

`mindmap   root((Rust in 2025))    Pros      Memory safety w/o GC      C-like performance      Strong tooling (cargo, errors)      Proven in industry (Discord, Dropbox, MS, AWS)      Great for CLI and systems    Cons      Steep learning curve      Concept fatigue (ownership, lifetimes, traits, etc.)      Slow compile times      Integration cost with legacy systems      Ecosystem gaps (GUI, ML)    Context      Great for performance + safety critical      Not ideal for rapid prototyping      Not always easiest migration path`

## [[KEY TAKEAWAYS]]

> [!important] Make it Memorable
> Each takeaway reflects both the benefits and tradeoffs highlighted in the video.

1. Rust’s defining feature is **memory safety without a garbage collector**, enforced by the borrow checker at compile time.​
2. This model catches entire classes of bugs (like use-after-free) before runtime, delivering C-level performance with safety closer to Java.​
3. Real-world case studies from Discord, Dropbox, Microsoft, and AWS show genuine performance and reliability gains, not just marketing claims.​
4. The Rust learning curve is steep and mindset-shifting, especially for developers used to garbage-collected or dynamically typed languages.​
5. Rust’s rich feature set—ownership, lifetimes, traits, generics, macros, async—creates “concept fatigue” that can slow team onboarding.​
6. Rust is best suited to performance-critical, security-sensitive, and long-running services; it is not always the most pragmatic choice for rapid prototyping or tight-deadline projects.​
7. Language choice is contextual: Go can win for speed to market, C++ for game ecosystems, while Rust carves out strategic niches where its unique tradeoff profile provides clear business value.​
8. Rust is not mere hype—it is a powerful tool—but “rewrite everything in Rust” is not a universal answer; matching language to problem remains essential.​

## [[EXAM-READY SUMMARY]]

## A. CORE QUESTIONS

**What is this?**
A critical, example-driven overview of Rust in 2025: what it actually offers (performance, memory safety), how it compares to other languages, and where it is and is not a good fit.​

**Why is this important?**
Because Rust is influencing major infrastructure decisions at companies like Discord, Dropbox, Microsoft, and AWS, and engineers need a realistic picture rather than pure hype.​

**Why should I learn this?**
Understanding Rust’s strengths and limits helps you choose tools wisely, communicate tradeoffs to stakeholders, and decide whether investing months into Rust makes sense for your career or team.​

**When will I need this?**
When designing or rewriting performance-critical services, security-sensitive components, or long-lived systems where memory bugs and downtime are unacceptable.​

**How does this work?**
Rust enforces ownership and borrowing rules at compile time via the borrow checker, preventing memory errors without GC; this shapes both how you design code and how you think about resources.​

**What problem does this solve?**
It addresses the historical safety vs performance tradeoff: you no longer have to choose between C-level speed and managed-language safety, at the cost of a tougher learning curve and more complex mental model.​

## B. PATTERNS & MENTAL MODELS

> [!example] Pattern Template
>
> text
>
> `When you see: “We keep hitting GC pauses or memory bugs in a critical service” Think: “Rust’s borrow checker + no GC” This usually means: upfront pain (learning, refactor) for long-term safety & performance ```[1]`

- **What stays constant**:
    - Rust’s core design goal: safe systems programming without GC.​
    - Borrow checker as the central mechanism.​
- **What changes**:
    - Whether that tradeoff is worth it depends on domain (systems vs CRUD), team experience, legacy investments, and deadlines.​
- **Decision pattern**:
    - If performance and safety are **top-level constraints**, Rust is a strong candidate.
    - If speed to market or integration with a huge existing stack dominates, Rust may be the wrong choice.​

## C. SIMPLIFIED RE-EXPLANATION

**Plain language breakdown (ELI5)**:
C and C++ let you do anything with memory, including dangerous things, and they won’t stop you. Java and Python stop you from doing dangerous things by cleaning up memory automatically, but that can slow you down. Rust is like a very strict teacher who checks your homework before you hand it in; if your memory usage is unsafe, it won’t even let the program run. That way, you get both safety and speed—but you have to learn the teacher’s rules.​

**Analogy**:
Think of driving:

- C is driving with no seatbelt on a racetrack.
- Java/Python is driving with lane assist, auto braking, and a speed limiter.
- Rust is a car that refuses to start unless you’ve fastened your seatbelt, checked your mirrors, and set everything safely. It might feel slow to start, but once you’re on the highway, you can drive as fast as the track car with far less risk.​

**Step-by-step mental model**:

1. You write Rust code using ownership and borrowing.​
2. The borrow checker analyzes where each value lives and who can access it.​
3. If there’s any possibility of unsafe memory access, the compiler rejects the program.​
4. Once it compiles, entire categories of bugs are impossible, giving high confidence in production.​
5. The tradeoff is that you must think about lifetimes and aliases up front, which slows learning but speeds debugging.​

> [!note] The Coffee Shop Test
> If you can explain to a friend “Rust stops memory bugs before your program runs, without a garbage collector, which is why companies rewrite critical services in it,” you understand the core value proposition.​

## D. VISUAL MENTAL MODELS & CHEATSHEETS

text

`flowchart TD     A[Problem: Need perf + safety] --> B{Existing stack?}    B -->|Mostly C/C++| C[Consider incremental Rust for new components]    B -->|Mostly GC langs| D[Check if GC pauses / safety are real bottlenecks]    C --> E{Team can invest 3–6 months?}    D --> E    E -->|Yes| F[Adopt Rust for critical paths]    E -->|No| G[Use Go/Java/etc., maybe FFI later]`

**Rust Fit Cheatsheet**

text

`Choose Rust when: - Performance-critical (low latency, high throughput) - Security-critical (memory safety matters) - Long-lived infra (OS, VM, backend core) - Team is willing to climb a steep learning curve Be cautious with Rust when: - You need MVP / prototype quickly - Team has zero systems background and tight deadlines - You’re deeply tied to JVM / .NET / legacy C++ and integration costs are huge`

## E. RAPID REVIEW CHECKLIST

text

`- [ ] Can you define Rust’s “memory safety without GC” promise? - [ ] Can you summarize Discord’s and Dropbox’s Rust rewrites? - [ ] Can you list 3 reasons Rust has a steep learning curve? - [ ] Can you explain why TypeScript’s team chose Go instead of Rust? - [ ] Can you identify 3 scenarios where Rust is a great fit? - [ ] Can you identify 3 scenarios where another language may be more practical?`

## F. FAQ — FREQUENTLY ASKED QUESTIONS

> [!question] Q: If Rust is so good, why isn’t everyone using it?
> **A:** Because productivity, onboarding time, and integration costs also matter. Rust shines in performance/safety-critical systems but can be overkill—or even counterproductive—for simpler apps or teams that need to move fast.​

> [!question] Q: Is the borrow checker just a hurdle, or a long-term benefit?
> **A:** Initially it feels like a hurdle, but once you internalize ownership and borrowing, it becomes a powerful safety net that prevents entire categories of runtime bugs.​

> [!question] Q: Does Rust always outperform Go?
> **A:** Not automatically. Rust’s model can avoid GC pauses and achieve very high performance, but real-world results depend on the specific workload, implementation quality, and tradeoffs a team is willing to make.​

> [!question] Q: Should I rewrite my existing system in Rust?
> **A:** Only if you have clear pain points Rust addresses (performance, safety) and are prepared for the cost of rewriting and retraining. Otherwise, incremental adoption or sticking with your current stack may be wiser.​

## G. CAREER & REAL-WORLD CONNECTIONS

## Industry Applications

- Rust is being used in:
    - Large-scale messaging (Discord backend services).​
    - Cloud storage and sync (Dropbox).​
    - Operating system components (Windows font rendering).​
    - Serverless infrastructure (AWS Firecracker microVM).​
    - Web infrastructure and frameworks (Rust-based web servers and runtimes).​
    - CLI tools that developers use daily (ripgrep, fd, bat, exa).​

## Interview Prep

> [!important] Interview Alert
> Common Rust interview topics: ownership and borrowing, the borrow checker, when to choose Rust over Go/C++/Java, and concrete examples of Rust’s benefits in production.​

- Typical questions:
    - Explain Rust’s ownership model and how it differs from garbage-collected languages.
    - Give an example where Rust’s borrow checker prevents a bug C++ would allow.
    - When would you **not** choose Rust for a project?
    - What did Discord/Dropbox/Microsoft gain from moving parts of their stack to Rust?​

## Portfolio & Project Ideas

- Build:
    - A small CLI that manipulates large files or codebases to showcase performance and safety.​
    - A microservice that emphasizes low latency and reliability.
    - A rewrite of a small existing tool from Go/Python to Rust, with metrics on performance and resource usage.​

## Learning Path Connections

- Prerequisites:
    - Comfortable with at least one systems or compiled language.
    - Basic understanding of memory, stack/heap, and references/pointers.​
- Next steps:
    - Learn ownership and borrowing deeply (The Rust Book, exercises).
    - Build a non-trivial CLI or backend with Rust and measure performance.
    - Explore async Rust once basics are solid.​

## Pro Tips (Senior Engineer Insights)

> [!tip] Pro Tip
> Treat Rust as a specialized tool, not a default. Use it where its strengths—safety and performance—map directly to business value, instead of forcing it into every problem.​

> [!tip] Pro Tip
> Expect 3–6 months before you feel fluent. Plan projects accordingly; pilot Rust internally before committing your largest, most time-sensitive initiatives to it.​

## H. CONNECTIONS & RELATED TOPICS

- Related concepts:
    - Memory management strategies: manual vs GC vs ownership-based.
    - Systems design tradeoffs between performance, safety, and developer productivity.​
- Related languages:
    - C and C++ for historical context and interoperability.
    - Go as a contrast in simplicity vs control.
    - Zig as another “modern C-like” option with compile-time features.​

## I. MOTIVATIONAL ANCHOR

> [!success] You've Got This
> If you decide Rust is worth learning for your goals, treating the borrow checker as a mentor rather than a villain will change how you think about code. Whether or not you end up using Rust everywhere, mastering its mental model will make you a stronger engineer in any language.​

**END OF NOTES**