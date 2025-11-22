variable "environment" {
  type        = string
  description = "Environment name"
}

variable "enable_monitoring" {
  type        = bool
  description = "Toggle monitoring stack"
}

# Monitoring namespace
resource "kubernetes_namespace" "monitoring" {
  count = var.enable_monitoring ? 1 : 0

  metadata {
    name = "monitoring"
  }
}

# Example: Secret for Grafana admin password (security best practice demo)
resource "kubernetes_secret" "grafana_admin" {
  count = var.enable_monitoring ? 1 : 0

  metadata {
    name      = "grafana-admin-credentials"
    namespace = kubernetes_namespace.monitoring[0].metadata[0].name
  }

  data = {
    admin-user     = base64encode("admin")
    admin-password = base64encode("ChangeMe123!")
  }

  type = "Opaque"
}

# Helm release for kube-prometheus-stack
resource "helm_release" "kube_prometheus_stack" {
  count      = var.enable_monitoring ? 1 : 0
  name       = "kube-prometheus-stack"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
  namespace  = kubernetes_namespace.monitoring[0].metadata[0].name
  version    = "65.0.0" # example pinned version

  # For simplicity we still use an inline adminPassword here.
  # In a real setup you would wire the helm chart to use the Secret above.
  values = [
    yamlencode({
      grafana = {
        adminUser     = "admin"
        adminPassword = "ChangeMe123!"
        service = {
          type     = "NodePort"
          nodePort = 32000
        }
      }

      prometheus = {
        service = {
          type     = "NodePort"
          nodePort = 32001
        }
      }
    })
  ]
}
