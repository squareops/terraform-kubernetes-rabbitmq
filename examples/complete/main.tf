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
  custom_credentials_enabled = true
  custom_credentials_config = {
    rabbitmq_password     = "aa0z1IoRjOgRuon3aG",
    erlangcookie_password = "bbddff0z1IoRuon3aG"
  }
}
