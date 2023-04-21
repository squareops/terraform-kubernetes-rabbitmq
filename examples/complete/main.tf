locals {
  region      = "us-east-2"
  name        = "dev"
  environment = "skaf"
}

module "rabbitmq" {
  source = "../../"
  rabbitmq_config = {
    name               = local.name
    hostname           = "rabbitmq.dev.skaf.squareops.in"
    environment        = local.environment
    values_yaml        = file("./helm/values.yaml")
    volume_size        = "50Gi"
    replica_count      = 2
    storage_class_name = "infra-service-sc"
  }
  rabbitmq_exporter_enabled  = false
  recovery_window_aws_secret = 0
}
