output "environment" {
  value       = var.environment
  description = "Selected environment"
}

output "grafana_url" {
  description = "Grafana NodePort URL (Minikube IP + port)"
  value       = "http://$(minikube ip):32000"
  sensitive   = false
}
