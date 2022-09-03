# Complete Aiven Kafka Cluster

Configuration in this directory creates an Aiven Kafka cluster with following features:

- Aiven Kafka Cluster
- Aiven Kafka User
- Aiven Kafka Topic 
- Aiven Kafka ACL

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which cost money. Run `terraform destroy` when you don't need these resources.


<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_acl"></a> [acl](#module\_acl) | ../../modules/acl | n/a |
| <a name="module_kafka"></a> [kafka](#module\_kafka) | ../.. | n/a |
| <a name="module_topic"></a> [topic](#module\_topic) | ../../modules/topic | n/a |
| <a name="module_user"></a> [user](#module\_user) | ../../modules/user | n/a |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->