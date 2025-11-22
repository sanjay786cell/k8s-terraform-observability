
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

Produces a report of HIGH + CRITICAL CVEs.

---

<img width="1920" height="985" alt="image" src="https://github.com/user-attachments/assets/835e7f4c-a5d2-4f85-956e-9d7764c8e44b" />

<img width="1897" height="997" alt="image" src="https://github.com/user-attachments/assets/a65869a5-06c1-4822-8733-a123109ef830" />

<img width="1920" height="981" alt="image" src="https://github.com/user-attachments/assets/43c95a45-6d14-4f75-9fe3-d0fa7927f4c1" />

<img width="1214" height="612" alt="image" src="https://github.com/user-attachments/assets/dfee79ad-7fb8-4770-a3b7-6ae42a58ba01" />

<img width="799" height="222" alt="image" src="https://github.com/user-attachments/assets/7dc32343-aff1-4c29-bb9f-13f092e8d15c" />



