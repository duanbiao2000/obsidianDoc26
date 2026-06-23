---

title: "The Future of Rust: 15 Top Engineers Share What's Next (RustConf 2025)"  
type: note  
program: "Not specified"  
course: null  
module: null  
lecture: null  
start_date: "2026-03-20"  
end_date: "2026-03-20"  
tags: [rust, rustconf, systems_programming, memory_safety, open_source, community, performance]  
source: "[https://www.youtube.com/watch?v=Zt7_qgTTVDk](https://www.youtube.com/watch?v=Zt7_qgTTVDk)"  
duration: "11:42"  
status: TODO  
aliases: ["RustConf 2025", "Future of Rust"]

---

## [[SOURCE INFORMATION]]

Fast-paced interview compilation from RustConf 2025, hosted by Francesco Ciulla. Features 15 engineers from Oracle, System76, Solana Foundation, JetBrains, Zed Industries, Amazon, Google, Rust Foundation, Tracel AI, Mainmatter, ixpantia, WyeWorks, and Anza. Published March 20, 2026. Duration: 11:42.

## [[LEARNING FOCUS]]

> [!tip] Learning Objectives
> After this material, you will be able to:
>
> 1. Explain what makes Rust unique compared to other mainstream languages
>     
> 2. Identify key real-world use cases where Rust is deployed (blockchain, OS, editors, ML, cloud infra)
>     
> 3. Describe how Rust's type system and ownership model benefit long-term projects
>     
> 4. Name major contributors to the Rust ecosystem and their affiliated organizations
>     
> 5. Understand the community culture and collaborative nature of the Rust project
>     

## [[NOTES]]

## Speaker Introductions & Affiliations

