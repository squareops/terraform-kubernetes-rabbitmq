## Rabbitmq Example
![squareops_avatar]

[squareops_avatar]: https://squareops.com/wp-content/uploads/2022/12/squareops-logo.png

### [SquareOps Technologies](https://squareops.com/) Your DevOps Partner for Accelerating cloud journey.
<br>
This example will be very useful for users who are new to a module and want to quickly learn how to use it. By reviewing the examples, users can gain a better understanding of how the module works, what features it supports, and how to customize it to their specific needs.

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.70.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_azure"></a> [azure](#module\_azure) | squareops/rabbitmq/kubernetes//modules/resources/azure | n/a |
| <a name="module_rabbitmq"></a> [rabbitmq](#module\_rabbitmq) | squareops/rabbitmq/kubernetes | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_kubernetes_cluster.primary](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/kubernetes_cluster) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_rabbitmq_credential"></a> [rabbitmq\_credential](#output\_rabbitmq\_credential) | Rabbitmq credentials used in the Kubernetes cluster. |
| <a name="output_rabbitmq_endpoints"></a> [rabbitmq\_endpoints](#output\_rabbitmq\_endpoints) | Rabbitmq endpoints in the Kubernetes cluster. |
<!-- END_TF_DOCS -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_azure"></a> [azure](#module\_azure) | squareops/rabbitmq/kubernetes//modules/resources/azure | n/a |
| <a name="module_rabbitmq"></a> [rabbitmq](#module\_rabbitmq) | squareops/rabbitmq/kubernetes | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_kubernetes_cluster.primary](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/kubernetes_cluster) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_rabbitmq_credential"></a> [rabbitmq\_credential](#output\_rabbitmq\_credential) | Rabbitmq credentials used in the Kubernetes cluster. |
| <a name="output_rabbitmq_endpoints"></a> [rabbitmq\_endpoints](#output\_rabbitmq\_endpoints) | Rabbitmq endpoints in the Kubernetes cluster. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
