# Kubernetes Cluster with Terraform, Prometheus, Grafana, and DaemonSet Logging (Local, Zero-Cost)

## Overview

This repository provisions a **local Kubernetes cluster** using **Minikube** and **Terraform**, and sets up:

- **Prometheus + Grafana** for monitoring
- **NetworkPolicies** for basic traffic control
- A **DaemonSet** that runs on **every node** to simulate node-level logging/metrics
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
