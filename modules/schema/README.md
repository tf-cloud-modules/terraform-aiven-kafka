# Aiven Kafka Schema Terraform module

Terraform module which creates Aiven Kafka Schema resources

## Usage

```hcl
module "schema" {
  source              = "tf-cloud-modules/kakfa/aiven//modules/schema"
  project             = "test"
  service_name        = "test"
  subject_name        = "kafka-schema1"
  compatibility_level = "FORWARD"

  schema = <<EOT
    {
       "doc": "example",
       "fields": [{
           "default": 5,
           "doc": "my test number",
           "name": "test",
           "namespace": "test",
           "type": "int"
       }],
       "name": "example",
       "namespace": "example",
       "type": "record"
    }
    EOT
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_aiven"></a> [aiven](#requirement\_aiven) | >= 3.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aiven"></a> [aiven](#provider\_aiven) | >= 3.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aiven_kafka_schema.this](https://registry.terraform.io/providers/aiven/aiven/latest/docs/resources/kafka_schema) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_compatibility_level"></a> [compatibility\_level](#input\_compatibility\_level) | Kafka Schemas compatibility level. | `string` | `""` | no |
| <a name="input_create"></a> [create](#input\_create) | Controls if resources should be created. | `bool` | `true` | no |
| <a name="input_project"></a> [project](#input\_project) | Aiven Cloud Project Name. | `string` | n/a | yes |
| <a name="input_schema"></a> [schema](#input\_schema) | Kafka Schema configuration should be a valid Avro Schema JSON format. | `string` | n/a | yes |
| <a name="input_schema_type"></a> [schema\_type](#input\_schema\_type) | Kafka Schema type JSON or AVRO | `string` | `"AVRO"` | no |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | Specifies the actual name of the service. | `string` | n/a | yes |
| <a name="input_subject_name"></a> [subject\_name](#input\_subject\_name) | The Kafka Schema Subject name. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of this resource. |
| <a name="output_project"></a> [project](#output\_project) | Aiven Cloud Project Name. |
| <a name="output_service_name"></a> [service\_name](#output\_service\_name) | Specifies the actual name of the service. |
<!-- END_TF_DOCS -->