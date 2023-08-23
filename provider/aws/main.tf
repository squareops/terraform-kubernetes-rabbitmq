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
  count                   = var.store_password_to_secret_manager ? 1 : 0
  name                    = format("%s/%s/%s", var.environment, var.name, "rabbitmq")
  recovery_window_in_days = var.recovery_window_aws_secret
}

resource "aws_secretsmanager_secret_version" "rabbitmq_password" {
  count     = var.store_password_to_secret_manager ? 1 : 0
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

output "erlangcookie_password" {
  value = var.custom_credentials_enabled ? null : nonsensitive(random_password.erlangcookie_password[0].result)
}

output "rabbitmq_password" {
  value = var.custom_credentials_enabled ? null : nonsensitive(random_password.rabbitmq_password[0].result)
}
