output "rabbitmq_endpoints" {
  description = "Rabbitmq endpoints in the Kubernetes cluster."
  value = {
    rabbitmq_endpoint                  = "rabbitmq.${var.namespace}.svc.cluster.local"
    rabbitmq_headless_endpoint         = "rabbitmq-headless.${var.namespace}.svc.cluster.local"
    rabbitmq_AMQP_port                 = "5672"
    rabbitmq_management_interface_port = "15672"
    rabbitmq_management_hostname       = var.rabbitmq_config.hostname
  }
}

output "rabbitmq_credential" {
  description = "Rabbitmq credentials used in the Kubernetes cluster."
  value = var.rabbitmq_config.store_password_to_secret_manager ? null : {
    username              = var.username,
    rabbitmq_password     = var.custom_credentials_enabled ? var.custom_credentials_config.rabbitmq_password : nonsensitive(random_password.rabbitmq_password[0].result),
    erlangcookie_password = var.custom_credentials_enabled ? var.custom_credentials_config.erlangcookie_password : nonsensitive(random_password.erlangcookie_password[0].result)
  }
}