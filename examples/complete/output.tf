output "rabbitmq_endpoint" {
  value       = module.rabbitmq.rabbitmq_endpoint
  description = "rabbitmq pod connection endpoint"
}

output "rabbitmq_headless_endpoint" {
  value = module.rabbitmq.rabbitmq_headless_endpoint
}

output "rabbitmq_AMQP_port" {
  value       = "5672"
  description = "rabbitmq AMQP(Advanced Message Queuing Protocol) port"
}

output "rabbitmq_management_interface_port" {
  value = "15672"
}

output "rabbitmq_management_hostname" {
  value = module.rabbitmq.rabbitmq_management_hostname
}
