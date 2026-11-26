# Changelog

All notable changes to this module will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [3.0.0] - 2026-11-26

### Changed
- **Breaking default change:** new services now default to Kafka `4.2`, Aiven Kafka Developer plan `developer-2-1d`, and cloud `do-fra`. The published Developer-tier version matrix lists `3.9`, `4.1`, and `4.2`; `4.3` is not listed for this tier. The Developer plan starts at $35 USD/month for one-day retention; price varies by cloud and region, and Kafka Connect is billed separately. Existing configurations that rely on module defaults may plan Kafka version, service plan, and/or cloud changes after updating; review the Terraform plan and set `kafka_version`, `plan`, and `cloud_name` explicitly to current service values to defer them. In particular, pin an existing service's current Kafka version to avoid an unintended version change. Plan or cloud changes may incur costs and trigger a migration.
- The complete example no longer enables the unsupported `kafka_connect` setting or creates a connector on the Developer plan. The connector submodule remains available for a separately provisioned, compatible Kafka Connect service.
- Maintenance-window inputs now default to `null` and are omitted from the Aiven request for all `developer-*` plans, even if explicitly set. Developer plans reject any defined maintenance window; these inputs apply only to plans that support them.
- The broker inputs `log_message_downconversion_enable`, `log_preallocate`, and `transaction_partition_verification_enable` now default to `null` and are forced to `null` for all `developer-*` plans, even if explicitly set. Aiven rejects these settings on Developer plans.
- Developer-tier compatibility audit against Aiven's tier-specific configuration matrix and provider 4.66.0: the complete example uses a supported Kafka version, KRaft, and replication factor 1; Kafka Connect stays disabled on the Kafka service; Schema Registry and REST Proxy are documented Developer-tier features; the other defaulted broker options are either listed as supported or unset. The three unsupported broker settings are now omitted for the whole Developer tier.
- Kafka 4.x uses KRaft. Aiven does not support upgrading a ZooKeeper service running Kafka 3.8 or earlier directly to Kafka 4.x: upgrade to 3.9 and complete the KRaft migration first. Rollback to ZooKeeper is not possible after migration. This module change does not perform that migration or apply changes to existing services.
- Kafka 4.0 removes `log.message.timestamp.difference.max.ms`; use `log.message.timestamp.before.max.ms` and `log.message.timestamp.after.max.ms`. Kafka 4.0 also ignores the deprecated topic `message.format.version` setting. Kafka 4.3 deprecates `group.coordinator.rebalance.protocols`.

### Added
- Root module: new variables `cmk_id` (customer managed key) and `service_log`.
- Root module: new `kafka_user_config.kafka` variables `group_consumer_heartbeat_interval_ms`,
  `group_consumer_max_heartbeat_interval_ms`, `group_consumer_max_session_timeout_ms`,
  `group_consumer_min_heartbeat_interval_ms`, `group_consumer_min_session_timeout_ms`,
  `group_consumer_session_timeout_ms`, `group_coordinator_rebalance_protocols`,
  `log_local_retention_bytes`, `log_local_retention_ms`, `log_message_timestamp_after_max_ms`,
  `log_message_timestamp_before_max_ms`, `sasl_oauthbearer_expected_audience`,
  `sasl_oauthbearer_expected_issuer`, `sasl_oauthbearer_jwks_endpoint_url`,
  `sasl_oauthbearer_sub_claim_name` and `transaction_partition_verification_enable`.
- Root module: new optional keys in `kafka_connect_config` (`prefer_ipv6_address_enable`,
  `scheduled_rebalance_max_delay_ms`), `kafka_rest_config` (`consumer_idle_disconnect_timeout`,
  `name_strategy`, `name_strategy_validation`, `producer_max_request_size`) and
  `schema_registry_config` (`retriable_errors_silenced`, `sasl_oauthbearer_authentication_enabled`,
  `sasl_oauthbearer_authorization_enabled`, `sasl_oauthbearer_method_roles`,
  `sasl_oauthbearer_roles_claim_path`, `schema_reader_strict_mode`).
- Root module: new output `maintenance_window_enabled`.
- `topic` submodule: new variables `topic_description`, `owner_user_group_id` and new topic
  config values `diskless_enable`, `local_retention_bytes`, `local_retention_ms`,
  `message_timestamp_after_max_ms`, `message_timestamp_before_max_ms`, `remote_storage_enable`.
- `schema` submodule: new variable `references` for schema references to other registered subjects.
- Add `README.ru.md`.

