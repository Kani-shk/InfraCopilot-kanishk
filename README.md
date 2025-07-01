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
- [x] Kubernetes Cluster: K3s cluster with 1 master & 2 workers set up
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

   | Service    | URL                                            | Default Login           |
   | ---------- | ---------------------------------------------- | ----------------------- |
   | Jenkins    | [http://localhost:8080](http://localhost:8080) | Check logs for password |
   | n8n        | [http://localhost:5678](http://localhost:5678) | admin / admin123        |
   | FastAPI    | [http://localhost:8000](http://localhost:8000) | API interface           |
   | Prometheus | [http://localhost:9090](http://localhost:9090) | No login                |
   | Grafana    | [http://localhost:3000](http://localhost:3000) | admin / admin           |

3. **Set up K3s Kubernetes Cluster:**

   ### ✅ Step 2.1: Install K3s on Control Node (Master)

   On your control-node:
   ```bash
   curl -sfL https://get.k3s.io | sh -s - --write-kubeconfig-mode 644
   ```
   - This installs k3s, starts it as a systemd service.
   - Config at: `/etc/rancher/k3s/k3s.yaml`
   - `kubectl` is pre-installed as `k3s kubectl`.

   **Verify:**
   ```bash
   k3s kubectl get nodes
   ```

   ### ✅ Step 2.2: Retrieve K3s Token and IP

   You'll need these on worker nodes.
   ```bash
   cat /var/lib/rancher/k3s/server/node-token
   hostname -I
   ```

   - Copy the token and note your control node's IP.

   ### ✅ Step 2.3: Install K3s Agent on Worker Node 1

   SSH into `worker-node-1`:
   ```bash
   curl -sfL https://get.k3s.io | K3S_URL=https://<CONTROL-NODE-IP>:6443 K3S_TOKEN=<TOKEN> sh -
   ```
   - Replace `<CONTROL-NODE-IP>` and `<TOKEN>` with actual values.

   ### ✅ Step 2.4: Install K3s Agent on Worker Node 2

   Repeat the same steps as worker-node-1.

   ### ✅ Step 2.5: Validate Cluster

   Back on control-node:
   ```bash
   k3s kubectl get nodes -o wide
   ```
   You should now see 3 nodes: control + 2 workers.

   Example:
   ```
   NAME              STATUS   ROLES                  AGE     VERSION
   control-node      Ready    control-plane,master   15m     v1.29.x
   worker-node-1     Ready    <none>                 5m      v1.29.x
   worker-node-2     Ready    <none>                 2m      v1.29.x
   ```

   ### ✅ Step 2.6: Install kubectl for easier access (optional)

   On control-node (or local machine):
   ```bash
   sudo apt install -y kubectl
   mkdir -p ~/.kube
   sudo cp /etc/rancher/k3s/k3s.yaml ~/.kube/config
   sudo chown $USER:$USER ~/.kube/config
   ```

   **Test:**
   ```bash
   kubectl get pods -A
   ```

   ### ✅ Step 2.7: Create Namespace for InfraCopilot

   ```bash
   kubectl create namespace infrawatch
   ```
   All InfraCopilot services (frontend, backend, redis, exporters) will live here.

   ### 📦 Optional: Add Node Labels

   ```bash
   kubectl label node worker-node-1 role=compute
   kubectl label node worker-node-2 role=replica
   ```

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
