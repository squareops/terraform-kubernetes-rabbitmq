variable "name" {
  description = "Name identifier for module to be added as suffix to resources"
  type        = string
  default     = "test"
}

variable "environment" {
  description = "Environment in which the infrastructure is being deployed (e.g., production, staging, development)"
  type        = string
  default     = "test"
}

variable "username" {
  default     = "admin"
  type        = string
  description = "Username that will be used for authentication when connecting to the RabbitMQ cluster."
}

variable "store_password_to_secret_manager" {
  type        = bool
  default     = false
  description = "Specifies whether to store the credentials in GCP secret manager."
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

variable "recovery_window_aws_secret" {
  type        = number
  default     = 0
  description = "Number of days that AWS Secrets Manager will wait before deleting a secret. This value can be set to 0 to force immediate deletion, or to a value between 7 and 30 days to allow for recovery."
}
