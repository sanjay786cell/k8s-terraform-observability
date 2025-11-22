variable "environment" {
  description = "Environment name (e.g. dev, prod)"
  type        = string
  default     = "dev"
}

variable "kubeconfig_path" {
  description = "Path to kubeconfig"
  type        = string
  default     = "~/.kube/config"
}

variable "enable_network_policies" {
  description = "Enable/disable NetworkPolicies"
  type        = bool
  default     = true
}

variable "enable_monitoring" {
  description = "Enable/disable Prometheus + Grafana"
  type        = bool
  default     = true
}
