locals {
  name        = "rabbitmq"
  region      = "us-east-2"
  environment = "prod"
  additional_tags = {
    Owner      = "organization_name"
    Expires    = "Never"
    Department = "Engineering"
  }
}

module "rabbitmq" {
  source = "https://github.com/sq-ia/terraform-kubernetes-rabbitmq.git"
  rabbitmq_config = {
    name               = local.name
    hostname           = "rabbitmq.squareops.in"
    environment        = local.environment
    values_yaml        = file("./helm/values.yaml")
    volume_size        = "50Gi"
    replica_count      = 2
    storage_class_name = "infra-service-sc"
  }
  rabbitmq_exporter_enabled  = false
  recovery_window_aws_secret = 0
}
