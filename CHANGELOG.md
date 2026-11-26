# Changelog

All notable changes to this module will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Changed
- **Breaking default change:** new services now default to Kafka `4.3` and plan `startup-4`, matching Aiven's current defaults and Kafka 3.9+ plan requirements. Existing configurations that relied on either module default can plan an in-place Kafka version upgrade and/or plan change after updating the module. Set `kafka_version` and `plan` explicitly to the current service values before updating if you want to defer those changes.
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

[Unreleased]: https://github.com/tf-cloud-modules/terraform-aiven-kafka/compare/2.0.0...HEAD
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
