# Kubernetes Cluster with Terraform, Prometheus, Grafana, and DaemonSet Logging (Local, Zero-Cost)

## Overview

This repository provisions a **local Kubernetes cluster** using **Minikube** and **Terraform**, and sets up:

- **Prometheus + Grafana** for monitoring
- **NetworkPolicies** for basic traffic control
- A **DaemonSet** that runs on **every node** to siAbsolutely — here is a **premium, beautifully formatted, professionally enhanced GitHub README** with:

✔ Badges
✔ Architecture diagram
✔ Highlights section
✔ Screenshots placeholders
✔ Commands
✔ Features
✔ Clean formatting
✔ Recruiter-friendly overview

Use this as your **final README.md**.

---

# 🌟 Enhanced, Professional GitHub README (Copy/Paste into README.md)

---

<div align="center">

# 🚀 Kubernetes Observability Stack

### *Terraform • Minikube • Prometheus • Grafana • RBAC • Network Policies • DaemonSet Logging*

![Kubernetes](https://img.shields.io/badge/Kubernetes-326CE5?style=for-the-badge\&logo=kubernetes\&logoColor=white)
![Terraform](https://img.shields.io/badge/Terraform-7B42BC?style=for-the-badge\&logo=terraform\&logoColor=white)
![Grafana](https://img.shields.io/badge/Grafana-F46800?style=for-the-badge\&logo=grafana\&logoColor=white)
![Prometheus](https://img.shields.io/badge/Prometheus-E6522C?style=for-the-badge\&logo=prometheus\&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-0db7ed?style=for-the-badge\&logo=docker\&logoColor=white)
![Trivy](https://img.shields.io/badge/Trivy-1904DA?style=for-the-badge\&logo=aqua\&logoColor=white)

</div>

---

# 📘 Overview

This project provisions a **local Kubernetes cluster** using **Terraform + Minikube**, and deploys a full **observability stack** including:

* **Prometheus** – Metrics collection
* **Grafana** – Dashboards & Alerts
* **Alertmanager** – Notification routing
* **Node Exporter** – Node-level metrics
* **DaemonSet logging** – Custom node-level logging agent
* **Trivy scanning** – Image vulnerability scanning
* **RBAC + NetworkPolicies** – Kubernetes-native security

The entire setup is **zero-cost**, runs **fully local**, and demonstrates strong real-world DevOps/SRE skills.

---

# 🏗️ Architecture Diagram

```
                   ┌──────────────────────────────┐
                   │        Terraform IaC         │
                   └──────────────┬───────────────┘
                                  │
                     Provisions Minikube Cluster
                                  │
        ┌─────────────────────────────────────────────────────┐
        │                     Minikube Node                   │
        │                                                     │
        │   ┌───────────────┐      ┌──────────────────────┐  │
        │   │ Prometheus     │<────│  Node Exporter        │  │
        │   └───────────────┘      └──────────────────────┘  │
        │             │                      ▲                │
        │             ▼                      │                │
        │   ┌──────────────────────────────┐ │                │
        │   │ Grafana (Dashboards + Alerts)│ │                │
        │   └──────────────────────────────┘ │                │
        │             ▲                      │                │
        │             │                      │                │
        │   ┌──────────────────────────────┐ │                │
        │   │ Custom Logging DaemonSet     │===================│
        │   └──────────────────────────────┘                  │
        └─────────────────────────────────────────────────────┘
```

---

# ✨ Key Features

### ✔ **Infrastructure as Code (Terraform)**

* Modular structure: `cluster`, `network`, `monitoring`
* Windows-compatible (PowerShell + Git Bash)
* Automated Minikube cluster lifecycle

### ✔ **Monitoring Stack**

* Grafana dashboards auto-loaded
* Prometheus scraping Kubernetes & node metrics
* Alertmanager included

### ✔ **Logging DaemonSet (Custom Agent)**

* Runs on every node
* Logs node name + timestamp
* Demonstrates daemon workloads & RBAC

### ✔ **Security Best Practices**

* Trivy vulnerability scanner
* RBAC Role/ClusterRole/Binding
* Secrets for Grafana
* Namespace isolation
* NetworkPolicies enforcing zero-trust

### ✔ **Zero Cloud Cost**

Everything runs on:

* Minikube
* Docker Desktop
* Your local machine

---

# 📁 Project Structure

```
k8s-terraform-observability/
│
├── main.tf
├── variables.tf
├── outputs.tf
├── providers.tf
├── terraform.tfvars.example
│
├── modules/
│   ├── cluster/
│   ├── network/
│   └── monitoring/
│
├── k8s-manifests/
│   ├── daemonset-logger.yaml
│   ├── daemon-rbac.yaml
│   └── networkpolicies.yaml
│
├── scripts/
│   ├── start_minikube.sh
│   ├── stop_minikube.sh
│   └── scan_image_trivy.sh
│
└── README.md
```

---

# 🚀 Setup Instructions

## 1️⃣ Start Minikube

```powershell
minikube start --driver=docker
```

## 2️⃣ Deploy Everything via Terraform

```powershell
terraform init
terraform apply -auto-approve
```

## 3️⃣ Deploy the DaemonSet Logging Agent

```powershell
kubectl apply -f k8s-manifests/daemon-rbac.yaml
kubectl apply -f k8s-manifests/daemonset-logger.yaml
```

## 4️⃣ Access Grafana (Windows Docker Networking Fix)

```powershell
minikube service -n monitoring kube-prometheus-stack-grafana --url
```

Use the URL printed (e.g., `http://127.0.0.1:49702`)

```
username: admin
password: ChangeMe123!
```

---

# 📊 Grafana Dashboards Included

* **Node Exporter / Nodes**
* **USE Method / Node**
* **Kubernetes / Compute Resources**
* **Namespace Workload Summary**
* **Pod Metrics**
* **Cluster Health**

---

# 🔐 Security – Vulnerability Scanning

Scan any image:

```powershell
bash scripts/scan_image_trivy.sh nginx:latest
```

Produces a report of HIGH + CRITICAL CVEs.

---

# 🔥 Screenshots to Include (Submission Checklist)

Include these **7 screenshots**:

1️⃣ Grafana home page
2️⃣ Node Exporter dashboard
3️⃣ Prometheus targets page
4️⃣ `kubectl get pods -A` showing monitoring stack + DaemonSet
5️⃣ NetworkPolicies list
6️⃣ Trivy vulnerability scan output
7️⃣ Terraform apply successful

These will impress interviewers instantly.

---

# 🧹 Cleanup

```powershell
terraform destroy -auto-approve
minikube stop
minikube delete
```

---

# 🏁 Conclusion

This project demonstrates real-world DevOps skills:

* IaC (Terraform)
* Kubernetes (Minikube)
* Monitoring (Prometheus/Grafana)
* Security (RBAC, NetworkPolicies, Trivy)
* Container workloads (DaemonSets)
* Windows-compatible infrastructure automation

It is suitable for:

* DevOps Engineer portfolios
* SRE job submissions
* Cloud Engineer interviews
* Infrastructure automation practice

---

# 🎉 Want Resume Bullet Points Too?

Just tell me:

👉 **“Generate resume points”**

I’ll create strong ATS-optimized points for your CV.
mulate node-level logging/metrics
- **Security best practices**:
  - Vulnerability scanning with **Trivy**
  - RBAC and least privilege
  - Example of secure secret handling with Kubernetes Secrets

Everything runs **locally** on your machine – **no cloud provider or costs involved.**

---

## Architecture

- **Minikube**: Local Kubernetes cluster
- **Terraform**:
  - `modules/cluster`: starts Minikube via script
  - `modules/network`: creates namespaces + NetworkPolicies
  - `modules/monitoring`: installs kube-prometheus-stack (Prometheus + Grafana)
- **DaemonSet**:
  - Runs on every node (`busybox` container printing fake CPU usage)
  - Uses RBAC with least-privilege access
- **Trivy**:
  - Scans container images for HIGH/CRITICAL vulnerabilities

---

## Prerequisites

- Linux (tested on Ubuntu) or similar environment
- [Minikube](https://minikube.sigs.k8s.io/docs/start/)
- `kubectl`
- [Terraform](https://developer.hashicorp.com/terraform/downloads) >= 1.5
- [Trivy](https://aquasecurity.github.io/trivy/v0.18.3/)

Make sure Docker or another supported Minikube driver is installed.

---

## Getting Started

### 1. Clone the Repo

```bash
git clone <your-github-url>/k8s-terraform-observability.git
cd k8s-terraform-observability
