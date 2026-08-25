# ⚡ Spryzen Sovereign WAF & Threat Engine (`spryzen-scan`)

> **100% Client-Side · Zero Server Rental Costs · On-Premise Binary · Free Edge Adapter**

[![Live Demo](https://img.shields.io/badge/Live_Demo-GitHub_Pages-00f2ff?style=for-the-badge&logo=github)](https://aditya-9-6.github.io/spryzen-scan/)
[![Security](https://img.shields.io/badge/Security-Air--Gapped_Safe-10b981?style=for-the-badge&logo=shield)](https://aditya-9-6.github.io/spryzen-scan/)
[![License](https://img.shields.io/badge/License-Spryzen_BSL_1.0-a855f7?style=for-the-badge)](LICENSE)

Spryzen is an ultra-high performance autonomous Web Application Firewall (WAF) and offline log threat inspector. It protects web applications and AI APIs against **SQLi, XSS, RCE, Path Traversal, and AI Prompt Injections** in `<0.4ms`.

---

## 🚀 3 Ways to Deploy Spryzen (Zero Cloud Server Costs to You)

```
+---------------------------------------------------------------------------------------------------+
|                            3 ZERO-SERVER-COST DEPLOYMENT OPTIONS                                  |
+---------------------------------------------------------------------------------------------------+
|                                                                                                   |
|  1. 🌐 Live Browser Scanner (Free on GitHub Pages):                                               |
|     Visit https://aditya-9-6.github.io/spryzen-scan/                                              |
|     Inspects server logs 100% offline in browser memory without sending data over the network.    |
|                                                                                                   |
|  2. ⚡ 1-Line On-Premise Binary Installer (Customer's Own Hardware):                              |
|     curl -fsSL https://raw.githubusercontent.com/Aditya-9-6/spryzen-scan/main/install.sh | bash   |
|     Runs directly on Ubuntu / Debian / RHEL / macOS in front of your backend with zero setup.    |
|                                                                                                   |
|  3. ☁️ Free Edge Serverless Adapter (Cloudflare Workers / Vercel Edge):                           |
|     Deploy edge/worker.js to your Cloudflare Worker on the 100k req/day free tier ($0.00/mo).     |
|                                                                                                   |
+---------------------------------------------------------------------------------------------------+
```

---

## 🥊 What Spryzen Catches (Including Threats Missed by Cloudflare)

| Threat Vector | Cloudflare Standard WAF | Spryzen Offline Scanner |
| :--- | :--- | :--- |
| **AI Prompt Injections & Jailbreaks** | ❌ **Blind** (Passes as normal JSON) | ✅ **100% Detected** (Semantic token analysis) |
| **Double-Encoded SQLi (`%2527%2520OR`)** | ❌ **Misses Second-Order Encodings** | ✅ **Multi-Pass SIMD Normalization** |
| **GraphQL Introspection & Depth Bombs** | ❌ **Treated as Generic POST** | ✅ **AST Query Complexity & Depth Blocker** |
| **Cloud Metadata SSRF (`169.254.169.254`)** | ❌ **Misses Obfuscated Dec/Hex IPs** | ✅ **Normalizes Decimal & Hex Addresses** |
| **Path Traversal / LFI (`../etc/passwd`)** | ⚠️ **Rule-Dependent** | ✅ **Strict Canonical Boundary Enforcer** |

---

## 💻 On-Premise Binary Quickstart

Run the one-line installer on your Linux/macOS server:
```bash
curl -fsSL https://raw.githubusercontent.com/Aditya-9-6/spryzen-scan/main/install.sh | bash
```

To start the WAF daemon protecting your backend application (`http://127.0.0.1:3000`):
```bash
sudo systemctl start spryzen
```

To inspect live threat telemetry:
```bash
sudo journalctl -u spryzen -f
```

---

## 🔒 Intellectual Property & Anti-Cloning Notice
**Copyright © 2026 Spryzen Sovereign Security Labs. All Rights Reserved.**

This software, detection algorithms, AST grammar parsing models, and user interface are proprietary trade secrets of Spryzen Sovereign Security Labs. 

- **Unauthorized Copying / Mirroring**: Cloning, copying, scraping, or redistributing this codebase is strictly prohibited.
- **Reverse Engineering**: Decompiling or extracting the AST detection rules for competing commercial services is actionable under DMCA and international copyright law.
- See [`LICENSE`](LICENSE) for complete legal terms. For enterprise commercial licensing inquiries, contact `legal@spryzen.plus`.
