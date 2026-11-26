variable "create" {
  description = "Controls if resources should be created."
  type        = bool
  default     = true
}

variable "project" {
  description = "Aiven Cloud Project Name."
  type        = string
}

variable "service_name" {
  description = "Specifies the actual name of the service."
  type        = string
}

variable "partitions" {
  description = "The number of partitions to create in the topic."
  type        = string
}

variable "replication" {
  description = "The replication factor for the topic."
  type        = string
}

variable "topic_name" {
  description = "The name of the topic."
  type        = string
}

variable "topic_description" {
  description = "Topic description."
  type        = string
  default     = null
}

variable "owner_user_group_id" {
  description = "The user group that owns the topic."
  type        = string
  default     = null
}

variable "termination_protection" {
  description = "Prevents the service from being deleted."
  type        = bool
  default     = false
}

variable "cleanup_policy" {
  description = "cleanup.policy value."
  type        = string
  default     = null
}

variable "compression_type" {
  description = "compression.type value."
  type        = string
  default     = null
}

variable "delete_retention_ms" {
  description = "delete.retention.ms value."
  type        = string
  default     = null
}

variable "diskless_enable" {
  description = "diskless.enable value."
  type        = bool
  default     = null
}

variable "file_delete_delay_ms" {
  description = "file.delete.delay.ms value."
  type        = string
  default     = null
}

variable "flush_messages" {
  description = "flush.messages value."
  type        = string
  default     = null
}

variable "flush_ms" {
  description = "flush.ms value."
  type        = string
  default     = null
}

variable "index_interval_bytes" {
  description = "index.interval.bytes value."
  type        = string
  default     = null
}

variable "local_retention_bytes" {
  description = "local.retention.bytes value."
  type        = string
  default     = null
}

variable "local_retention_ms" {
  description = "local.retention.ms value."
  type        = string
  default     = null
}

variable "max_compaction_lag_ms" {
  description = "max.compaction.lag.ms value."
  type        = string
  default     = null
}

variable "max_message_bytes" {
  description = "max.message.bytes value."
  type        = string
  default     = null
}

variable "message_downconversion_enable" {
  description = "message.downconversion.enable value."
  type        = bool
  default     = null
}

variable "message_format_version" {
  description = "Deprecated in Kafka 4.0 and ignored by Aiven; do not set when using Kafka 4.x."
  type        = string
  default     = null
}

variable "message_timestamp_after_max_ms" {
  description = "message.timestamp.after.max.ms value."
  type        = string
  default     = null
}

variable "message_timestamp_before_max_ms" {
  description = "message.timestamp.before.max.ms value."
  type        = string
  default     = null
}

variable "message_timestamp_difference_max_ms" {
  description = "message.timestamp.difference.max.ms value. For Kafka 4.x, use message_timestamp_before_max_ms and message_timestamp_after_max_ms instead."
  type        = string
  default     = null
}

variable "message_timestamp_type" {
  description = "message.timestamp.type value."
  type        = string
  default     = null
}

variable "min_cleanable_dirty_ratio" {
  description = "min.cleanable.dirty.ratio value."
  type        = number
  default     = null
}

variable "min_compaction_lag_ms" {
  description = "min.compaction.lag.ms value."
  type        = string
  default     = null
}

variable "min_insync_replicas" {
  description = "min.insync.replicas value."
  type        = string
  default     = null
}

variable "preallocate" {
  description = "preallocate value."
  type        = bool
  default     = null
}

variable "remote_storage_enable" {
  description = "remote.storage.enable value."
  type        = bool
  default     = null
}

variable "retention_bytes" {
  description = "retention.bytes value."
  type        = string
  default     = null
}

variable "retention_ms" {
  description = "retention.ms value."
  type        = string
  default     = null
}

variable "segment_bytes" {
  description = "segment.bytes value."
  type        = string
  default     = null
}

variable "segment_index_bytes" {
  description = "segment.index.bytes value."
  type        = string
  default     = null
}

variable "segment_jitter_ms" {
  description = "segment.jitter.ms value."
  type        = string
  default     = null
}

variable "segment_ms" {
  description = "segment.ms value."
  type        = string
  default     = null
}

variable "unclean_leader_election_enable" {
  description = "unclean.leader.election.enable value."
  type        = bool
  default     = null
}

variable "tags" {
  description = "List of the topic tags."
  type        = list(any)
  default     = []
}
