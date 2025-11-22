variable "environment" {
  type        = string
  description = "Environment name"
}

variable "enable_network_policies" {
  type        = bool
  description = "Toggle NetworkPolicies"
}

# Application namespace
resource "kubernetes_namespace" "app" {
  metadata {
    name = "app-${var.environment}"

    labels = {
      "env" = var.environment
    }
  }
}

# Default deny all traffic in app namespace
resource "kubernetes_network_policy" "default_deny_all" {
  count = var.enable_network_policies ? 1 : 0

  metadata {
    name      = "default-deny-all"
    namespace = kubernetes_namespace.app.metadata[0].name
  }

  spec {
    pod_selector {}

    policy_types = ["Ingress", "Egress"]
  }
}

# Allow all pods in same namespace to talk to each other
resource "kubernetes_network_policy" "allow_same_namespace" {
  count = var.enable_network_policies ? 1 : 0

  metadata {
    name      = "allow-same-namespace"
    namespace = kubernetes_namespace.app.metadata[0].name
  }

  spec {
    pod_selector {}

    ingress {
      from {
        pod_selector {}
      }
    }

    egress {
      to {
        pod_selector {}
      }
    }

    policy_types = ["Ingress", "Egress"]
  }
}
