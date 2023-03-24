# Aiven Kafka Connector Terraform module

Terraform module which creates Aiven Kafka Connector resources

## Usage

```hcl
module "connector" {
  source        = "tf-cloud-modules/kakfa/aiven//modules/connector"
  project       = "test"
  service_name  = "test"
  connector_name = "test"

  config = {
    "topics" = "test"
    "connector.class" : "io.aiven.kafka.connect.opensearch.OpensearchSinkConnector"
    "type.name"      = "os-connector"
    "name"           = "test"
    "connection.url" = "https://url.com:9243"
    "connection.username" = "user"
    "connection.password" = "password"
  }
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_aiven"></a> [aiven](#requirement\_aiven) | >= 4.0.0, < 5.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aiven"></a> [aiven](#provider\_aiven) | >= 4.0.0, < 5.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aiven_kafka_connector.this](https://registry.terraform.io/providers/aiven/aiven/latest/docs/resources/kafka_connector) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_config"></a> [config](#input\_config) | The Kafka Connector configuration parameters. | `map(string)` | n/a | yes |
| <a name="input_connector_name"></a> [connector\_name](#input\_connector\_name) | The kafka connector name. | `string` | n/a | yes |
| <a name="input_create"></a> [create](#input\_create) | Controls if resources should be created. | `bool` | `true` | no |
| <a name="input_project"></a> [project](#input\_project) | Aiven Cloud Project Name. | `string` | n/a | yes |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | Specifies the actual name of the service. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of this resource. |
| <a name="output_project"></a> [project](#output\_project) | Aiven Cloud Project Name. |
| <a name="output_service_name"></a> [service\_name](#output\_service\_name) | Specifies the actual name of the service. |
<!-- END_TF_DOCS -->