terraform {
  required_version = ">= 1.5.0"
}

# Cluster (Minikube)
module "cluster" {
  source      = "./modules/cluster"
  environment = var.environment
}

# Network policies, namespaces, etc.
module "network" {
  source                  = "./modules/network"
  environment             = var.environment
  enable_network_policies = var.enable_network_policies

  depends_on = [module.cluster]
}

# Monitoring stack (Prometheus, Grafana)
module "monitoring" {
  source            = "./modules/monitoring"
  environment       = var.environment
  enable_monitoring = var.enable_monitoring

  depends_on = [module.cluster]
}
