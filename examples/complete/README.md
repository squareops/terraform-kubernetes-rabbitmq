## Rabbitmq Example
![squareops_avatar]

[squareops_avatar]: https://squareops.com/wp-content/uploads/2022/12/squareops-logo.png

### [SquareOps Technologies](https://squareops.com/) Your DevOps Partner for Accelerating cloud journey.
<br>
This example will be very useful for users who are new to a module and want to quickly learn how to use it. By reviewing the examples, users can gain a better understanding of how the module works, what features it supports, and how to customize it to their specific needs.
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_rabbitmq"></a> [rabbitmq](#module\_rabbitmq) | https://github.com/sq-ia/terraform-kubernetes-rabbitmq.git | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_eks_cluster.cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster) | data source |
| [aws_eks_cluster_auth.cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster_auth) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_rabbitmq_AMQP_port"></a> [rabbitmq\_AMQP\_port](#output\_rabbitmq\_AMQP\_port) | Port number on which the RabbitMQ pod exposes the AMQP (Advanced Message Queuing Protocol) interface. |
| <a name="output_rabbitmq_endpoint"></a> [rabbitmq\_endpoint](#output\_rabbitmq\_endpoint) | Endpoint of the RabbitMQ pod that can be used to connect to the message broker. |
| <a name="output_rabbitmq_headless_endpoint"></a> [rabbitmq\_headless\_endpoint](#output\_rabbitmq\_headless\_endpoint) | Headless endpoint of the RabbitMQ pod that can be used to connect to the message broker. |
| <a name="output_rabbitmq_management_hostname"></a> [rabbitmq\_management\_hostname](#output\_rabbitmq\_management\_hostname) | Hostname that can be used to access the RabbitMQ management interface from outside the Kubernetes cluster. |
| <a name="output_rabbitmq_management_interface_port"></a> [rabbitmq\_management\_interface\_port](#output\_rabbitmq\_management\_interface\_port) | Port number on which the RabbitMQ pod exposes its web-based management interface, which can be used to monitor and manage the message broker. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
