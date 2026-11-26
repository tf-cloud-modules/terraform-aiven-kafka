# Complete Aiven Kafka Cluster

Configuration in this directory creates an Aiven Kafka cluster with following features:

- Aiven Kafka Cluster
- Aiven Kafka User
- Aiven Kafka Topic 
- Aiven Kafka ACL
- Aiven Kafka Schema
- Aiven Kafka Schema Configuration
- Aiven Kafka ACL For Schema Registry

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

This example uses the Aiven Kafka Developer plan `developer-2-1d` in `do-fra`. Developer-tier pricing starts at $35 USD/month for one-day retention and varies by region; review the current estimate in Aiven before applying. The example uses replication factor 1, which is the Developer-tier limit. Plan and region availability may vary by project.

Kafka Connect is intentionally not enabled here: Aiven rejects `kafka_connect=true` for this plan. The `connector` submodule can be used with a separately provisioned, compatible Kafka Connect service; that service is not created by this example and may add cost.

Run `terraform destroy` when you don't need these resources.


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_aiven"></a> [aiven](#requirement\_aiven) | = 4.66.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
| ---- | ------ | ------- |
| <a name="module_acl"></a> [acl](#module\_acl) | ../../modules/acl | n/a |
| <a name="module_kafka"></a> [kafka](#module\_kafka) | ../.. | n/a |
| <a name="module_schema"></a> [schema](#module\_schema) | ../../modules/schema | n/a |
| <a name="module_schema_configuration"></a> [schema\_configuration](#module\_schema\_configuration) | ../../modules/schema_configuration | n/a |
| <a name="module_schema_registry_acl"></a> [schema\_registry\_acl](#module\_schema\_registry\_acl) | ../../modules/schema_registry_acl | n/a |
| <a name="module_topic"></a> [topic](#module\_topic) | ../../modules/topic | n/a |
| <a name="module_user"></a> [user](#module\_user) | ../../modules/user | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_project"></a> [project](#input\_project) | Aiven Cloud Project Name. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
