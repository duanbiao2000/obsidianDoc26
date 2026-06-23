---
type: entity
title: rathole
created: 2026-06-22
updated: 2026-06-22
tags: [tool, networking, rust, nat-traversal, reverse-proxy]
related: [frp, ngrok, rust, tokio]
sources: ["Journals/Comprehensive Analysis of rathole-org-rathole.md"]
---
# rathole

**rathole** is a lightweight, high-performance reverse proxy for NAT traversal, written in [[Rust]]. It serves as an alternative to tools like [[frp]] and [[ngrok]], with a specific focus on minimal resource consumption and high concurrency.

## Overview

rathole allows users to expose services running behind a NAT or firewall to the public internet. It consists of a server component (running on a machine with a public IP) and a client component (running on the machine behind the NAT).

## Key Features

- **High Performance:** Built on the [[tokio]] async runtime, enabling efficient handling of multiple concurrent connections.
- **Lightweight:** Designed to have a small memory footprint and low CPU usage.
- **Protocol Support:** Supports TCP and UDP tunneling, with optional TLS and Noise protocol encryption.
- **Hot Reload:** Configuration can be reloaded without restarting the service.

## Comparison

| Feature | rathole | frp | ngrok |
| :--- | :--- | :--- | :--- |
| Language | Rust | Go | Go/C++ |
| Resource Usage | Very Low | Low | Medium/High |
| Primary Focus | Performance/Minimalism | Feature Richness | Ease of Use/SaaS |
| License | MIT | Apache 2.0 | Proprietary/SaaS |

## Usage Example

**Server Configuration (`server.toml`):**
```toml
[server]
bind_addr = "0.0.0.0:2333"

[server.services.my_ssh]
token = "secret_token"
bind_addr = "0.0.0.0:5202"
```

**Client Configuration (`client.toml`):**
```toml
[client]
remote_addr = "myserver.com:2333"

[client.services.my_ssh]
token = "secret_token"
local_addr = "127.0.0.1:22"
```

## Development Status

As of recent analysis, rathole has gained significant traction (~10k+ stars on GitHub) but is undergoing improvements in community infrastructure, including the addition of security policies, contributor guides, and structured issue management.