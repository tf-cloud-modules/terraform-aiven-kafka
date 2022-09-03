# Aiven Kafka Topic Terraform module

Terraform module which creates Aiven Kafka Topic resources

## Usage

```hcl
module "topic" {
  source        = "tf-cloud-modules/kakfa/aiven//modules/topic"
  project       = "test"
  service_name  = "test"
  topic_name    = "test"
  partitions    = 5
  replication   = 3
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
| [aiven_kafka_topic.this](https://registry.terraform.io/providers/aiven/aiven/latest/docs/resources/kafka_topic) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cleanup_policy"></a> [cleanup\_policy](#input\_cleanup\_policy) | cleanup.policy value. | `string` | `""` | no |
| <a name="input_compression_type"></a> [compression\_type](#input\_compression\_type) | compression.type value. | `string` | `""` | no |
| <a name="input_create"></a> [create](#input\_create) | Controls if resources should be created. | `bool` | `true` | no |
| <a name="input_delete_retention_ms"></a> [delete\_retention\_ms](#input\_delete\_retention\_ms) | delete.retention.ms value. | `string` | `""` | no |
| <a name="input_file_delete_delay_ms"></a> [file\_delete\_delay\_ms](#input\_file\_delete\_delay\_ms) | file.delete.delay.ms value. | `string` | `""` | no |
| <a name="input_flush_messages"></a> [flush\_messages](#input\_flush\_messages) | flush.messages value. | `string` | `""` | no |
| <a name="input_flush_ms"></a> [flush\_ms](#input\_flush\_ms) | flush.ms value. | `string` | `""` | no |
| <a name="input_index_interval_bytes"></a> [index\_interval\_bytes](#input\_index\_interval\_bytes) | index.interval.bytes value. | `string` | `""` | no |
| <a name="input_max_compaction_lag_ms"></a> [max\_compaction\_lag\_ms](#input\_max\_compaction\_lag\_ms) | max.compaction.lag.ms value. | `string` | `""` | no |
| <a name="input_max_message_bytes"></a> [max\_message\_bytes](#input\_max\_message\_bytes) | max.message.bytes value. | `string` | `""` | no |
| <a name="input_message_downconversion_enable"></a> [message\_downconversion\_enable](#input\_message\_downconversion\_enable) | message.downconversion.enable value. | `string` | `""` | no |
| <a name="input_message_format_version"></a> [message\_format\_version](#input\_message\_format\_version) | message.format.version value. | `string` | `""` | no |
| <a name="input_message_timestamp_difference_max_ms"></a> [message\_timestamp\_difference\_max\_ms](#input\_message\_timestamp\_difference\_max\_ms) | message.timestamp.difference.max.ms value. | `string` | `""` | no |
| <a name="input_message_timestamp_type"></a> [message\_timestamp\_type](#input\_message\_timestamp\_type) | message.timestamp.type value. | `string` | `""` | no |
| <a name="input_min_cleanable_dirty_ratio"></a> [min\_cleanable\_dirty\_ratio](#input\_min\_cleanable\_dirty\_ratio) | min.cleanable.dirty.ratio value. | `string` | `""` | no |
| <a name="input_min_compaction_lag_ms"></a> [min\_compaction\_lag\_ms](#input\_min\_compaction\_lag\_ms) | min.compaction.lag.ms value. | `string` | `""` | no |
| <a name="input_min_insync_replicas"></a> [min\_insync\_replicas](#input\_min\_insync\_replicas) | min.insync.replicas value. | `string` | `""` | no |
| <a name="input_partitions"></a> [partitions](#input\_partitions) | The number of partitions to create in the topic. | `string` | n/a | yes |
| <a name="input_preallocate"></a> [preallocate](#input\_preallocate) | preallocate value. | `string` | `""` | no |
| <a name="input_project"></a> [project](#input\_project) | Aiven Cloud Project Name. | `string` | n/a | yes |
| <a name="input_replication"></a> [replication](#input\_replication) | The replication factor for the topic. | `string` | n/a | yes |
| <a name="input_retention_bytes"></a> [retention\_bytes](#input\_retention\_bytes) | retention.bytes value. | `string` | `""` | no |
| <a name="input_retention_ms"></a> [retention\_ms](#input\_retention\_ms) | retention.ms value. | `string` | `""` | no |
| <a name="input_segment_bytes"></a> [segment\_bytes](#input\_segment\_bytes) | segment.bytes value. | `string` | `""` | no |
| <a name="input_segment_index_bytes"></a> [segment\_index\_bytes](#input\_segment\_index\_bytes) | segment.index.bytes value. | `string` | `""` | no |
| <a name="input_segment_jitter_ms"></a> [segment\_jitter\_ms](#input\_segment\_jitter\_ms) | segment.jitter.ms value. | `string` | `""` | no |
| <a name="input_segment_ms"></a> [segment\_ms](#input\_segment\_ms) | segment.ms value. | `string` | `""` | no |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | Specifies the actual name of the service. | `string` | n/a | yes |
| <a name="input_termination_protection"></a> [termination\_protection](#input\_termination\_protection) | Prevents the service from being deleted. | `bool` | `false` | no |
| <a name="input_topic_name"></a> [topic\_name](#input\_topic\_name) | The name of the topic. | `string` | n/a | yes |
| <a name="input_unclean_leader_election_enable"></a> [unclean\_leader\_election\_enable](#input\_unclean\_leader\_election\_enable) | unclean.leader.election.enable value. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of this resource. |
| <a name="output_project"></a> [project](#output\_project) | Aiven Cloud Project Name. |
| <a name="output_service_name"></a> [service\_name](#output\_service\_name) | Specifies the actual name of the service. |
<!-- END_TF_DOCS -->