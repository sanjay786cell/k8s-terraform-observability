variable "environment" {
  type        = string
  description = "Environment name"
}

resource "null_resource" "minikube_cluster" {

  provisioner "local-exec" {
    interpreter = ["PowerShell", "-Command"]
    command     = "& 'C:\\Program Files\\Git\\bin\\bash.exe' 'scripts/start_minikube.sh'"
  }

  triggers = {
    environment = var.environment
  }

  provisioner "local-exec" {
    when        = destroy
    interpreter = ["PowerShell", "-Command"]
    command     = "& 'C:\\Program Files\\Git\\bin\\bash.exe' 'scripts/stop_minikube.sh'"
  }
}
