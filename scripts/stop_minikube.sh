#!/usr/bin/env bash
set -e

echo "[INFO] Stopping Minikube..."

minikube stop || true

echo "[INFO] Minikube stopped"
