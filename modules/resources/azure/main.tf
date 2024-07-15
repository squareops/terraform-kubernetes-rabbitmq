data "azurerm_client_config" "current" {}

data "azurerm_subscription" "current" {}

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

resource "azurerm_key_vault" "rabbitmq-secret" {
  count                       = var.store_password_to_secret_manager ? 1 : 0
  name                        = format("%s-%s-%s", var.environment, var.name, "key-vault")
  resource_group_name         = var.resource_group_name
  location                    = var.resource_group_location
  sku_name                    = "standard"
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  enabled_for_disk_encryption = true
  soft_delete_retention_days  = 7

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id
    key_permissions = [
      "Get",
      "List",
    ]
    secret_permissions = [
      "Set",
      "Get",
      "List",
      "Delete",
      "Purge",
    ]
  }
}

resource "azurerm_key_vault_secret" "rabbitmq-secret" {
  count      = var.store_password_to_secret_manager ? 1 : 0
  depends_on = [azurerm_key_vault.rabbitmq-secret[0]]
  name       = format("%s-%s-%s", var.environment, var.name, "secret")
  value = var.custom_credentials_enabled ? jsonencode(
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
  content_type = "application/json"
  key_vault_id = azurerm_key_vault.rabbitmq-secret[0].id
}

output "erlangcookie_password" {
  value = var.custom_credentials_enabled ? null : nonsensitive(random_password.erlangcookie_password[0].result)
}

output "rabbitmq_password" {
  value = var.custom_credentials_enabled ? null : nonsensitive(random_password.rabbitmq_password[0].result)
}
