#!/usr/bin/env bash
set -e

echo "[INFO] Starting Minikube using Docker driver"

minikube start --driver=docker --memory=4096 --cpus=2

kubectl config use-context minikube

echo "[INFO] Minikube started successfully"
