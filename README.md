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
# Clone the repo
git clone https://github.com/S3curethecloud/stc-multi-cloud-runner.git
cd stc-multi-cloud-runner

# (Optional) Configure cloud environment variables
# These must match your AWS, Azure, and GCP accounts
# See docs/setup.md for details
export AWS_ACCOUNT_ID="XXXXXXXXXXXX"
export AZURE_TENANT_ID="xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
export AZURE_SUBSCRIPTION_ID="xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
export GCP_PROJECT_ID="your-gcp-project-id"

# Run the multi-cloud scenario
chmod +x automation/multicloud_run.sh
./automation/multicloud_run.sh
➡ After deployment, open Grafana:
http://localhost:3000 → Dashboards → SecureTheCloud

You will see live logs & events from AWS, Azure, and GCP.
