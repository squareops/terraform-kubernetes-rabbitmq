locals {
  region      = "us-east-2"
  name        = "skaf"
  environment = "prod"
}

module "rabbitmq" {
  source                     = "../../"
  rabbitmq_exporter_enabled  = true
  recovery_window_aws_secret = 0
  rabbitmq_config = {
    name               = local.name
    environment        = local.environment
    storage_class_name = "infra-service-sc"
    volume_size        = "50Gi"
    hostname           = "rabbitmq.squareops.in"
    replica_count      = 2
    values_yaml        = file("./helm/values.yaml")
  }

}
