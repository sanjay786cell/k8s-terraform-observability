#!/usr/bin/env bash
set -e

IMAGE="$1"

if [ -z "$IMAGE" ]; then
  echo "Usage: $0 <image>"
  exit 1
fi

echo "[INFO] Scanning $IMAGE using Trivy"
trivy image --severity HIGH,CRITICAL --exit-code 1 "$IMAGE"
