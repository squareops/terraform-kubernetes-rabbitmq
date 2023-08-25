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

resource "google_secret_manager_secret" "rabbitmq_secret" {
  count     = var.store_password_to_secret_manager ? 1 : 0
  project   = var.project_id
  secret_id = format("%s-%s-%s", var.environment, var.name, "rabbitmq")

  replication {
    automatic = true
  }
}

resource "google_secret_manager_secret_version" "rabbitmq_secret" {
  count  = var.store_password_to_secret_manager ? 1 : 0
  secret = google_secret_manager_secret.rabbitmq_secret[0].id
  secret_data = var.custom_credentials_enabled ? jsonencode(
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

output "erlangcookie_password" {
  value = var.custom_credentials_enabled ? null : nonsensitive(random_password.erlangcookie_password[0].result)
}

output "rabbitmq_password" {
  value = var.custom_credentials_enabled ? null : nonsensitive(random_password.rabbitmq_password[0].result)
}
