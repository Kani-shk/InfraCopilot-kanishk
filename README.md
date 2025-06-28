# InfraCopilot v2

A Modular DevSecOps Platform for CI/CD, Security, Kubernetes Orchestration, Automated Remediation, Model Control Plane (MCP), and ChatOps.

---

## 🚀 Project Overview

**InfraCopilot v2** aims to provide a fully automated DevSecOps platform that integrates:

- Continuous Integration/Continuous Deployment (CI/CD)
- Security Scanning (Trivy/Snyk)
- Infrastructure Provisioning (Terraform)
- Kubernetes Orchestration (k3s)
- Monitoring & Alerting (Prometheus, Grafana, n8n)
- Automated Remediation
- ChatOps with LLM-powered Model Control Plane (MCP)

---

## 📦 Current Status

> **This project is in early development.**  
> As of now, only the initial `docker-compose.yml` for the Control Node has been created and committed.

- [x] Control Node: Docker Compose setup started
    - Jenkins, n8n, FastAPI Controller, Prometheus, Grafana (to be configured)
- [ ] MCP + OpenAI integration
- [ ] Kubernetes & App deployment
- [ ] Chatbot UI & Python server
- [ ] Security & Monitoring pipelines
- [ ] Terraform infra management
- [ ] End-to-end testing and validation

---

## 🏗️ How to Get Started (Development)

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Alok77it/InfraCopilot.git
   cd InfraCopilot
   ```

2. **Set up Control Node services (Docker Compose):**
   - Make sure Docker and Docker Compose are installed.
   - Start the stack:
     ```bash
     docker compose up -d
     ```
   - Services will be available on their respective ports (see `docker-compose.yml`).

---

## 📂 Project Structure (Planned)

```
InfraCopilot/
├── docker-compose.yml       # Initial Compose file for Control Node
├── chatbot_ui/              # (planned) Chatbot web UI
├── chatbot_server/          # (planned) Python backend for ChatOps
├── mcp_server/              # (planned) Model Control Plane (FastAPI)
├── fastapi_controller/      # (planned) Infra automation API
├── n8n_workflows/           # (planned) Automated remediation workflows
├── terraform_aws/           # (planned) Terraform infrastructure code
├── kubernetes_manifests/    # (planned) App and infra manifests
├── prometheus_config/       # (planned) Monitoring configuration
├── trivy_snyk/              # (planned) Security scan configs/scripts
└── README.md
```

---

## 📝 Roadmap

See the full project vision and phased implementation plan in future updates.

---

## 📢 Status

Project is in progress.  
More features and documentation will be added as development continues.

---

## 🏆 Author

**Alok Trivedi**  
[InfraCopilot v2](https://github.com/Alok77it/InfraCopilot)

---

## 📄 License

[MIT License](LICENSE)
