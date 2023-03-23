resource "aiven_kafka_topic" "this" {
  count                  = var.create ? 1 : 0
  project                = var.project
  service_name           = var.service_name
  partitions             = var.partitions
  replication            = var.replication
  topic_name             = var.topic_name
  termination_protection = var.termination_protection

  config {
    cleanup_policy                      = var.cleanup_policy
    compression_type                    = var.compression_type
    delete_retention_ms                 = var.delete_retention_ms
    file_delete_delay_ms                = var.file_delete_delay_ms
    flush_messages                      = var.flush_messages
    flush_ms                            = var.flush_ms
    index_interval_bytes                = var.index_interval_bytes
    max_compaction_lag_ms               = var.max_compaction_lag_ms
    max_message_bytes                   = var.max_message_bytes
    message_downconversion_enable       = var.message_downconversion_enable
    message_format_version              = var.message_format_version
    message_timestamp_difference_max_ms = var.message_timestamp_difference_max_ms
    message_timestamp_type              = var.message_timestamp_type
    min_cleanable_dirty_ratio           = var.min_cleanable_dirty_ratio
    min_compaction_lag_ms               = var.min_compaction_lag_ms
    min_insync_replicas                 = var.min_insync_replicas
    preallocate                         = var.preallocate
    retention_bytes                     = var.retention_bytes
    retention_ms                        = var.retention_ms
    segment_bytes                       = var.segment_bytes
    segment_index_bytes                 = var.segment_index_bytes
    segment_jitter_ms                   = var.segment_jitter_ms
    segment_ms                          = var.segment_ms
    unclean_leader_election_enable      = var.unclean_leader_election_enable
  }

  dynamic "tag" {
    for_each = var.tags
    content {
      key   = lookup(tag.value, "key", null)
      value = lookup(tag.value, "value", null)
    }
  }
}