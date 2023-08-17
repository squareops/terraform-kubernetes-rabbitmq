resource "random_password" "rabbitmq_password" {
  count   = var.custom_credentials_enabled ? 0 : 1
  length  = 20
  special = false
}

resource "random_password" "erlangcookie_password" {
  count   = var.custom_credentials_enabled ? 0 : 1
  length  = 20
  special = false
}

resource "aws_secretsmanager_secret" "rabbitmq_password" {
  count                   = var.rabbitmq_config.store_password_to_secret_manager ? 1 : 0
  name                    = format("%s/%s/%s", var.rabbitmq_config.environment, var.rabbitmq_config.name, "rabbitmq")
  recovery_window_in_days = var.recovery_window_aws_secret
}

resource "aws_secretsmanager_secret_version" "rabbitmq_password" {
  count     = var.rabbitmq_config.store_password_to_secret_manager ? 1 : 0
  secret_id = aws_secretsmanager_secret.rabbitmq_password[0].id
  secret_string = var.custom_credentials_enabled ? jsonencode(
    {
      "username" : "${var.username}",
      "rabbitmq_password" : "${var.custom_credentials_config.rabbitmq_password}",
      "erlangcookie_password" : "${var.custom_credentials_config.erlangcookie_password}"

    }) : jsonencode(
    {
      "username" : "${var.username}",
      "rabbitmq_password" : "${random_password.rabbitmq_password[0].result}",
      "erlangcookie_password" : "${random_password.erlangcookie_password[0].result}"
  })
}

resource "kubernetes_namespace" "rabbitmq" {
  count = var.create_namespace ? 1 : 0
  metadata {
    annotations = {}
    name        = var.namespace
  }
}

resource "helm_release" "rabbitmq" {
  depends_on = [kubernetes_namespace.rabbitmq]
  name       = "rabbitmq"
  chart      = "rabbitmq"
  version    = var.chart_version
  timeout    = 600
  namespace  = var.namespace
  repository = "https://charts.bitnami.com/bitnami"
  values = [
    templatefile("${path.module}/helm/values/values.yaml", {
      hostname                  = var.rabbitmq_config.hostname,
      replicacount              = var.rabbitmq_config.replica_count,
      rabbitmq_username         = var.username,
      rabbitmq_password         = var.custom_credentials_enabled ? var.custom_credentials_config.rabbitmq_password : random_password.rabbitmq_password[0].result,
      storage_class_name        = var.rabbitmq_config.storage_class_name,
      rabbitmq_volume_size      = var.rabbitmq_config.volume_size,
      erlangcookie_password     = var.custom_credentials_enabled ? var.custom_credentials_config.erlangcookie_password : random_password.erlangcookie_password[0].result,
      rabbitmq_exporter_enabled = var.rabbitmq_exporter_enabled
      service_monitor_namespace = var.namespace
    }),
    var.rabbitmq_config.values_yaml
  ]
}
