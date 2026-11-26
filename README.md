**English** | [Русский](README.ru.md)

# Aiven Kafka Terraform module

Terraform module which creates Aiven Kafka resources

## Usage

```hcl
module "kafka" {
  source       = "tf-cloud-modules/kafka/aiven"
  project      = "test"
  service_name = "test"
}
```

## Kafka version and upgrades

New services default to Kafka `4.2` on Aiven's Developer tier (`developer-2-1d`) in `do-fra`. Aiven's published Developer-tier version matrix lists `3.9`, `4.1`, and `4.2`; Kafka `4.3` is not listed for this tier. The Developer tier is a paid, limited-capacity tier; Aiven lists it from $35 USD/month for one-day retention, with price varying by region and retention. Review the current Aiven estimate before applying. The Developer tier has a replication factor of 1; the complete example uses that limit.

Kafka Connect is not enabled by default or in the complete example: Aiven rejects `kafka_connect=true` for the Developer plan. Aiven offers Kafka Connect as a separately billed service; the `connector` submodule requires a compatible Kafka Connect service to be provisioned separately and is not part of the complete example.

Maintenance windows are unset by default and always omitted by the module for `developer-*` plans, even if the inputs are set: Aiven rejects these fields for Developer tier. The broker options `log.message.downconversion.enable`, `log.preallocate`, and `transaction.partition.verification.enable` are likewise omitted on Developer plans. These settings can be configured only for a plan that supports them.

These defaults also affect existing services that do not set `kafka_version`, `plan`, or `cloud_name` explicitly. Review the Terraform plan carefully: changing plan or cloud can change service capacity, incur charges, and trigger a service migration. Set all three inputs to the current service values before upgrading the module if you want to defer these changes. Aiven plan and region availability can vary by project; select values available to your project.

Kafka 4.x uses KRaft. Aiven does not support upgrading a ZooKeeper service on Kafka 3.8 or earlier directly to Kafka 4.x. Upgrade to 3.9 and complete the KRaft migration first; rollback to ZooKeeper is not possible after migration. This module update does not run an upgrade or migration.

