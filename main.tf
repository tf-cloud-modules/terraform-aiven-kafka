resource "aiven_kafka" "this" {
  count                   = var.create ? 1 : 0
  cloud_name              = var.cloud_name
  default_acl             = var.default_acl
  karapace                = var.karapace
  maintenance_window_dow  = var.maintenance_window_dow
  maintenance_window_time = var.maintenance_window_time
  plan                    = var.plan
  project                 = var.project
  project_vpc_id          = var.project_vpc_id
  static_ips              = var.static_ips
  service_name            = var.service_name
  termination_protection  = var.termination_protection

  kafka_user_config {
    custom_domain   = var.custom_domain
    ip_filter       = var.ip_filter
    kafka_connect   = var.kafka_connect
    kafka_rest      = var.kafka_rest
    kafka_version   = var.kafka_version
    schema_registry = var.schema_registry

    public_access {
      kafka           = var.public_access_kafka
      kafka_connect   = var.public_access_kafka_connect
      kafka_rest      = var.public_access_kafka_rest
      prometheus      = var.public_access_prometheus
      schema_registry = var.public_access_schema_registry
    }

    private_access {
      prometheus = var.private_access_prometheus
    }

    privatelink_access {
      jolokia         = var.privatelink_jolokia
      kafka           = var.privatelink_kafka
      kafka_connect   = var.privatelink_kafka_connect
      kafka_rest      = var.privatelink_kafka_rest
      prometheus      = var.privatelink_prometheus
      schema_registry = var.privatelink_schema_registry
    }

    kafka {
      auto_create_topics_enable                                  = var.auto_create_topics_enable
      compression_type                                           = var.compression_type
      connections_max_idle_ms                                    = var.connections_max_idle_ms
      default_replication_factor                                 = var.default_replication_factor
      group_initial_rebalance_delay_ms                           = var.group_initial_rebalance_delay_ms
      group_max_session_timeout_ms                               = var.group_max_session_timeout_ms
      group_min_session_timeout_ms                               = var.group_min_session_timeout_ms
      log_cleaner_delete_retention_ms                            = var.log_cleaner_delete_retention_ms
      log_cleaner_max_compaction_lag_ms                          = var.log_cleaner_max_compaction_lag_ms
      log_cleaner_min_cleanable_ratio                            = var.log_cleaner_min_cleanable_ratio
      log_cleaner_min_compaction_lag_ms                          = var.log_cleaner_min_compaction_lag_ms
      log_cleanup_policy                                         = var.log_cleanup_policy
      log_flush_interval_messages                                = var.log_flush_interval_messages
      log_flush_interval_ms                                      = var.log_flush_interval_ms
      log_index_interval_bytes                                   = var.log_index_interval_bytes
      log_index_size_max_bytes                                   = var.log_index_size_max_bytes
      log_message_downconversion_enable                          = var.log_message_downconversion_enable
      log_message_timestamp_difference_max_ms                    = var.log_message_timestamp_difference_max_ms
      log_message_timestamp_type                                 = var.log_message_timestamp_type
      log_preallocate                                            = var.log_preallocate
      log_retention_bytes                                        = var.log_retention_bytes
      log_retention_hours                                        = var.log_retention_hours
      log_retention_ms                                           = var.log_retention_ms
      log_roll_jitter_ms                                         = var.log_roll_jitter_ms
      log_roll_ms                                                = var.log_roll_ms
      log_segment_bytes                                          = var.log_segment_bytes
      log_segment_delete_delay_ms                                = var.log_segment_delete_delay_ms
      max_connections_per_ip                                     = var.max_connections_per_ip
      max_incremental_fetch_session_cache_slots                  = var.max_incremental_fetch_session_cache_slots
      message_max_bytes                                          = var.message_max_bytes
      min_insync_replicas                                        = var.min_insync_replicas
      num_partitions                                             = var.num_partitions
      offsets_retention_minutes                                  = var.offsets_retention_minutes
      producer_purgatory_purge_interval_requests                 = var.producer_purgatory_purge_interval_requests
      replica_fetch_max_bytes                                    = var.replica_fetch_max_bytes
      replica_fetch_response_max_bytes                           = var.replica_fetch_response_max_bytes
      socket_request_max_bytes                                   = var.socket_request_max_bytes
      transaction_remove_expired_transaction_cleanup_interval_ms = var.transaction_remove_expired_transaction_cleanup_interval_ms
      transaction_state_log_segment_bytes                        = var.transaction_state_log_segment_bytes
    }

    kafka_authentication_methods {
      certificate = var.kafka_authentication_methods_certificate
      sasl        = var.kafka_authentication_methods_sasl
    }

    dynamic "kafka_connect_config" {
      for_each = var.kafka_connect_config
      content {
        connector_client_config_override_policy = lookup(kafka_connect_config.value, "connector_client_config_override_policy", null)
        consumer_auto_offset_reset              = lookup(kafka_connect_config.value, "consumer_auto_offset_reset", null)
        consumer_fetch_max_bytes                = lookup(kafka_connect_config.value, "consumer_fetch_max_bytes", null)
        consumer_isolation_level                = lookup(kafka_connect_config.value, "consumer_isolation_level", null)
        consumer_max_partition_fetch_bytes      = lookup(kafka_connect_config.value, "consumer_max_partition_fetch_bytes", null)
        consumer_max_poll_interval_ms           = lookup(kafka_connect_config.value, "consumer_max_poll_interval_ms", null)
        consumer_max_poll_records               = lookup(kafka_connect_config.value, "consumer_max_poll_records", null)
        offset_flush_interval_ms                = lookup(kafka_connect_config.value, "offset_flush_interval_ms", null)
        offset_flush_timeout_ms                 = lookup(kafka_connect_config.value, "offset_flush_timeout_ms", null)
        producer_compression_type               = lookup(kafka_connect_config.value, "producer_compression_type", null)
        producer_max_request_size               = lookup(kafka_connect_config.value, "producer_max_request_size", null)
        session_timeout_ms                      = lookup(kafka_connect_config.value, "session_timeout_ms", null)
      }
    }

    dynamic "kafka_rest_config" {
      for_each = var.kafka_rest_config
      content {
        consumer_enable_auto_commit  = lookup(kafka_rest_config.value, "consumer_enable_auto_commit", null)
        consumer_request_max_bytes   = lookup(kafka_rest_config.value, "consumer_request_max_bytes", null)
        consumer_request_timeout_ms  = lookup(kafka_rest_config.value, "consumer_request_timeout_ms", null)
        producer_acks                = lookup(kafka_rest_config.value, "producer_acks", null)
        producer_linger_ms           = lookup(kafka_rest_config.value, "producer_linger_ms", null)
        simpleconsumer_pool_size_max = lookup(kafka_rest_config.value, "simpleconsumer_pool_size_max", null)
      }
    }

    dynamic "schema_registry_config" {
      for_each = var.schema_registry_config
      content {
        leader_eligibility = lookup(schema_registry_config.value, "leader_eligibility", null)
        topic_name         = lookup(schema_registry_config.value, "topic_name", null)
      }
    }
  }

  dynamic "service_integrations" {
    for_each = var.service_integrations
    content {
      integration_type    = lookup(service_integrations.value, "integration_type", null)
      source_service_name = lookup(service_integrations.value, "source_service_name", null)
    }
  }

  dynamic "tag" {
    for_each = var.tags
    content {
      key   = lookup(tag.value, "key", null)
      value = lookup(tag.value, "value", null)
    }
  }
}