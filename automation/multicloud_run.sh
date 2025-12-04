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
