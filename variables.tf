variable "rabbitmq_config" {
  default = {
    name                             = ""
    environment                      = ""
    replica_count                    = 2
    storage_class_name               = ""
    volume_size                      = ""
    hostname                         = ""
    store_password_to_secret_manager = ""
    values_yaml                      = ""
  }
  type        = any
  description = "Specify the configuration settings for RabbitMQ, including the name, environment, storage options, replication settings, and custom YAML values."
}

variable "username" {
  default     = "admin"
  type        = string
  description = "Username that will be used for authentication when connecting to the RabbitMQ cluster."
}

variable "namespace" {
  default     = "rabbitmq"
  type        = string
  description = "Name of the Kubernetes namespace where the RabbitMQ deployment will be deployed."
}

variable "chart_version" {
  default     = "10.3.5"
  type        = string
  description = "Version of the RabbitMQ chart that will be used to deploy the message broker."
}

variable "rabbitmq_exporter_enabled" {
  default     = true
  type        = bool
  description = "Specify whether or not to deploy RabbitMQ exporter to collect RabbitMQ metrics for monitoring in Grafana."
}

variable "recovery_window_aws_secret" {
  default     = 0
  type        = number
  description = "Number of days that AWS Secrets Manager will wait before deleting a secret. This value can be set to 0 to force immediate deletion, or to a value between 7 and 30 days to allow for recovery."
}

variable "create_namespace" {
  default     = true
  type        = string
  description = "Specify whether or not to create the namespace if it does not already exist. Set it to true to create the namespace."
}

variable "custom_credentials_enabled" {
  type        = bool
  default     = false
  description = "Specifies whether to enable custom credentials for Rabbitmq."
}

variable "custom_credentials_config" {
  type = any
  default = {
    rabbitmq_password     = "",
    erlangcookie_password = ""
  }
  description = "Specify the configuration settings for Rabbitmq to pass custom credentials during creation."
}

variable "erlangcookie_password" {
  description = "password for Rabbitmq erlangcookie"
  type        = string
  default     = ""
}

variable "rabbitmq_password" {
  description = "password for Rabbitmq"
  type        = string
  default     = ""
}
