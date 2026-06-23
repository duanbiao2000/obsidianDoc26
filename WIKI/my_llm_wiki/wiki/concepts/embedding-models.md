---
type: concept
title: Embedding Models
created: 2026-06-22
updated: 2026-06-22
tags: [embedding, nlp, vector-representation, semantic-search]
related: [all-minilm-l6-v2, bge-small-en-v1-5, nomic-embed-text-v1-5, local-ai-deployment, rag]
sources: ["Journals/2026-06-17 embedding模型本地部署方案.md"]
---
# Embedding Models

Embedding models are neural network models that convert text (words, sentences, or documents) into dense vector representations — numerical arrays that capture semantic meaning. These vectors enable similarity comparisons, semantic search, and retrieval-augmented generation (RAG).

## Key Properties

- **Dimensions**: The size of the output vector (e.g., 384-dim, 768-dim). Higher dimensions can capture more nuance but require more storage and compute.
- **Model Size**: Measured in parameters and file size (MB/GB). Smaller models like [[all-MiniLM-L6-v2]] (~44MB) are suitable for local deployment; larger models offer better quality at higher resource cost.
- **Benchmarks**: MTEB (Massive Text Embedding Benchmark) is the standard evaluation framework for comparing embedding quality.

## Use Cases

- **Semantic Search**: Finding documents by meaning rather than keyword matching.
- **RAG (Retrieval-Augmented Generation)**: Retrieving relevant context for LLM prompts.
- **Similarity Search**: Finding similar items in a vector database.
- **Clustering and Classification**: Grouping or categorizing text by semantic content.

## Local Deployment Trade-offs

For local deployment, the key trade-off is between embedding quality and resource usage (RAM, VRAM, CPU/GPU). See [[Local AI Deployment]] for deployment methods and [[all-MiniLM-L6-v2]], [[BGE-small-en-v1-5]], and [[Nomic Embed Text v1.5]] for specific model recommendations.

## Related Concepts

- [[Local AI Deployment]] — Methods for running models on local hardware.
- [[ONNX]] — A format for cross-platform model deployment.
- [[RAG]] — Architecture that uses embedding models for retrieval.