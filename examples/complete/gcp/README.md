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
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_gcp"></a> [gcp](#module\_gcp) | squareops/rabbitmq/kubernetes//modules/resources/gcp | n/a |
| <a name="module_rabbitmq"></a> [rabbitmq](#module\_rabbitmq) | squareops/rabbitmq/kubernetes | n/a |

## Resources

| Name | Type |
|------|------|
| [google_client_config.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/client_config) | data source |
| [google_container_cluster.primary](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/container_cluster) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_rabbitmq_credential"></a> [rabbitmq\_credential](#output\_rabbitmq\_credential) | Rabbitmq credentials used in the Kubernetes cluster. |
| <a name="output_rabbitmq_endpoints"></a> [rabbitmq\_endpoints](#output\_rabbitmq\_endpoints) | Rabbitmq endpoints in the Kubernetes cluster. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
