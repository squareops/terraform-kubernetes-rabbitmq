variable "rabbitmq_config" {
  type = any
  default = {
    name               = ""
    environment        = ""
    replica_count      = 2
    storage_class_name = ""
    volume_size        = ""
    hostname           = ""
    values_yaml        = ""

  }
  description = "Rabbitmq configurations"
}

variable "username" {
  default     = "admin"
  type        = string
  description = "Enter user name"
}

variable "namespace" {
  default     = "rabbitmq"
  type        = string
  description = "Enter namespace name"
}

variable "chart_version" {
  default     = "10.3.5"
  type        = string
  description = "Chart version of rabbitmq"
}

variable "rabbitmq_exporter_enabled" {
  default     = true
  type        = bool
  description = "Set true to deploy rabbitmq exporter to get metrics in grafana"
}

variable "recovery_window_aws_secret" {
  default     = 0
  type        = number
  description = "Number of days that AWS Secrets Manager waits before it can delete the secret. This value can be 0 to force deletion without recovery or range from 7 to 30 days."
}