Before using Kafka 4.x, remove any configured `log.message.timestamp.difference.max.ms` and use `log.message.timestamp.before.max.ms` / `log.message.timestamp.after.max.ms` instead. The deprecated topic `message.format.version` setting is ignored on Kafka 4.x. `group.coordinator.rebalance.protocols` is deprecated in Kafka 4.3.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_aiven"></a> [aiven](#requirement\_aiven) | = 4.66.0 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_aiven"></a> [aiven](#provider\_aiven) | 4.66.0 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [aiven_kafka.this](https://registry.terraform.io/providers/aiven/aiven/4.66.0/docs/resources/kafka) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_auto_create_topics_enable"></a> [auto\_create\_topics\_enable](#input\_auto\_create\_topics\_enable) | auto.create.topics.enable | `bool` | `false` | no |
| <a name="input_cloud_name"></a> [cloud\_name](#input\_cloud\_name) | Cloud and region where the service is hosted. The default do-fra region is used with the Aiven Kafka Developer tier; set a region available to your project if needed. | `string` | `"do-fra"` | no |
| <a name="input_cmk_id"></a> [cmk\_id](#input\_cmk\_id) | Customer Managed Key ID to associate with the service for encryption at rest. | `string` | `null` | no |
| <a name="input_compression_type"></a> [compression\_type](#input\_compression\_type) | compression.type. When unset, Aiven uses its default. | `string` | `null` | no |
| <a name="input_connections_max_idle_ms"></a> [connections\_max\_idle\_ms](#input\_connections\_max\_idle\_ms) | connections.max.idle.ms | `number` | `null` | no |
| <a name="input_create"></a> [create](#input\_create) | Controls if resources should be created. | `bool` | `true` | no |
| <a name="input_custom_domain"></a> [custom\_domain](#input\_custom\_domain) | Optional custom domain. When unset, Aiven uses its default domain. | `string` | `null` | no |
| <a name="input_default_acl"></a> [default\_acl](#input\_default\_acl) | Create default wildcard Kafka ACL. | `bool` | `false` | no |
| <a name="input_default_replication_factor"></a> [default\_replication\_factor](#input\_default\_replication\_factor) | default.replication.factor | `number` | `null` | no |
| <a name="input_group_consumer_heartbeat_interval_ms"></a> [group\_consumer\_heartbeat\_interval\_ms](#input\_group\_consumer\_heartbeat\_interval\_ms) | group.consumer.heartbeat.interval.ms | `number` | `null` | no |
| <a name="input_group_consumer_max_heartbeat_interval_ms"></a> [group\_consumer\_max\_heartbeat\_interval\_ms](#input\_group\_consumer\_max\_heartbeat\_interval\_ms) | group.consumer.max.heartbeat.interval.ms | `number` | `null` | no |
| <a name="input_group_consumer_max_session_timeout_ms"></a> [group\_consumer\_max\_session\_timeout\_ms](#input\_group\_consumer\_max\_session\_timeout\_ms) | group.consumer.max.session.timeout.ms | `number` | `null` | no |
| <a name="input_group_consumer_min_heartbeat_interval_ms"></a> [group\_consumer\_min\_heartbeat\_interval\_ms](#input\_group\_consumer\_min\_heartbeat\_interval\_ms) | group.consumer.min.heartbeat.interval.ms | `number` | `null` | no |
| <a name="input_group_consumer_min_session_timeout_ms"></a> [group\_consumer\_min\_session\_timeout\_ms](#input\_group\_consumer\_min\_session\_timeout\_ms) | group.consumer.min.session.timeout.ms | `number` | `null` | no |
| <a name="input_group_consumer_session_timeout_ms"></a> [group\_consumer\_session\_timeout\_ms](#input\_group\_consumer\_session\_timeout\_ms) | group.consumer.session.timeout.ms | `number` | `null` | no |
| <a name="input_group_coordinator_rebalance_protocols"></a> [group\_coordinator\_rebalance\_protocols](#input\_group\_coordinator\_rebalance\_protocols) | group.coordinator.rebalance.protocols. Deprecated in Kafka 4.3; avoid setting it for new services. | `string` | `null` | no |
| <a name="input_group_initial_rebalance_delay_ms"></a> [group\_initial\_rebalance\_delay\_ms](#input\_group\_initial\_rebalance\_delay\_ms) | group.initial.rebalance.delay.ms | `number` | `null` | no |
| <a name="input_group_max_session_timeout_ms"></a> [group\_max\_session\_timeout\_ms](#input\_group\_max\_session\_timeout\_ms) | group.max.session.timeout.ms | `number` | `null` | no |
| <a name="input_group_min_session_timeout_ms"></a> [group\_min\_session\_timeout\_ms](#input\_group\_min\_session\_timeout\_ms) | group.min.session.timeout.ms | `number` | `null` | no |
| <a name="input_ip_filter_object"></a> [ip\_filter\_object](#input\_ip\_filter\_object) | Allow incoming connections from CIDR address block, e.g. '10.20.0.0/16'. | `list(any)` | <pre>[<br/>  {<br/>    "network": "0.0.0.0/0"<br/>  }<br/>]</pre> | no |
| <a name="input_kafka_authentication_methods_certificate"></a> [kafka\_authentication\_methods\_certificate](#input\_kafka\_authentication\_methods\_certificate) | Enable certificate/SSL authentication. | `bool` | `true` | no |
| <a name="input_kafka_authentication_methods_sasl"></a> [kafka\_authentication\_methods\_sasl](#input\_kafka\_authentication\_methods\_sasl) | Enable SASL authentication. | `bool` | `false` | no |
| <a name="input_kafka_connect"></a> [kafka\_connect](#input\_kafka\_connect) | Enable Kafka Connect where supported. Aiven rejects this setting on the Developer plan. | `bool` | `false` | no |
| <a name="input_kafka_connect_config"></a> [kafka\_connect\_config](#input\_kafka\_connect\_config) | Kafka Connect configuration values. | `list(any)` | `[]` | no |
| <a name="input_kafka_rest"></a> [kafka\_rest](#input\_kafka\_rest) | Enable Kafka-REST service. | `bool` | `false` | no |
| <a name="input_kafka_rest_config"></a> [kafka\_rest\_config](#input\_kafka\_rest\_config) | Kafka REST configuration. | `list(any)` | `[]` | no |
| <a name="input_kafka_version"></a> [kafka\_version](#input\_kafka\_version) | Kafka major version. Defaults to 4.2, the latest version in Aiven's published Developer-tier matrix. Version 4.3 is not listed as supported for Developer plans. Set the existing service version explicitly before upgrading this module to avoid an unintended version change. | `string` | `"4.2"` | no |
| <a name="input_karapace"></a> [karapace](#input\_karapace) | Switch the service to use Karapace for schema registry and REST proxy. | `bool` | `false` | no |
| <a name="input_log_cleaner_delete_retention_ms"></a> [log\_cleaner\_delete\_retention\_ms](#input\_log\_cleaner\_delete\_retention\_ms) | log.cleaner.delete.retention.ms | `number` | `null` | no |
| <a name="input_log_cleaner_max_compaction_lag_ms"></a> [log\_cleaner\_max\_compaction\_lag\_ms](#input\_log\_cleaner\_max\_compaction\_lag\_ms) | log.cleaner.max.compaction.lag.ms | `number` | `null` | no |
| <a name="input_log_cleaner_min_cleanable_ratio"></a> [log\_cleaner\_min\_cleanable\_ratio](#input\_log\_cleaner\_min\_cleanable\_ratio) | log.cleaner.min.cleanable.ratio | `number` | `null` | no |
| <a name="input_log_cleaner_min_compaction_lag_ms"></a> [log\_cleaner\_min\_compaction\_lag\_ms](#input\_log\_cleaner\_min\_compaction\_lag\_ms) | log.cleaner.min.compaction.lag.ms | `number` | `null` | no |
| <a name="input_log_cleanup_policy"></a> [log\_cleanup\_policy](#input\_log\_cleanup\_policy) | log.cleanup.policy. When unset, Aiven uses its default. | `string` | `null` | no |
| <a name="input_log_flush_interval_messages"></a> [log\_flush\_interval\_messages](#input\_log\_flush\_interval\_messages) | log.flush.interval.messages | `number` | `null` | no |
| <a name="input_log_flush_interval_ms"></a> [log\_flush\_interval\_ms](#input\_log\_flush\_interval\_ms) | log.flush.interval.ms | `number` | `null` | no |
| <a name="input_log_index_interval_bytes"></a> [log\_index\_interval\_bytes](#input\_log\_index\_interval\_bytes) | log.index.interval.bytes | `number` | `null` | no |
| <a name="input_log_index_size_max_bytes"></a> [log\_index\_size\_max\_bytes](#input\_log\_index\_size\_max\_bytes) | log.index.size.max.bytes | `number` | `null` | no |
| <a name="input_log_local_retention_bytes"></a> [log\_local\_retention\_bytes](#input\_log\_local\_retention\_bytes) | log.local.retention.bytes | `number` | `null` | no |
| <a name="input_log_local_retention_ms"></a> [log\_local\_retention\_ms](#input\_log\_local\_retention\_ms) | log.local.retention.ms | `number` | `null` | no |
| <a name="input_log_message_downconversion_enable"></a> [log\_message\_downconversion\_enable](#input\_log\_message\_downconversion\_enable) | log.message.downconversion.enable. Omitted for Aiven Kafka Developer plans, which do not support this setting. | `bool` | `null` | no |
| <a name="input_log_message_timestamp_after_max_ms"></a> [log\_message\_timestamp\_after\_max\_ms](#input\_log\_message\_timestamp\_after\_max\_ms) | log.message.timestamp.after.max.ms | `number` | `null` | no |
| <a name="input_log_message_timestamp_before_max_ms"></a> [log\_message\_timestamp\_before\_max\_ms](#input\_log\_message\_timestamp\_before\_max\_ms) | log.message.timestamp.before.max.ms | `number` | `null` | no |
| <a name="input_log_message_timestamp_difference_max_ms"></a> [log\_message\_timestamp\_difference\_max\_ms](#input\_log\_message\_timestamp\_difference\_max\_ms) | log.message.timestamp.difference.max.ms. Removed in Kafka 4.0; use log\_message\_timestamp\_before\_max\_ms and log\_message\_timestamp\_after\_max\_ms instead. | `number` | `null` | no |
| <a name="input_log_message_timestamp_type"></a> [log\_message\_timestamp\_type](#input\_log\_message\_timestamp\_type) | log.message.timestamp.type. When unset, Aiven uses its default. | `string` | `null` | no |
| <a name="input_log_preallocate"></a> [log\_preallocate](#input\_log\_preallocate) | log.preallocate. Omitted for Aiven Kafka Developer plans, which do not support this setting. | `bool` | `null` | no |
| <a name="input_log_retention_bytes"></a> [log\_retention\_bytes](#input\_log\_retention\_bytes) | log.retention.bytes | `number` | `null` | no |
| <a name="input_log_retention_hours"></a> [log\_retention\_hours](#input\_log\_retention\_hours) | log.retention.hours | `number` | `null` | no |
| <a name="input_log_retention_ms"></a> [log\_retention\_ms](#input\_log\_retention\_ms) | log.retention.ms | `number` | `null` | no |
| <a name="input_log_roll_jitter_ms"></a> [log\_roll\_jitter\_ms](#input\_log\_roll\_jitter\_ms) | log.roll.jitter.ms | `number` | `null` | no |
| <a name="input_log_roll_ms"></a> [log\_roll\_ms](#input\_log\_roll\_ms) | log.roll.ms | `number` | `null` | no |
| <a name="input_log_segment_bytes"></a> [log\_segment\_bytes](#input\_log\_segment\_bytes) | log.segment.bytes | `number` | `null` | no |
| <a name="input_log_segment_delete_delay_ms"></a> [log\_segment\_delete\_delay\_ms](#input\_log\_segment\_delete\_delay\_ms) | log.segment.delete.delay.ms | `number` | `null` | no |
| <a name="input_maintenance_window_dow"></a> [maintenance\_window\_dow](#input\_maintenance\_window\_dow) | Optional day of week for maintenance operations. Omitted for Aiven Kafka Developer plans, which do not support maintenance windows. One monday, tuesday, wednesday, etc. | `string` | `null` | no |
| <a name="input_maintenance_window_time"></a> [maintenance\_window\_time](#input\_maintenance\_window\_time) | Optional UTC time for maintenance operations in HH:mm:ss format. Omitted for Aiven Kafka Developer plans, which do not support maintenance windows. | `string` | `null` | no |
| <a name="input_max_connections_per_ip"></a> [max\_connections\_per\_ip](#input\_max\_connections\_per\_ip) | max.connections.per.ip | `number` | `null` | no |
| <a name="input_max_incremental_fetch_session_cache_slots"></a> [max\_incremental\_fetch\_session\_cache\_slots](#input\_max\_incremental\_fetch\_session\_cache\_slots) | max.incremental.fetch.session.cache.slots | `number` | `null` | no |
| <a name="input_message_max_bytes"></a> [message\_max\_bytes](#input\_message\_max\_bytes) | message.max.bytes | `number` | `null` | no |
| <a name="input_min_insync_replicas"></a> [min\_insync\_replicas](#input\_min\_insync\_replicas) | min.insync.replicas | `number` | `null` | no |
| <a name="input_num_partitions"></a> [num\_partitions](#input\_num\_partitions) | num.partitions | `number` | `null` | no |
| <a name="input_offsets_retention_minutes"></a> [offsets\_retention\_minutes](#input\_offsets\_retention\_minutes) | offsets.retention.minutes | `number` | `null` | no |
| <a name="input_plan"></a> [plan](#input\_plan) | Aiven Kafka service plan. The default developer-2-1d plan is the Developer tier with one-day retention; pricing varies by cloud and region and starts at $35 USD/month. Kafka Connect is billed separately. | `string` | `"developer-2-1d"` | no |
| <a name="input_private_access_prometheus"></a> [private\_access\_prometheus](#input\_private\_access\_prometheus) | Allow clients to connect to prometheus with a DNS name that always resolves to the service's private IP addresses. | `bool` | `false` | no |
| <a name="input_privatelink_jolokia"></a> [privatelink\_jolokia](#input\_privatelink\_jolokia) | Enable jolokia. | `bool` | `false` | no |
| <a name="input_privatelink_kafka"></a> [privatelink\_kafka](#input\_privatelink\_kafka) | Enable kafka. | `bool` | `false` | no |
| <a name="input_privatelink_kafka_connect"></a> [privatelink\_kafka\_connect](#input\_privatelink\_kafka\_connect) | Enable kafka\_connect. | `bool` | `false` | no |
| <a name="input_privatelink_kafka_rest"></a> [privatelink\_kafka\_rest](#input\_privatelink\_kafka\_rest) | Enable kafka\_rest. | `bool` | `false` | no |
| <a name="input_privatelink_prometheus"></a> [privatelink\_prometheus](#input\_privatelink\_prometheus) | Enable prometheus. | `bool` | `false` | no |
| <a name="input_privatelink_schema_registry"></a> [privatelink\_schema\_registry](#input\_privatelink\_schema\_registry) | Enable schema\_registry. | `bool` | `false` | no |
| <a name="input_producer_purgatory_purge_interval_requests"></a> [producer\_purgatory\_purge\_interval\_requests](#input\_producer\_purgatory\_purge\_interval\_requests) | producer.purgatory.purge.interval.requests | `number` | `null` | no |
| <a name="input_project"></a> [project](#input\_project) | Aiven Cloud Project Name | `string` | n/a | yes |
| <a name="input_project_vpc_id"></a> [project\_vpc\_id](#input\_project\_vpc\_id) | Specifies the VPC the service should run in. If the value is not set the service is not run inside a VPC. | `string` | `null` | no |
| <a name="input_public_access_kafka"></a> [public\_access\_kafka](#input\_public\_access\_kafka) | Allow clients to connect to kafka from the public internet for service nodes that are in a project VPC or another type of private network. | `bool` | `false` | no |
| <a name="input_public_access_kafka_connect"></a> [public\_access\_kafka\_connect](#input\_public\_access\_kafka\_connect) | Allow clients to connect to kafka\_connect from the public internet for service nodes that are in a project VPC or another type of private network. | `bool` | `false` | no |
| <a name="input_public_access_kafka_rest"></a> [public\_access\_kafka\_rest](#input\_public\_access\_kafka\_rest) | Allow clients to connect to kafka\_rest from the public internet for service nodes that are in a project VPC or another type of private network. | `bool` | `false` | no |
| <a name="input_public_access_prometheus"></a> [public\_access\_prometheus](#input\_public\_access\_prometheus) | Allow clients to connect to prometheus from the public internet for service nodes that are in a project VPC or another type of private network. | `bool` | `false` | no |
| <a name="input_public_access_schema_registry"></a> [public\_access\_schema\_registry](#input\_public\_access\_schema\_registry) | Allow clients to connect to schema\_registry from the public internet for service nodes that are in a project VPC or another type of private network. | `bool` | `false` | no |
| <a name="input_replica_fetch_max_bytes"></a> [replica\_fetch\_max\_bytes](#input\_replica\_fetch\_max\_bytes) | replica.fetch.max.bytes | `number` | `null` | no |
| <a name="input_replica_fetch_response_max_bytes"></a> [replica\_fetch\_response\_max\_bytes](#input\_replica\_fetch\_response\_max\_bytes) | replica.fetch.response.max.bytes | `number` | `null` | no |
| <a name="input_sasl_oauthbearer_expected_audience"></a> [sasl\_oauthbearer\_expected\_audience](#input\_sasl\_oauthbearer\_expected\_audience) | sasl.oauthbearer.expected.audience. When unset, Aiven uses its default. | `string` | `null` | no |
| <a name="input_sasl_oauthbearer_expected_issuer"></a> [sasl\_oauthbearer\_expected\_issuer](#input\_sasl\_oauthbearer\_expected\_issuer) | sasl.oauthbearer.expected.issuer. When unset, Aiven uses its default. | `string` | `null` | no |
| <a name="input_sasl_oauthbearer_jwks_endpoint_url"></a> [sasl\_oauthbearer\_jwks\_endpoint\_url](#input\_sasl\_oauthbearer\_jwks\_endpoint\_url) | sasl.oauthbearer.jwks.endpoint.url. When unset, Aiven uses its default. | `string` | `null` | no |
| <a name="input_sasl_oauthbearer_sub_claim_name"></a> [sasl\_oauthbearer\_sub\_claim\_name](#input\_sasl\_oauthbearer\_sub\_claim\_name) | sasl.oauthbearer.sub.claim.name. When unset, Aiven uses its default. | `string` | `null` | no |
| <a name="input_schema_registry"></a> [schema\_registry](#input\_schema\_registry) | Enable Schema-Registry service. | `bool` | `false` | no |
| <a name="input_schema_registry_config"></a> [schema\_registry\_config](#input\_schema\_registry\_config) | Schema Registry configuration. | `list(any)` | `[]` | no |
| <a name="input_service_integrations"></a> [service\_integrations](#input\_service\_integrations) | Service integrations to specify when creating a service. | `list(any)` | `[]` | no |
| <a name="input_service_log"></a> [service\_log](#input\_service\_log) | Store logs for the service so that they are available in the HTTP API and console. | `bool` | `null` | no |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | Specifies the actual name of the service. | `string` | n/a | yes |
| <a name="input_socket_request_max_bytes"></a> [socket\_request\_max\_bytes](#input\_socket\_request\_max\_bytes) | socket.request.max.bytes | `number` | `null` | no |
| <a name="input_static_ips"></a> [static\_ips](#input\_static\_ips) | Static IPs that are going to be associated with this service. | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | List of the service tags. | `list(any)` | `[]` | no |
| <a name="input_termination_protection"></a> [termination\_protection](#input\_termination\_protection) | Prevents the service from being deleted. | `bool` | `false` | no |
| <a name="input_transaction_partition_verification_enable"></a> [transaction\_partition\_verification\_enable](#input\_transaction\_partition\_verification\_enable) | transaction.partition.verification.enable. Omitted for Aiven Kafka Developer plans, which do not support this setting. | `bool` | `null` | no |
| <a name="input_transaction_remove_expired_transaction_cleanup_interval_ms"></a> [transaction\_remove\_expired\_transaction\_cleanup\_interval\_ms](#input\_transaction\_remove\_expired\_transaction\_cleanup\_interval\_ms) | transaction.remove.expired.transaction.cleanup.interval.ms | `number` | `null` | no |
| <a name="input_transaction_state_log_segment_bytes"></a> [transaction\_state\_log\_segment\_bytes](#input\_transaction\_state\_log\_segment\_bytes) | transaction.state.log.segment.bytes | `number` | `null` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_cloud_name"></a> [cloud\_name](#output\_cloud\_name) | Defines where the cloud provider and region where the service is hosted in. |
| <a name="output_components"></a> [components](#output\_components) | Service component information objects. |
| <a name="output_disk_space_cap"></a> [disk\_space\_cap](#output\_disk\_space\_cap) | The maximum disk space of the service, possible values depend on the service type, the cloud provider and the project. |
| <a name="output_disk_space_default"></a> [disk\_space\_default](#output\_disk\_space\_default) | The default disk space of the service, possible values depend on the service type, the cloud provider and the project. |
| <a name="output_disk_space_step"></a> [disk\_space\_step](#output\_disk\_space\_step) | The default disk space step of the service, possible values depend on the service type, the cloud provider and the project. |
| <a name="output_id"></a> [id](#output\_id) | The ID of this resource. |
| <a name="output_kafka"></a> [kafka](#output\_kafka) | Kafka server provided values. |
| <a name="output_kafka_user_config"></a> [kafka\_user\_config](#output\_kafka\_user\_config) | Kafka user configurable settings. |
| <a name="output_maintenance_window_dow"></a> [maintenance\_window\_dow](#output\_maintenance\_window\_dow) | Day of week when maintenance operations should be performed. |
| <a name="output_maintenance_window_enabled"></a> [maintenance\_window\_enabled](#output\_maintenance\_window\_enabled) | Indicates whether the maintenance window is currently enabled for this service. |
| <a name="output_maintenance_window_time"></a> [maintenance\_window\_time](#output\_maintenance\_window\_time) | Time of day when maintenance operations should be performed. |
| <a name="output_plan"></a> [plan](#output\_plan) | Defines what kind of computing resources are allocated for the service. |
| <a name="output_project"></a> [project](#output\_project) | Aiven Cloud Project Name. |
| <a name="output_service_host"></a> [service\_host](#output\_service\_host) | The hostname of the service. |
| <a name="output_service_integrations"></a> [service\_integrations](#output\_service\_integrations) | Service integrations to specify when creating a service. |
| <a name="output_service_name"></a> [service\_name](#output\_service\_name) | Specifies the actual name of the service. |
| <a name="output_service_password"></a> [service\_password](#output\_service\_password) | Password used for connecting to the service, if applicable. |
| <a name="output_service_port"></a> [service\_port](#output\_service\_port) | The port of the service. |
| <a name="output_service_type"></a> [service\_type](#output\_service\_type) | Aiven internal service type code. |
| <a name="output_service_uri"></a> [service\_uri](#output\_service\_uri) | URI for connecting to the service. |
| <a name="output_service_username"></a> [service\_username](#output\_service\_username) | Username used for connecting to the service. |
| <a name="output_static_ips"></a> [static\_ips](#output\_static\_ips) | Static IPs that are going to be associated with this service. |
<!-- END_TF_DOCS -->
