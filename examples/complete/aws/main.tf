locals {
  name        = "rabbitmq"
  region      = ""
  environment = "prod"
  additional_tags = {
    Owner      = "organization_name"
    Expires    = "Never"
    Department = "Engineering"
  }
  create_namespace                 = true
  namespace                        = "rabbitmq"
  store_password_to_secret_manager = false
  custom_credentials_enabled       = false
  custom_credentials_config = {
    rabbitmq_password     = "aa0z1IoRjOgRuon3aG",
    erlangcookie_password = "bbddff0z1IoRuon3aG"
  }
}

module "aws" {
  source                           = "squareops/rabbitmq/kubernetes//modules/resources/aws"
  environment                      = local.environment
  name                             = local.name
  store_password_to_secret_manager = local.store_password_to_secret_manager
  custom_credentials_enabled       = local.custom_credentials_enabled
  custom_credentials_config        = local.custom_credentials_config
}

module "rabbitmq" {
  source           = "squareops/rabbitmq/kubernetes"
  version          = "2.1.1"
  create_namespace = local.create_namespace
  namespace        = local.namespace
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
  rabbitmq_password          = local.custom_credentials_enabled ? "" : module.aws.rabbitmq_password
  erlangcookie_password      = local.custom_credentials_enabled ? "" : module.aws.erlangcookie_password
}
