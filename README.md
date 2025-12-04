<div align="center">

# 🛫 SecureTheCloud — Volume 8  
## **Delta Airline Multi-Cloud Flight Operations Command Center**

**Repo:** `stc-multi-cloud-runner`  
**Org:** `S3curethecloud`

This volume deploys a **live, multi-cloud simulation** of Delta Airline’s internal operational command center across:

- **AWS** – Flight API & Ticketing backend  
- **Azure** – Workforce Identity & Ops Portal  
- **GCP** – Flight Prediction & Analytics Engine  
- **Local Docker** – Observability Stack (Loki, Promtail, Grafana)  
- **STC Dashboards** – Airline Ops • Zero Trust • Identity • Multi-Cloud telemetry  

---

</div>

## 🎯 Purpose
Provide a real-world architecture that cloud engineers and security architects can deploy live to:

- Observe real-time multi-cloud telemetry  
- Understand identity + Zero Trust enforcement  
- Study cross-cloud operations security  
- Analyze logs inside the STC Observability Suite  

This is your **Enterprise Ops Command Center simulation**, modeled after a real airline environment.

---

## 🔗 Related Volumes

Part of the **SecureTheCloud Academy** multi-volume curriculum:

| Volume | Description |
|--------|-------------|
| **0** | Multi-Cloud Compute Architecture — Foundations |
| **1** | AWS IAM Identity Center ↔ Entra Federation |
| **2** | GCP Workforce Identity Federation |
| **3** | Azure Conditional Access Zero Trust |
| **4** | Multi-Cloud SIEM & Observability |
| **5** | Multi-Cloud Compliance & Auditing |
| **6** | Multi-Cloud Network Mesh |
| **7** | Threat Detection & Identity Analytics |
| **8** | **Multi-Cloud Runner (This Repo)** |

---

## 🧱 Architecture — Delta Flight Ops Command Center

### **AWS**
- API Gateway → Flight API (Lambda backend)  
- EC2/ECS Ops processor  
- CloudTrail + IAM Logs  
- VPC Flow Logs  

### **Azure**
- Entra Workforce Identity  
- Ops Portal VM / Function backend  
- Sign-In Logs  
- Azure Activity Logs  

### **GCP**
- Cloud Run → Flight Delay Scoring Engine  
- IAM Audit Logs  
- VPC Logging  
- Predictive analytics pipeline  

### **Local Observability (Docker Stack)**
- **Loki** — Log datastore  
- **Promtail** — Log collector  
- **Grafana** — Dashboards  
- **STC Dashboards auto-provisioned**, including:  
  - Delta Airline Ops Overview  
  - Identity & Zero Trust View  
  - Multi-Cloud SIEM View  

---

## 🚀 Quickstart — Run the Multi-Cloud Scenario

```bash
git clone https://github.com/S3curethecloud/stc-multi-cloud-runner.git
cd stc-multi-cloud-runner

chmod +x automation/multicloud_run.sh
./automation/multicloud_run.sh
```

After deployment:

1. Visit Grafana → **http://localhost:3000**  
2. Open **SecureTheCloud Dashboards**  
3. Select **Delta Airline Ops Overview**

You will now see **AWS, Azure, and GCP logs appear live.**

---

## 📂 Repo Structure (High-Level)

```bash
automation/         # Multi-cloud orchestration scripts
scenarios/          # Delta Airline Ops documentation + diagrams
terraform/          # AWS, Azure, GCP IaC modules
observability/      # Loki + Grafana + Promtail stack
syllabus/           # Volume references and curriculum map
README.md           # Master landing page
```

---

## ✈ Scenario Overview

The Delta Airline Ops Center coordinates:

- Real-time flight API events  
- Workforce authentication  
- Analytics model scoring  
- Cross-cloud logs and telemetry  
- Zero Trust signals  
- Multi-cloud operational health  

All displayed through **SecureTheCloud Observability Dashboards**.

---

## 🧑‍💻 Contributing

This volume evolves with ongoing **STC Academy** modules.  
Issues and pull requests are welcome.

---

<div align="center">

© SecureTheCloud.dev  
Built by **DeltaOps ✈️** with **MGF Automation**

</div>
