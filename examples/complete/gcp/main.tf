locals {
  name        = "rabbitmq"
  region      = "us-east-2"
  environment = "prod"
  additional_tags = {
    Owner      = "organization_name"
    Expires    = "Never"
    Department = "Engineering"
  }
  store_password_to_secret_manager = true
  custom_credentials_enabled       = false
  custom_credentials_config = {
    rabbitmq_password     = "aa0z1IoRjOgRuon3aG",
    erlangcookie_password = "bbddff0z1IoRuon3aG"
  }
}

module "gcp" {
  source                           = "https://github.com/sq-ia/terraform-kubernetes-rabbitmq.git//modules/resources/gcp"
  project_id                       = ""
  environment                      = local.environment
  name                             = local.name
  store_password_to_secret_manager = local.store_password_to_secret_manager
  custom_credentials_enabled       = local.custom_credentials_enabled
  custom_credentials_config        = local.custom_credentials_config
}

module "rabbitmq" {
  source = "https://github.com/sq-ia/terraform-kubernetes-rabbitmq.git"
  rabbitmq_config = {
    name                             = local.name
    hostname                         = "rabbitmq.squareops.in"
    environment                      = local.environment
    values_yaml                      = file("./helm/values.yaml")
    volume_size                      = "50Gi"
    replica_count                    = 2
    storage_class_name               = "infra-service-sc"
    store_password_to_secret_manager = local.store_password_to_secret_manager
  }
  rabbitmq_exporter_enabled  = true
  recovery_window_aws_secret = 0
  custom_credentials_enabled = local.custom_credentials_enabled
  custom_credentials_config  = local.custom_credentials_config
  rabbitmq_password          = local.custom_credentials_enabled ? "" : module.gcp.rabbitmq_password
  erlangcookie_password      = local.custom_credentials_enabled ? "" : module.gcp.erlangcookie_password
}
