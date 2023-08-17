# RabbitMQ

![squareops_avatar]

[squareops_avatar]: https://squareops.com/wp-content/uploads/2022/12/squareops-logo.png

### [SquareOps Technologies](https://squareops.com/) Your DevOps Partner for Accelerating cloud journey.
<br>
This Terraform module allows you to deploy a RabbitMQ message broker on a Kubernetes cluster. It uses the [official RabbitMQ](https://github.com/bitnami/charts/tree/main/bitnami/rabbitmq) Helm chart to create a scalable, highly-available RabbitMQ cluster.

The module provides a simple way to configure and deploy RabbitMQ on Kubernetes, including the ability to:

  1. Customize the name and environment of the RabbitMQ deployment
  2. Specify the number of replicas in the cluster
  3. Set up persistent storage using a specific storage class and volume size
  4. Deploy a RabbitMQ exporter to collect metrics for Grafana
  5. Control whether or not to create the Kubernetes namespace for the deployment

The module also includes sensible defaults for all configuration options, making it easy to get up and running with RabbitMQ on Kubernetes quickly.

  ## Supported Versions:

|  Rabbitmq Helm Chart Version    |     K8s supported version   |  
| :-----:                       |         :---                |
| **10.3.5**                     |    **1.23,1.24,1.25,1.26,1.27**           |


## Usage Example

```hcl
module "rabbitmq" {
  source               = "https://github.com/sq-ia/terraform-kubernetes-rabbitmq.git"
  rabbitmq_config = {
    name                             = "rabbitmq"
    hostname                         = "rabbitmq.squareops.in"
    environment                      = "prod"
    values_yaml                      = ""
    volume_size                      = "50Gi"
    replica_count                    = 2  
    storage_class_name               = "gp3"
    store_password_to_secret_manager = true
   }
  rabbitmq_exporter_enabled  = true
  recovery_window_aws_secret = 0
  custom_credentials_config = {
    rabbitmq_password     = "aa0z1IoRjOgRuon3aG",
    erlangcookie_password = "bbddff0z1IoRuon3aG"
  }
}


```
Refer [examples](https://github.com/sq-ia/terraform-kubernetes-rabbitmq/tree/main/examples/complete) for more details.

## IAM Permissions
The required IAM permissions to create resources from this module can be found [here](https://github.com/sq-ia/terraform-kubernetes-rabbitmq/blob/main/IAM.md)

## Important Notes
  1. In order to enable the exporter, it is required to deploy Prometheus/Grafana first.
  2. The exporter is a tool that extracts metrics data from an application or system and makes it available to be scraped by Prometheus.
  3. Prometheus is a monitoring system that collects metrics data from various sources, including exporters, and stores it in a time-series database.
  4. Grafana is a data visualization and dashboard tool that works with Prometheus and other data sources to display the collected metrics in a user-friendly way.
  5. To deploy Prometheus/Grafana, please follow the installation instructions for each tool in their respective documentation.
  6. Once Prometheus and Grafana are deployed, the exporter can be configured to scrape metrics data from your application or system and send it to Prometheus.
  7. Finally, you can use Grafana to create custom dashboards and visualize the metrics data collected by Prometheus.
  8. This module is compatible with EKS version 1.23, which is great news for users deploying the module on an EKS cluster running that version. Review the module's documentation, meet specific configuration requirements, and test thoroughly after deployment to ensure everything works as expected.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_secretsmanager_secret.rabbitmq_password](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret) | resource |
| [aws_secretsmanager_secret_version.rabbitmq_password](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret_version) | resource |
| [helm_release.rabbitmq](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_namespace.rabbitmq](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [random_password.erlangcookie_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [random_password.rabbitmq_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_chart_version"></a> [chart\_version](#input\_chart\_version) | Version of the RabbitMQ chart that will be used to deploy the message broker. | `string` | `"10.3.5"` | no |
| <a name="input_create_namespace"></a> [create\_namespace](#input\_create\_namespace) | Specify whether or not to create the namespace if it does not already exist. Set it to true to create the namespace. | `string` | `true` | no |
| <a name="input_custom_credentials_config"></a> [custom\_credentials\_config](#input\_custom\_credentials\_config) | Specify the configuration settings for Rabbitmq to pass custom credentials during creation. | `any` | <pre>{<br>  "erlangcookie_password": "",<br>  "rabbitmq_password": ""<br>}</pre> | no |
| <a name="input_custom_credentials_enabled"></a> [custom\_credentials\_enabled](#input\_custom\_credentials\_enabled) | Specifies whether to enable custom credentials for Rabbitmq. | `bool` | `false` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Name of the Kubernetes namespace where the RabbitMQ deployment will be deployed. | `string` | `"rabbitmq"` | no |
| <a name="input_rabbitmq_config"></a> [rabbitmq\_config](#input\_rabbitmq\_config) | Specify the configuration settings for RabbitMQ, including the name, environment, storage options, replication settings, and custom YAML values. | `any` | <pre>{<br>  "environment": "",<br>  "hostname": "",<br>  "name": "",<br>  "replica_count": 2,<br>  "storage_class_name": "",<br>  "store_password_to_secret_manager": "",<br>  "values_yaml": "",<br>  "volume_size": ""<br>}</pre> | no |
| <a name="input_rabbitmq_exporter_enabled"></a> [rabbitmq\_exporter\_enabled](#input\_rabbitmq\_exporter\_enabled) | Specify whether or not to deploy RabbitMQ exporter to collect RabbitMQ metrics for monitoring in Grafana. | `bool` | `true` | no |
| <a name="input_recovery_window_aws_secret"></a> [recovery\_window\_aws\_secret](#input\_recovery\_window\_aws\_secret) | Number of days that AWS Secrets Manager will wait before deleting a secret. This value can be set to 0 to force immediate deletion, or to a value between 7 and 30 days to allow for recovery. | `number` | `0` | no |
| <a name="input_username"></a> [username](#input\_username) | Username that will be used for authentication when connecting to the RabbitMQ cluster. | `string` | `"admin"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_rabbitmq_credential"></a> [rabbitmq\_credential](#output\_rabbitmq\_credential) | Rabbitmq credentials used in the Kubernetes cluster. |
| <a name="output_rabbitmq_endpoints"></a> [rabbitmq\_endpoints](#output\_rabbitmq\_endpoints) | Rabbitmq endpoints in the Kubernetes cluster. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Contribution & Issue Reporting

To report an issue with a project:

  1. Check the repository's [issue tracker](https://github.com/sq-ia/terraform-kubernetes-rabbitmq/issues) on GitHub
  2. Search to see if the issue has already been reported
  3. If you can't find an answer to your question in the documentation or issue tracker, you can ask a question by creating a new issue. Be sure to provide enough context and details so others can understand your problem.

## License

Apache License, Version 2.0, January 2004 (http://www.apache.org/licenses/).

## Support Us

To support a GitHub project by liking it, you can follow these steps:

  1. Visit the repository: Navigate to the [GitHub repository](https://github.com/sq-ia/terraform-kubernetes-rabbitmq).

  2. Click the "Star" button: On the repository page, you'll see a "Star" button in the upper right corner. Clicking on it will star the repository, indicating your support for the project.

  3. Optionally, you can also leave a comment on the repository or open an issue to give feedback or suggest changes.

Starring a repository on GitHub is a simple way to show your support and appreciation for the project. It also helps to increase the visibility of the project and make it more discoverable to others.

## Who we are

We believe that the key to success in the digital age is the ability to deliver value quickly and reliably. That’s why we offer a comprehensive range of DevOps & Cloud services designed to help your organization optimize its systems & Processes for speed and agility.

  1. We are an AWS Advanced consulting partner which reflects our deep expertise in AWS Cloud and helping 100+ clients over the last 5 years.
  2. Expertise in Kubernetes and overall container solution helps companies expedite their journey by 10X.
  3. Infrastructure Automation is a key component to the success of our Clients and our Expertise helps deliver the same in the shortest time.
  4. DevSecOps as a service to implement security within the overall DevOps process and helping companies deploy securely and at speed.
  5. Platform engineering which supports scalable,Cost efficient infrastructure that supports rapid development, testing, and deployment.
  6. 24*7 SRE service to help you Monitor the state of your infrastructure and eradicate any issue within the SLA.

We provide [support](https://squareops.com/contact-us/) on all of our projects, no matter how small or large they may be.

To find more information about our company, visit [squareops.com](https://squareops.com/), follow us on [Linkedin](https://www.linkedin.com/company/squareops-technologies-pvt-ltd/), or fill out a [job application](https://squareops.com/careers/). If you have any questions or would like assistance with your cloud strategy and implementation, please don't hesitate to [contact us](https://squareops.com/contact-us/).
