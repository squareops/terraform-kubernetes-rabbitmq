output "rabbitmq_endpoint" {
  value       = module.rabbitmq.rabbitmq_endpoint
  description = "Endpoint of the RabbitMQ pod that can be used to connect to the message broker."
}

output "rabbitmq_headless_endpoint" {
  value       = module.rabbitmq.rabbitmq_headless_endpoint
  description = "Headless endpoint of the RabbitMQ pod that can be used to connect to the message broker."
}

output "rabbitmq_AMQP_port" {
  value       = "5672"
  description = "Port number on which the RabbitMQ pod exposes the AMQP (Advanced Message Queuing Protocol) interface."
}

output "rabbitmq_management_interface_port" {
  value       = "15672"
  description = "Port number on which the RabbitMQ pod exposes its web-based management interface, which can be used to monitor and manage the message broker."
}

output "rabbitmq_management_hostname" {
  value       = module.rabbitmq.rabbitmq_management_hostname
  description = "Hostname that can be used to access the RabbitMQ management interface from outside the Kubernetes cluster."
}
