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

variable "termination_protection" {
  description = "Prevents the service from being deleted."
  type        = bool
  default     = false
}

variable "cleanup_policy" {
  description = "cleanup.policy value."
  type        = string
  default     = ""
}

variable "compression_type" {
  description = "compression.type value."
  type        = string
  default     = ""
}

variable "delete_retention_ms" {
  description = "delete.retention.ms value."
  type        = string
  default     = ""
}

variable "file_delete_delay_ms" {
  description = "file.delete.delay.ms value."
  type        = string
  default     = ""
}

variable "flush_messages" {
  description = "flush.messages value."
  type        = string
  default     = ""
}

variable "flush_ms" {
  description = "flush.ms value."
  type        = string
  default     = ""
}

variable "index_interval_bytes" {
  description = "index.interval.bytes value."
  type        = string
  default     = ""
}

variable "max_compaction_lag_ms" {
  description = "max.compaction.lag.ms value."
  type        = string
  default     = ""
}

variable "max_message_bytes" {
  description = "max.message.bytes value."
  type        = string
  default     = ""
}

variable "message_downconversion_enable" {
  description = "message.downconversion.enable value."
  type        = string
  default     = ""
}

variable "message_format_version" {
  description = "message.format.version value."
  type        = string
  default     = ""
}

variable "message_timestamp_difference_max_ms" {
  description = "message.timestamp.difference.max.ms value."
  type        = string
  default     = ""
}

variable "message_timestamp_type" {
  description = "message.timestamp.type value."
  type        = string
  default     = ""
}

variable "min_cleanable_dirty_ratio" {
  description = "min.cleanable.dirty.ratio value."
  type        = string
  default     = ""
}

variable "min_compaction_lag_ms" {
  description = "min.compaction.lag.ms value."
  type        = string
  default     = ""
}

variable "min_insync_replicas" {
  description = "min.insync.replicas value."
  type        = string
  default     = ""
}

variable "preallocate" {
  description = "preallocate value."
  type        = string
  default     = ""
}

variable "retention_bytes" {
  description = "retention.bytes value."
  type        = string
  default     = ""
}

variable "retention_ms" {
  description = "retention.ms value."
  type        = string
  default     = ""
}

variable "segment_bytes" {
  description = "segment.bytes value."
  type        = string
  default     = ""
}

variable "segment_index_bytes" {
  description = "segment.index.bytes value."
  type        = string
  default     = ""
}

variable "segment_jitter_ms" {
  description = "segment.jitter.ms value."
  type        = string
  default     = ""
}

variable "segment_ms" {
  description = "segment.ms value."
  type        = string
  default     = ""
}

variable "unclean_leader_election_enable" {
  description = "unclean.leader.election.enable value."
  type        = string
  default     = ""
}

variable "tags" {
  description = "List of the topic tags."
  type        = list(any)
  default     = []
}