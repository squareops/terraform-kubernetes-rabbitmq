output "rabbitmq_endpoint" {
  value       = "rabbitmq.${var.namespace}.svc.cluster.local"
  description = "rabbitmq pod connection endpoint"
}

output "rabbitmq_headless_endpoint" {
  value       = "rabbitmq-headless.${var.namespace}.svc.cluster.local"
  description = "rabbitmq pod connection endpoint"
}

output "rabbitmq_AMQP_port" {
  value       = "5672"
  description = "rabbitmq AMQP(Advanced Message Queuing Protocol) port"
}

output "rabbitmq_management_interface_port" {
  value       = "15672"
  description = "rabbitmq management interface port"
}

output "rabbitmq_management_hostname" {
  value       = var.rabbitmq_config.hostname
  description = "rabbitmq management hostnae"
}
