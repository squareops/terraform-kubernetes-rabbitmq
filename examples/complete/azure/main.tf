locals {
  name        = "rabbitmq"
  region      = "eastus"
  environment = "prod"
  additional_tags = {
    Owner      = "organization_name"
    Expires    = "Never"
    Department = "Engineering"
  }
  create_namespace                 = true
  namespace                        = "rabbitmq"
  store_password_to_secret_manager = true
  custom_credentials_enabled       = false
  custom_credentials_config = {
    rabbitmq_password     = "aa0z1IoRjOgRuon3aG",
    erlangcookie_password = "bbddff0z1IoRuon3aG"
  }
}

module "azure" {
  source                           = "https://github.com/sq-ia/terraform-kubernetes-rabbitmq.git//modules/resources/azure"
  resource_group_name              = ""
  resource_group_location          = local.region
  environment                      = local.environment
  name                             = local.name
  username                         = "admin" # Rabbitmq username
  store_password_to_secret_manager = local.store_password_to_secret_manager
  custom_credentials_enabled       = local.custom_credentials_enabled
  custom_credentials_config        = local.custom_credentials_config
}

module "rabbitmq" {
  source           = "https://github.com/sq-ia/terraform-kubernetes-rabbitmq.git"
  create_namespace = local.create_namespace
  namespace        = local.namespace
  rabbitmq_config = {
    name                             = local.name
    environment                      = local.environment
    values_yaml                      = file("./helm/values.yaml")
    volume_size                      = "50Gi"
    replica_count                    = 2
    storage_class_name               = "infra-service-sc"
    store_password_to_secret_manager = local.store_password_to_secret_manager
  }
  rabbitmq_exporter_enabled  = true
  custom_credentials_enabled = local.custom_credentials_enabled
  custom_credentials_config  = local.custom_credentials_config
  rabbitmq_password          = local.custom_credentials_enabled ? "" : module.azure.rabbitmq_password
  erlangcookie_password      = local.custom_credentials_enabled ? "" : module.azure.erlangcookie_password
}
