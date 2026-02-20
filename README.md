# 🐧 Linux Monitoring Project (Docker + Bash)

A hands-on Linux monitoring project built inside a Docker-based Linux playground.

This repository demonstrates how to create a lightweight Linux lab using Docker and build real-time monitoring scripts using Bash.

---

## 📌 Project Goal

The goal of this project is to understand how monitoring works at the operating system level by building it from scratch.

Instead of relying only on enterprise monitoring tools, this project focuses on:

- System-level metric collection
- Threshold-based alert logic
- Structured logging
- Docker-based isolated execution environment

---

## 🚀 Features

- Disk usage monitoring using Bash
- Configurable threshold values
- Structured timestamp logging
- Slack webhook alert integration (via environment variable)
- Docker-based Linux playground
- Secure secret handling
- Clean project structure

---

## 📁 Project Structure
inux-monitoring-project/
│
├── scripts/
│ └── disk_monitor.sh
│
├── config/
│ └── monitor.conf
│
├── logs/
│
├── README.md
└── .gitignore

---

## 🐳 Creating Your Own Linux Playground

You can use Docker to create a lightweight Linux lab without any heavy setup.

### Step 1: Run Ubuntu Container

```bash
docker run -it \
  -v $(pwd):/app \
  --name linux-monitor-container \
  ubuntu:22.04 \
 bash

This:
Starts an Ubuntu container
Mounts your project folder inside /app
Opens interactive shell