- **Salvador Salazar** — Principal Software Engineer, Oracle Cloud Infrastructure
- **Jeremy Soller** — Principal Engineer, System76; works on Redox OS
- **Nathaniel Simard** — Founder of Tracel AI; creator of Burn (deep learning framework in Rust)
- **Mikayla Maki** — Software Engineer, Zed Industries
- **Jacob Creech** — Head of Developer Relations, Solana Foundation
- **Vitaly Bragilevsky** — Developer Advocate, JetBrains
- **Niko Matsakis** — Senior Principal Engineer, Amazon; Rust Core Team member; working on Rust since 2011
- **Jack Huey** — Engineer at Futurewei; co-leads the Rust Types Team
- **Taylor Cramer** — Development Lead for Crubit (Google's C++/Rust interop project); works on Fuchsia
- **Marco Ieni** — Rust Foundation, Infrastructure Team
- **Luca Palmieri** — Mainmatter; 8 years in the Rust community
- **Andrés Quintero** — ixpantia (consulting firm, Colombia); data science and data engineering
- **Santiago Pastorino** — WyeWorks; working on Rust since 2013; creator of `ya` (EBPF/Rust tooling); now works on Solana
- **Alessandro Decina** — Anza / ex-Solana; involved in EBPF with Rust
- **Walter Pearce** — Security Engineer, Rust Foundation

## Conference Experience

- Multiple attendees noted this was their first or second RustConf
- RustCamp was highlighted as a favorite format: structured as alternating talks and 30-minute breaks for networking
- Attendees valued the density of passionate Rust developers in one place
- Common theme: it is rare to find this many Rust users in a single setting — even among developer peers, Rust users are a minority

> [!note] Community Observation
> Several speakers noted that the Rust community is unusually close-knit and that conferences like RustConf are rare opportunities to discuss Rust with others who actually use it.

## What Makes Rust Unique

- **Only mainstream language without a garbage collector that still guarantees memory safety**
- People come to Rust for **performance** but stay for **expressiveness** (e.g., match statements)
- **Reliability** is a core superpower — described as not glamorous but deeply impactful
- The **type system** enables handling complexity that would otherwise be unmanageable
- Rust code tends to be **sequential and readable** — even people from data science or web dev backgrounds can read it, unlike C++ with raw pointers

> [!important] Core Differentiator
> Rust = no garbage collector + memory safety. No other mainstream language achieves both simultaneously.

## Real-World Usage

## Solana (Blockchain)

- The Solana validator (the node that runs the Solana network) is **fully written in Rust**
- Solana is described as "the fastest blockchain client"
- Developers building applications on top of Solana also use Rust
- Jacob Creech builds demo applications in Rust to showcase Solana development
- Santiago Pastorino previously created `ya`, a standard tool for EBPF work in Rust, before joining Solana

## Zed (Code Editor)

- Zed is a **Rust-based code editor** — not a fork, not Electron, not a web view — Rust top to bottom
- Features: debugger, git panel, AI integrations (optional/togglable)
- Mikayla Maki joined as an intern and spent her first 3 months building a terminal emulator based on Alacritty
- **Key advantage for Zed**: Rust's type system makes large-scale refactors feasible
    - Refactors that would take months in other languages can be completed in a couple of weeks
    - After refactor, the system "just keeps working"

> [!example] Zed Refactoring Advantage
> After 3 years of development, old architectural choices needed updating. Rust's strong type system allowed application-wide refactors to complete in weeks with confidence.

## ixpantia (Data Science Consulting)

- Uses Rust to enable clients to access **high-performance computing without learning C++**
- Rust is **easier to read than to write** — a key property for data science teams
- ==Sequential, logical structure makes Rust accessible to non-systems programmers==

## Rust Foundation Infrastructure

- Marco Ieni's team manages: infrastructure-as-code, AWS resources, GitHub organization settings
- Maintain bots such as **Bors** — manages merge queues and PR approvals for the Rust project

## Burn (Deep Learning Framework)

- Nathaniel Simard created Burn, a deep learning framework written entirely in Rust
- Hosted under Tracel AI

## Google / Fuchsia

- Taylor Cramer leads **Crubit** — a project for C++/Rust interoperability at Google
- Works within the Fuchsia OS project

## Community & Open Source Culture

- Mikayla Maki highlighted the ==**openness and collaborative nature**== of the Rust community
- As a new developer, she was able to send PRs to the Rust compiler and Clippy and receive collaborative responses from core contributors
- The community actively helps contributors get changes landed
- Rust holds developers "on the happy path" — in contrast to C++, where you can wander off and produce either brilliant or disastrous code

> [!quote] Mikayla Maki on C++ vs Rust
> "Rust ==holds my hand== and keeps me on the happy path here. In C++, I can like wander right off of it. And sometimes that leads to really high-performance software and sometimes it leads to total confusion and disaster."

## Learning Path Mentioned

- ==Multiple speakers started with Advent of Code as a Rust learning tool==
- Progression noted: Advent of Code → online courses → real projects (e.g., internship at Zed)
- Several speakers have been using Rust since 2011–2013 (very early adopters)

## RustConf 2026 Announcement

- **Location**: Palais des Congrès de Montréal, Canada
- **Dates**: September 8–11, 2026
- **Website**: [rustconf.com](https://rustconf.com/)

## [[EXAMPLES, PATTERNS, OR DEMONSTRATIONS]]

## Rust Adoption Journey (Mikayla Maki, Zed)

text

`Advent of Code (basics)     → Online courses        → Internship at Zed            → Built terminal emulator (based on Alacritty)                → Full-time Rust engineer`

## Rust Use Case Map

text

`mindmap   root((Rust in Production))    Blockchain      Solana Validator      Solana dApps      EBPF tooling    Systems      Redox OS      Fuchsia (Google)      C++ interop (Crubit)    Developer Tools      Zed Editor      Rust Foundation Bots (Bors)      Clippy / Compiler contributions    AI / ML      Burn (deep learning framework)    Cloud / Infra      Oracle Cloud Infrastructure      AWS infra (Rust Foundation)    Data Science      ixpantia consulting      High-performance computing clients`

## Why Rust Wins: A Comparison

|Property|C++|Python|Rust|
|---|---|---|---|
|Memory Safety|No (manual)|Yes (GC)|Yes (ownership)|
|Garbage Collector|No|Yes|No|
|Performance|High|Low|High|
|Readability|Low (pointers)|High|Medium-High|
|Refactoring Safety|Low|Medium|High|
|Community Openness|Moderate|High|Very High|

## [[KEY TAKEAWAYS]]

1. **Rust is the only mainstream language combining no GC with memory safety** — this is its core technical differentiator.
2. **Rust's type system is not just a safety feature — it is an architectural enabler**, allowing large-scale refactors to be done safely and quickly.
3. **Rust is production-critical in high-stakes systems**: Solana's entire blockchain client, Google's Fuchsia OS, and Zed's code editor are all built fully in Rust.
4. **The Rust community is uniquely collaborative**: even new contributors can successfully land PRs in the compiler and core tooling.
5. **Rust's learning curve is real but manageable**: a common entry path is Advent of Code → courses → real-world project.
6. **Rust is expanding beyond systems programming** into data science, ML (Burn), blockchain, and developer tooling.
7. **RustConf 2026 will be held in Montréal, Canada (September 8–11, 2026)** — a key community event to watch.

## [[EXAM-READY SUMMARY]]

## A. CORE QUESTIONS

| Question                    | Answer                                                                                                                                                          |
| --------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| What is Rust?               | A systems programming language with memory safety enforced at compile time via ownership, without a garbage collector                                           |
| Why is it important?        | Enables performance comparable to C/C++ while eliminating entire classes of memory bugs (use-after-free, data races, null derefs)                               |
| Why should I learn it?      | High demand in systems, blockchain, cloud, and increasingly AI/ML; strong job signal for senior engineering roles                                               |
| When will I need it?        | ==Building high-performance services, OS components, blockchain clients, safety-critical software, or long-lived codebases that require confident refactoring== |
| How does it work?           | The borrow checker enforces ownership rules at compile time — no runtime overhead, no GC pauses                                                                 |
| What problem does it solve? | The C/C++ safety-performance tradeoff: you no longer have to choose between the two                                                                             |

## B. PATTERNS & MENTAL MODELS

> [!example] Pattern Template
>
> text
>
> `When you see "high performance + memory safety required", think Rust This usually means: the borrow checker replaces the GC Implication: bugs caught at compile time, not production`

- **What stays constant**: ownership rules, borrow checker, no GC
- **What changes**: use cases expand (ML, data science, blockchain, editors)
- **Common workflow**: write → borrow checker rejects → fix ownership → compile-time guarantee

## C. SIMPLIFIED RE-EXPLANATION

**Plain language**: Rust is like a very strict editor that reads your code before it runs and catches all the memory mistakes before they become bugs. It does this without slowing your program down (no garbage collector).

**Analogy**: Imagine building a house where every beam must be approved by a structural engineer before you attach it. It takes longer to build, but the house will never collapse unexpectedly.

**Step-by-step understanding**:

1. You write code that uses memory (variables, structs, allocations)
2. The borrow checker verifies ownership rules at compile time
3. If rules are violated, the code does not compile — no runtime crashes
4. The result: a program as fast as C, as safe as a managed language

> [!note] The Coffee Shop Test
> "Rust catches memory bugs before your program even runs, without slowing it down — because it doesn't need a garbage collector."

## D. VISUAL MENTAL MODELS

text

`flowchart TD     A[Write Rust Code] --> B{Borrow Checker}    B -- Rules violated --> C[Compile Error - Fix Now]    B -- Rules satisfied --> D[Binary Produced]    D --> E[No GC Pauses]    D --> F[No Memory Bugs at Runtime]    D --> G[C-level Performance]`

**Cheatsheet: Why Rust Over Alternatives**

text

`Need performance + safety?    → Rust (not C++) Need readable data pipelines? → Rust (not Python, for prod) Building blockchain?          → Rust (Solana, EBPF) Building a long-lived app?    → Rust (refactor confidence) Learning systems programming? → Rust (safer entry than C)`

## E. RAPID REVIEW CHECKLIST

text

`- [ ] Can you explain Rust's memory model in one sentence? - [ ] Can you name 3 production systems fully written in Rust from this video? - [ ] Can you describe why the type system helps with refactoring? - [ ] Can you name the entry-level learning path mentioned by speakers? - [ ] Can you identify what Crubit, Burn, and Bors are? - [ ] Can you explain why Rust has no GC but still has memory safety?`

## F. FAQ

> [!question] Q: Isn't Rust too hard to learn?
> **A:** The borrow checker is the steep part. Multiple speakers started with Advent of Code and courses before contributing to production systems. The key insight from this video: Rust is harder to _write_ but easier to _read_ than C++. The investment pays off in long-term maintainability.

> [!question] Q: Is Rust only for systems programming?
> **A:** No. This video shows Rust in blockchain (Solana), ML (Burn), data science consulting (ixpantia), code editors (Zed), and cloud infrastructure (Oracle, AWS). The use cases are expanding rapidly.

> [!question] Q: Why does "no garbage collector" matter?
> **A:** GCs introduce unpredictable pauses, which are unacceptable in latency-sensitive systems (blockchain validators, real-time editors, OS kernels). Rust eliminates this by enforcing memory rules at compile time instead.

> [!question] Q: Can I contribute to Rust as a beginner?
> **A:** Yes — Mikayla Maki described sending PRs to the compiler and Clippy as an intern and receiving collaborative responses from core team members. The community is explicitly welcoming to new contributors.

## G. CAREER & REAL-WORLD CONNECTIONS

## Industry Applications

- **Blockchain**: Solana (entire validator in Rust), EBPF tooling
- **Operating Systems**: Redox OS (Jeremy Soller), Google Fuchsia (Taylor Cramer)
- **Code Editors**: Zed (full Rust stack, no Electron)
- **Machine Learning**: Burn framework (Tracel AI)
- **Cloud Infrastructure**: Oracle Cloud, AWS (Rust Foundation infra)
- **Data Science Consulting**: ixpantia (enabling HPC access without C++)
- **C++ Interop**: Google's Crubit project

## Interview Prep

> [!important] Interview Alert
> "What makes Rust unique?" is a canonical interview question for any Rust role. The answer must include: ownership model, borrow checker, no GC, memory safety at compile time. Bonus: mention match statements, type system ergonomics, and refactoring confidence.

- **Common interview questions**:
    - Explain the borrow checker
    - What is ownership and borrowing?
    - When would you choose Rust over Go or C++?
    - What is a lifetime in Rust?
    - How does Rust handle concurrency safely?
- **Red flag to avoid**: Saying "Rust is just fast C" — it misses the safety and ergonomics story

## Portfolio & Project Ideas

- Build a CLI tool (file watcher, task manager) — demonstrates ownership + error handling
- Contribute to an open-source Rust project (Clippy, Burn, Zed) — as described by speakers
- Implement Advent of Code solutions in Rust — standard beginner signal
- Build a simple blockchain client or validator — directly relevant to Solana ecosystem
- Create a small web server with Axum or Actix — demonstrates async Rust

## Learning Path Connections

- **Prerequisites**: Basic systems concepts (memory, stack/heap), at least one compiled language
- **Entry point** (from video): Advent of Code in Rust
- **Next after basics**: The Rust Book → Rustlings → real project
- **Advanced**: Async Rust, unsafe Rust, proc macros, WASM compilation targets
- **Adjacent**: EBPF (Santiago Pastorino's work), WebAssembly, embedded Rust

## Pro Tips

> [!tip] Pro Tip
> The match statement is one of Rust's most underrated features. Multiple senior engineers in this video mentioned missing it when returning to other languages. Learn it deeply — it is the idiomatic way to handle enums, errors, and control flow in Rust.

> [!tip] Pro Tip
> Rust's real production advantage is not just initial correctness — it is **refactoring confidence**. In large codebases (Zed was cited), application-wide refactors that would take months in other languages complete in weeks because the type system catches every inconsistency at compile time.

## H. CONNECTIONS & RELATED TOPICS

- **Rust ownership model** → prerequisite to understanding everything else in Rust
- **EBPF** → Santiago Pastorino and Alessandro Decina work at the intersection of Rust + EBPF + blockchain
- **WebAssembly (WASM)** → natural next step; Rust compiles to WASM and is dominant in that ecosystem
- **Solana development** → requires Rust; Jacob Creech's work is a direct entry point
- **Zed editor** → an all-Rust codebase and active open-source project to study or contribute to
- **Burn (ML framework)** → for those interested in ML systems; rare Rust-native deep learning option
- **RustConf 2026** → Montréal, September 8–11, 2026 — community event and networking opportunity

## I. MOTIVATIONAL ANCHOR

> [!success] You've Got This
> Every engineer in this video — from those who started in 2011 to those who picked it up two years ago — went through the same borrow checker frustration you will face. What they all have in common: they pushed through, and now they are building some of the fastest, most reliable software in production anywhere in the world. Rust is hard to learn and impossible to forget.

**END OF NOTES**