### Changed
- Pin aiven/aiven to `= 4.66.0` in the root module, all submodules and the complete example.
- Optional Kafka config strings and `custom_domain` now default to `null` rather than empty strings, allowing Aiven to apply provider defaults and preventing invalid empty enum values in plans.
- **Breaking:** remove the `acl_id` variable from the `acl` and `schema_registry_acl`
  submodules. The provider marks `acl_id` as read-only since v4, so setting it fails with
  "Invalid Configuration for Read-Only Attribute".

## [2.0.0] - 2023-03-24

### Changed
- **Breaking:** add aiven/aiven provider v4 support to the submodules.

## [1.1.2] - 2023-03-24

### Changed
- Add aiven/aiven provider v4 support.

## [1.1.0] - 2022-09-20

### Added
- Add `service_integrations`.

## [0.16.0] - 2022-09-04

### Added
- `schema_registry_acl` submodule.

## [0.15.0] - 2022-09-04

### Added
- `schema_configuration` submodule.

## [0.14.0] - 2022-09-04

### Added
- `schema` submodule.

## [0.13.0] - 2022-09-04

### Added
- `connector` submodule.

## [0.12.0] - 2022-09-03

### Added
- `acl` submodule.

## [0.11.0] - 2022-09-03

### Added
- `topic` submodule.

## [0.10.0] - 2022-09-03

### Added
- `user` submodule.

## [0.8.0] - 2022-08-30

### Added
- `schema_registry_config`.

## [0.7.0] - 2022-08-30

### Added
- `kafka_rest_config`.

## [0.6.0] - 2022-08-30

### Added
- `kafka_connect_config`.

## [0.5.0] - 2022-08-30

### Added
- `kafka_authentication_methods`.

## [0.4.0] - 2022-08-30

### Added
- `kafka_user_config.kafka`.

## [0.3.0] - 2022-08-30

### Added
- Access blocks (`public_access`, `private_access`, `privatelink_access`).

## [0.2.0] - 2022-08-30

### Added
- `kafka_user_config`.

## [0.1.0] - 2022-08-29

Initial release.

[Unreleased]: https://github.com/tf-cloud-modules/terraform-aiven-kafka/compare/3.0.0...HEAD
[3.0.0]: https://github.com/tf-cloud-modules/terraform-aiven-kafka/compare/2.0.0...3.0.0
[2.0.0]: https://github.com/tf-cloud-modules/terraform-aiven-kafka/compare/1.1.2...2.0.0
[1.1.2]: https://github.com/tf-cloud-modules/terraform-aiven-kafka/compare/1.1.0...1.1.2
[1.1.0]: https://github.com/tf-cloud-modules/terraform-aiven-kafka/compare/0.16.0...1.1.0
[0.16.0]: https://github.com/tf-cloud-modules/terraform-aiven-kafka/compare/0.15.0...0.16.0
[0.15.0]: https://github.com/tf-cloud-modules/terraform-aiven-kafka/compare/0.14.0...0.15.0
[0.14.0]: https://github.com/tf-cloud-modules/terraform-aiven-kafka/compare/0.13.0...0.14.0
[0.13.0]: https://github.com/tf-cloud-modules/terraform-aiven-kafka/compare/0.12.0...0.13.0
[0.12.0]: https://github.com/tf-cloud-modules/terraform-aiven-kafka/compare/0.11.0...0.12.0
[0.11.0]: https://github.com/tf-cloud-modules/terraform-aiven-kafka/compare/0.10.0...0.11.0
[0.10.0]: https://github.com/tf-cloud-modules/terraform-aiven-kafka/compare/0.8.0...0.10.0
[0.8.0]: https://github.com/tf-cloud-modules/terraform-aiven-kafka/compare/0.7.0...0.8.0
[0.7.0]: https://github.com/tf-cloud-modules/terraform-aiven-kafka/compare/0.6.0...0.7.0
[0.6.0]: https://github.com/tf-cloud-modules/terraform-aiven-kafka/compare/0.5.0...0.6.0
[0.5.0]: https://github.com/tf-cloud-modules/terraform-aiven-kafka/compare/0.4.0...0.5.0
[0.4.0]: https://github.com/tf-cloud-modules/terraform-aiven-kafka/compare/0.3.0...0.4.0
[0.3.0]: https://github.com/tf-cloud-modules/terraform-aiven-kafka/compare/0.2.0...0.3.0
[0.2.0]: https://github.com/tf-cloud-modules/terraform-aiven-kafka/compare/0.1.0...0.2.0
[0.1.0]: https://github.com/tf-cloud-modules/terraform-aiven-kafka/releases/tag/0.1.0
