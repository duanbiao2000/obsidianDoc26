---
type: entity
title: all-MiniLM-L6-v2
created: 2026-06-22
updated: 2026-06-22
tags: [embedding-model, sentence-transformers, local-deployment]
related: [bge-small-en-v1-5, nomic-embed-text-v1-5, embedding-models, local-ai-deployment, onnx]
sources: ["Journals/2026-06-17 embedding模型本地部署方案.md"]
---
# all-MiniLM-L6-v2

all-MiniLM-L6-v2 is a lightweight embedding model from the Sentence-Transformers library, widely regarded as the default baseline for low-resource local deployment. It is the primary recommendation in [[8-journals--28-2026-06-17-embedding模型本地部署方案--o4k25x]] for users who need "good enough" quality with minimal resource usage.

## Specifications

- **Dimensions**: 384
- **Parameters**: ~22M
- **Size**: ~44MB in FP16, ~88MB in FP32
- **VRAM**: <1GB at batch size 128 on GPU
- **CPU**: Runnable on CPU, suitable for low-resource environments

## Use Cases

- Semantic search
- Similarity search
- Small RAG (Retrieval-Augmented Generation) systems
- Batch indexing on memory-constrained hardware

## Hardware Requirements

- Works on 8GB RAM laptops
- Runs on CPU without GPU acceleration
- Apple Silicon unified memory improves batch throughput

## Deployment Options

Can be deployed via PyTorch, ONNX, LM Studio, or oMLX. See [[Local AI Deployment]] for details.

## Comparison

Compared to [[BGE-small-en-v1-5]], MiniLM has similar resource requirements but lacks specialized Chinese-language support. Compared to [[Nomic Embed Text v1.5]], MiniLM is significantly smaller and faster but may produce lower-quality embeddings for complex retrieval tasks.