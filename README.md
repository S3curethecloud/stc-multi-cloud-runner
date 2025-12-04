<div align="center">

# 🛫 SecureTheCloud — Volume 8  
## **Delta Airline Multi-Cloud Flight Operations Command Center**

**Repo:** `stc-multi-cloud-runner`  
**Org:** `S3curethecloud`

🔗 [Volume 0 — Multi-Cloud Compute Architecture](https://github.com/S3curethecloud/multi-cloud-compute-architecture)  
🔗 [SecureTheCloud.dev](https://SecureTheCloud.dev)  

---

</div>

## 🎯 What This Volume Does

Volume 8 is a **live, hands-on multi-cloud deployment runner**.

When you execute the automation scripts, it will:

1. Deploy **Delta Airline Flight Ops** baseline infrastructure to:
   - **AWS** (flight APIs, ticketing backend, infra logs)
   - **Azure** (workforce identity & ops portal)
   - **GCP** (analytics & flight prediction services)
2. Start a full **observability stack** (Loki + Promtail + Grafana).
3. Stream logs from **all three clouds** into **SecureTheCloud dashboards**.
4. Give you a **Flight Operations Command Center** view across AWS, Azure, and GCP.

This volume assumes you’ve completed:

- **Volume 0 — Multi-Cloud Compute Architecture** (VPC/VNet foundations, Terraform basics) :contentReference[oaicite:6]{index=6}  
- **Volume 1 — Identity Foundations (AWS IAM Identity Center ↔ Entra)** :contentReference[oaicite:7]{index=7}  

---

## 🧭 Course Navigation

> 🔐 **SecureTheCloud volumes should be completed in order.**  
> Each volume builds on the previous one.

- **Volume 0:** Multi-Cloud Compute Architecture (flagship repo)
- **Volume 1:** Identity Foundations (Entra ↔ AWS IAM Identity Center)
- **Volume 2:** GCP Workforce Identity Federation
- **Volume 3:** Azure Conditional Access Zero Trust
- **Volume 4:** Multi-Cloud SIEM & Observability
- **Volume 5:** Multi-Cloud Compliance & Auditing
- **Volume 6:** Network Mesh & Cloud Routing
- **Volume 7:** Threat Detection & Identity Analytics
- **➡ Volume 8:** **Delta Airline Multi-Cloud Runner (THIS repo)**

---

## 🏗️ Architecture — Delta Airline Flight Ops Command Center

- **AWS (Passenger & Flight APIs)**
  - API Gateway + Lambda (sample flight API)
  - EC2/ECS backend for operations processing
  - CloudTrail + VPC Flow Logs → Loki
- **Azure (Workforce & Ops Portal)**
  - Entra ID as IdP for operations staff
  - Azure VM / App Service for Ops Portal
  - Sign-in logs + Activity logs → Loki
- **GCP (Analytics & Flight Prediction)**
  - Cloud Run service simulating flight prediction / delay scoring
  - IAM & VPC logs → Loki
- **Local (Observability)**
  - Docker: Loki, Promtail, Grafana
  - SecureTheCloud dashboards auto-provisioned
  - Dedicated "Delta Airline Ops Center" dashboard view

> ⚠️ **Note:** This repo uses **IDs only** (account ID, tenant, project ID).  
> **Never commit access keys, secrets, or passwords.**

---

## 🚀 Quickstart — Run the Multi-Cloud Scenario

```bash
# 1. Clone the repo
git clone https://github.com/S3curethecloud/stc-multi-cloud-runner.git
cd stc-multi-cloud-runner

# 2. Export required environment variables (example)
export AWS_ACCOUNT_ID="764265373335"
export AZURE_TENANT_ID="776f9ea5-7add-469d-bc51-8e855e9a1d26"
export AZURE_SUBSCRIPTION_ID="501c458a-5def-42cf-bbb8-c75078c1cdbc"
export GCP_PROJECT_ID="caramel-pager-470614-d1"
export GCP_PROJECT_NUMBER="973064685337"

# 3. Run the multi-cloud automation (wrapper around terraform + docker)
chmod +x automation/multicloud_run.sh
./automation/multicloud_run.sh

After successful deployment:

Visit Grafana: http://localhost:3000

Open folder: Dashboards → SecureTheCloud

Select: SecureTheCloud — Delta Airline Flight Ops Overview

You should see live logs and metrics coming from AWS, Azure, and GCP.

📂 Repo Structure

(Short version — see /syllabus for full breakdown.)

scenarios/delta-flight-ops/    # documentation for the airline case
automation/                    # multi-cloud runner scripts
terraform/                     # AWS, Azure, GCP infra code
observability/                 # Loki, Promtail, Grafana stack + dashboards
syllabus/                      # how this volume fits into the entire STC Academy

🧑‍💻 Who This Volume Is For

Cloud & Security Architects

DevSecOps / Platform Engineers

SOC Engineers and Incident Responders

Students learning real, multi-cloud architectures

Anyone building a portfolio-ready, live deployment lab

🔗 Related Repos

Volume 0 — Multi-Cloud Compute Architecture
https://github.com/S3curethecloud/multi-cloud-compute-architecture

Volume 1 — Identity Foundations (AWS ↔ Entra)
https://github.com/S3curethecloud/multi-cloud-identity-aws-entra

(Add future volumes here as you publish them.)


You can copy that into your new `README.md` and adjust details as you like.

---

## 4. `automation/multicloud_run.sh` (up-level from your current script)

Start from your script: :contentReference[oaicite:8]{index=8}  

Here’s an enhanced version tailored to Delta Airline & Volume 8:

```bash
#!/bin/bash
set -e

echo "==========================================="
echo " SecureTheCloud – Volume 8 Multi-Cloud Runner"
echo " Scenario: Delta Airline Flight Ops Command Center"
echo "==========================================="

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# 0. Pre-flight checks
echo "[0] Pre-flight checks..."
command -v terraform >/dev/null 2>&1 || { echo "Terraform is required."; exit 1; }
command -v docker >/dev/null 2>&1 || { echo "Docker is required."; exit 1; }

# 1. AWS
echo
echo "[1] Deploying AWS Flight Ops baseline..."
pushd "$ROOT_DIR/terraform/aws" >/dev/null
terraform init
terraform apply -auto-approve
popd >/dev/null

# 2. Azure
echo
echo "[2] Deploying Azure Ops Portal baseline..."
pushd "$ROOT_DIR/terraform/azure" >/dev/null
terraform init
terraform apply -auto-approve
popd >/dev/null

# 3. GCP
echo
echo "[3] Deploying GCP Analytics/Predictive baseline..."
pushd "$ROOT_DIR/terraform/gcp" >/dev/null
terraform init
terraform apply -auto-approve
popd >/dev/null

# 4. Observability stack
echo
echo "[4] Starting SecureTheCloud Observability (Loki + Promtail + Grafana)..."
pushd "$ROOT_DIR/observability" >/dev/null
docker compose up -d
popd >/dev/null

echo
echo "==============================================="
echo " ✅ Delta Airline Flight Ops Command Center is live!"
echo " - AWS, Azure, GCP infra deployed"
echo " - Observability stack running on localhost:3000"
echo " - Open Grafana → Dashboards → SecureTheCloud"
echo "==============================================="
