output "rabbitmq_endpoints" {
  description = "Rabbitmq endpoints in the Kubernetes cluster."
  value       = module.rabbitmq.rabbitmq_endpoints
}

output "rabbitmq_credential" {
  description = "Rabbitmq credentials used in the Kubernetes cluster."
  value       = local.store_password_to_secret_manager ? null : module.rabbitmq.rabbitmq_credential
}
