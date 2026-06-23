---
type: entity
title: BGE-small-en-v1.5
created: 2026-06-22
updated: 2026-06-22
tags: [embedding-model, bge, local-deployment, multilingual]
related: [all-minilm-l6-v2, nomic-embed-text-v1-5, embedding-models, local-ai-deployment]
sources: ["Journals/2026-06-17 embedding模型本地部署方案.md"]
---
# BGE-small-en-v1.5

BGE-small-en-v1.5 is a lightweight embedding model developed by BAAI (Beijing Academy of Artificial Intelligence). It is optimized for small-memory environments and offers multilingual variants, making it a strong alternative to [[all-MiniLM-L6-v2]] when Chinese-language retrieval is needed.

## Specifications

- **Dimensions**: 384
- **Size**: <0.13GB
- **Variants**: bge-small-en-v1.5 (English), bge-small-zh-v1.5 (Chinese), multilingual versions

## Use Cases

- Semantic search with Chinese or mixed-language content
- Small RAG systems requiring multilingual support
- Low-memory environments (8–16GB RAM)

## Performance

On MTEB benchmarks, BGE-small-en-v1.5 performs slightly below larger models but remains usable for most practical applications. The Chinese variant (bge-small-zh) is specifically tuned for Chinese-language retrieval.

## Hardware Requirements

- Works on 8GB RAM laptops
- CPU-friendly
- Similar resource profile to [[all-MiniLM-L6-v2]]

## Caveats

The source notes that Chinese-language support depends on the specific sub-version (zh vs en). Users needing Chinese retrieval should select the appropriate variant.