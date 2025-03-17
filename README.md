# wsdd-docker

Docker image for [`wsdd.py`](https://github.com/christgau/wsdd) — a Web Service Discovery daemon for Samba/SMB hosts.

This repository provides a lightweight Alpine-based containerized version of wsdd, including:
- 🐳 Dockerfile & entrypoint script
- 🛡 Non-root user & hardened permissions
- 📝 Simple environment variable configuration

---

## 🚀 Quickstart

```bash
docker run --net=host -e HOST=somehost -d shvargon/wsdd
```

For more advanced usage, visit 📦 [Docker Hub page](https://hub.docker.com/r/shvargon/wsdd)

---