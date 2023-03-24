# Aiven Kafka ACL Terraform module

Terraform module which creates Aiven Kafka ACL resources

## Usage

```hcl
module "acl" {
  source        = "tf-cloud-modules/kakfa/aiven//modules/acl"
  project       = "test"
  service_name  = "test"
  topic         = "test"
  permission    = "admin"
  username      = "test"
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
| [aiven_kafka_acl.this](https://registry.terraform.io/providers/aiven/aiven/latest/docs/resources/kafka_acl) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acl_id"></a> [acl\_id](#input\_acl\_id) | Kafka ACL ID. | `string` | `null` | no |
| <a name="input_create"></a> [create](#input\_create) | Controls if resources should be created. | `bool` | `true` | no |
| <a name="input_permission"></a> [permission](#input\_permission) | Kafka permission to grant. | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | Aiven Cloud Project Name. | `string` | n/a | yes |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | Specifies the actual name of the service. | `string` | n/a | yes |
| <a name="input_topic"></a> [topic](#input\_topic) | Topic name pattern for the ACL entry. | `string` | n/a | yes |
| <a name="input_username"></a> [username](#input\_username) | Username pattern for the ACL entry. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of this resource. |
| <a name="output_project"></a> [project](#output\_project) | Aiven Cloud Project Name. |
| <a name="output_service_name"></a> [service\_name](#output\_service\_name) | Specifies the actual name of the service. |
<!-- END_TF_DOCS -->