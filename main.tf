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
      rabbitmq_password         = var.custom_credentials_enabled ? var.custom_credentials_config.rabbitmq_password : var.rabbitmq_password,
      storage_class_name        = var.rabbitmq_config.storage_class_name,
      rabbitmq_volume_size      = var.rabbitmq_config.volume_size,
      erlangcookie_password     = var.custom_credentials_enabled ? var.custom_credentials_config.erlangcookie_password : var.erlangcookie_password,
      rabbitmq_exporter_enabled = var.rabbitmq_exporter_enabled,
      service_monitor_namespace = var.namespace
    }),
    var.rabbitmq_config.values_yaml
  ]
}
