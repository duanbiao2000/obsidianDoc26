---
type: entity
title: Nomic Embed Text v1.5
created: 2026-06-22
updated: 2026-06-22
tags: [embedding-model, nomic, local-deployment, high-quality]
related: [all-minilm-l6-v2, bge-small-en-v1-5, embedding-models, local-ai-deployment]
sources: ["Journals/2026-06-17 embedding模型本地部署方案.md"]
---
# Nomic Embed Text v1.5

Nomic Embed Text v1.5 is a higher-quality open-source embedding model developed by Nomic AI. It is positioned as a step up from [[all-MiniLM-L6-v2]] and [[BGE-small-en-v1-5]] for users who need better retrieval quality and have sufficient hardware resources.

## Specifications

- **Parameters**: ~137M
- **Size**: Larger than MiniLM/BGE-small, but still "lightweight" on 16GB+ machines
- **Performance**: Claims to exceed older OpenAI embedding models on MTEB benchmarks
- **Throughput**: ~100 QPS in full precision on an M2 MacBook

## Use Cases

- Higher-quality RAG systems
- Large-scale retrieval and indexing
- Applications where embedding quality is prioritized over minimal resource usage

## Hardware Requirements

- **Minimum**: 16GB RAM recommended
- **Apple Silicon**: Performs well on M2 MacBooks with unified memory
- **CPU**: Heavier than MiniLM/BGE-small, but still usable

## Comparison

Nomic Embed Text v1.5 offers better MTEB performance than [[all-MiniLM-L6-v2]] and [[BGE-small-en-v1-5]], but at the cost of larger model size and higher memory requirements. It is the recommended choice for users with 16GB+ RAM who want higher quality without moving to cloud APIs.