variable "create" {
  description = "Controls if resources should be created."
  type        = bool
  default     = true
}

variable "cloud_name" {
  description = "Defines where the cloud provider and region where the service is hosted in."
  type        = string
  default     = "aws-us-east-1"
}

variable "maintenance_window_dow" {
  description = "Day of week when maintenance operations should be performed. One monday, tuesday, wednesday, etc."
  type        = string
  default     = "thursday"
}

variable "maintenance_window_time" {
  description = "Time of day when maintenance operations should be performed. UTC time in HH:mm:ss format."
  type        = string
  default     = "01:00:00"
}

variable "plan" {
  description = "Defines what kind of computing resources are allocated for the service."
  type        = string
  default     = "startup-2"
}

variable "project" {
  description = "Aiven Cloud Project Name"
  type        = string
}

variable "project_vpc_id" {
  description = "Specifies the VPC the service should run in. If the value is not set the service is not run inside a VPC."
  type        = string
  default     = null
}

variable "static_ips" {
  description = "Static IPs that are going to be associated with this service."
  type        = list(string)
  default     = []
}

variable "service_name" {
  description = "Specifies the actual name of the service."
  type        = string
}

variable "tags" {
  description = "List of the service tags."
  type        = list(any)
  default     = []
}

variable "termination_protection" {
  description = "Prevents the service from being deleted."
  type        = bool
  default     = false
}

variable "default_acl" {
  description = "Create default wildcard Kafka ACL."
  type        = bool
  default     = false
}

variable "karapace" {
  description = "Switch the service to use Karapace for schema registry and REST proxy."
  type        = bool
  default     = false
}

variable "custom_domain" {
  description = "Custom domain."
  type        = string
  default     = ""
}

variable "kafka_connect" {
  description = "Enable Kafka Connect service."
  type        = bool
  default     = false
}

variable "kafka_rest" {
  description = "Enable Kafka-REST service."
  type        = bool
  default     = false
}

variable "kafka_version" {
  description = ""
  type        = string
  default     = "3.2"
}

variable "schema_registry" {
  description = "Enable Schema-Registry service."
  type        = bool
  default     = false
}

variable "private_access_prometheus" {
  description = "Allow clients to connect to prometheus with a DNS name that always resolves to the service's private IP addresses."
  type        = bool
  default     = false
}

variable "public_access_kafka" {
  description = "Allow clients to connect to kafka from the public internet for service nodes that are in a project VPC or another type of private network."
  type        = bool
  default     = false
}

variable "public_access_kafka_connect" {
  description = "Allow clients to connect to kafka_connect from the public internet for service nodes that are in a project VPC or another type of private network."
  type        = bool
  default     = false
}

variable "public_access_kafka_rest" {
  description = "Allow clients to connect to kafka_rest from the public internet for service nodes that are in a project VPC or another type of private network."
  type        = bool
  default     = false
}

variable "public_access_prometheus" {
  description = "Allow clients to connect to prometheus from the public internet for service nodes that are in a project VPC or another type of private network."
  type        = bool
  default     = false
}

variable "public_access_schema_registry" {
  description = "Allow clients to connect to schema_registry from the public internet for service nodes that are in a project VPC or another type of private network."
  type        = bool
  default     = false
}

variable "privatelink_jolokia" {
  description = "Enable jolokia."
  type        = bool
  default     = false
}

variable "privatelink_kafka" {
  description = "Enable kafka."
  type        = bool
  default     = false
}

variable "privatelink_kafka_connect" {
  description = "Enable kafka_connect."
  type        = bool
  default     = false
}

variable "privatelink_kafka_rest" {
  description = "Enable kafka_rest."
  type        = bool
  default     = false
}

variable "privatelink_prometheus" {
  description = "Enable prometheus."
  type        = bool
  default     = false
}

variable "privatelink_schema_registry" {
  description = "Enable schema_registry."
  type        = bool
  default     = false
}

variable "auto_create_topics_enable" {
  description = "auto.create.topics.enable"
  type        = bool
  default     = false
}

variable "compression_type" {
  description = "compression.type"
  type        = string
  default     = ""
}

variable "connections_max_idle_ms" {
  description = "connections.max.idle.ms"
  type        = number
  default     = null
}

variable "default_replication_factor" {
  description = "default.replication.factor"
  type        = number
  default     = null
}

variable "group_initial_rebalance_delay_ms" {
  description = "group.initial.rebalance.delay.ms"
  type        = number
  default     = null
}

variable "group_max_session_timeout_ms" {
  description = "group.max.session.timeout.ms"
  type        = number
  default     = null
}

variable "group_min_session_timeout_ms" {
  description = "group.min.session.timeout.ms"
  type        = number
  default     = null
}

variable "log_cleaner_delete_retention_ms" {
  description = "log.cleaner.delete.retention.ms"
  type        = number
  default     = null
}

variable "log_cleaner_max_compaction_lag_ms" {
  description = "log.cleaner.max.compaction.lag.ms"
  type        = number
  default     = null
}

variable "log_cleaner_min_cleanable_ratio" {
  description = "log.cleaner.min.cleanable.ratio"
  type        = number
  default     = null
}

variable "log_cleaner_min_compaction_lag_ms" {
  description = "log.cleaner.min.compaction.lag.ms"
  type        = number
  default     = null
}

variable "log_cleanup_policy" {
  description = "log.cleanup.policy"
  type        = string
  default     = ""
}

variable "log_flush_interval_messages" {
  description = "log.flush.interval.messages"
  type        = number
  default     = null
}


variable "log_flush_interval_ms" {
  description = "log.flush.interval.ms"
  type        = number
  default     = null
}

variable "log_index_interval_bytes" {
  description = "log.index.interval.bytes"
  type        = number
  default     = null
}

variable "log_index_size_max_bytes" {
  description = "log.index.size.max.bytes"
  type        = number
  default     = null
}

variable "log_message_downconversion_enable" {
  description = "log.message.downconversion.enable"
  type        = bool
  default     = false
}

variable "log_message_timestamp_difference_max_ms" {
  description = "log.message.timestamp.difference.max.ms"
  type        = number
  default     = null
}

variable "log_message_timestamp_type" {
  description = "log.message.timestamp.type"
  type        = string
  default     = ""
}

variable "log_preallocate" {
  description = "log.preallocate"
  type        = bool
  default     = false
}

variable "log_retention_bytes" {
  description = "log.retention.bytes"
  type        = number
  default     = null
}

variable "log_retention_hours" {
  description = "log.retention.hours"
  type        = number
  default     = null
}

variable "log_retention_ms" {
  description = "log.retention.ms"
  type        = number
  default     = null
}

variable "log_roll_jitter_ms" {
  description = "log.roll.jitter.ms"
  type        = number
  default     = null
}

variable "log_roll_ms" {
  description = "log.roll.ms"
  type        = number
  default     = null
}

variable "log_segment_bytes" {
  description = "log.segment.bytes"
  type        = number
  default     = null
}

variable "log_segment_delete_delay_ms" {
  description = "log.segment.delete.delay.ms"
  type        = number
  default     = null
}

variable "max_connections_per_ip" {
  description = "max.connections.per.ip"
  type        = number
  default     = null
}

variable "max_incremental_fetch_session_cache_slots" {
  description = "max.incremental.fetch.session.cache.slots"
  type        = number
  default     = null
}

variable "message_max_bytes" {
  description = "message.max.bytes"
  type        = number
  default     = null
}

variable "min_insync_replicas" {
  description = "min.insync.replicas"
  type        = number
  default     = null
}

variable "num_partitions" {
  description = "num.partitions"
  type        = number
  default     = null
}

variable "offsets_retention_minutes" {
  description = "offsets.retention.minutes"
  type        = number
  default     = null
}

variable "producer_purgatory_purge_interval_requests" {
  description = "producer.purgatory.purge.interval.requests"
  type        = number
  default     = null
}

variable "replica_fetch_max_bytes" {
  description = "replica.fetch.max.bytes"
  type        = number
  default     = null
}

variable "replica_fetch_response_max_bytes" {
  description = "replica.fetch.response.max.bytes"
  type        = number
  default     = null
}

variable "socket_request_max_bytes" {
  description = "socket.request.max.bytes"
  type        = number
  default     = null
}

variable "transaction_remove_expired_transaction_cleanup_interval_ms" {
  description = "transaction.remove.expired.transaction.cleanup.interval.ms"
  type        = number
  default     = null
}

variable "transaction_state_log_segment_bytes" {
  description = "transaction.state.log.segment.bytes"
  type        = number
  default     = null
}

variable "kafka_authentication_methods_certificate" {
  description = "Enable certificate/SSL authentication."
  type        = bool
  default     = true
}

variable "kafka_authentication_methods_sasl" {
  description = "Enable SASL authentication."
  type        = bool
  default     = false
}

variable "kafka_connect_config" {
  description = "Kafka Connect configuration values."
  type        = list(any)
  default     = []
}

variable "kafka_rest_config" {
  description = "Kafka REST configuration."
  type        = list(any)
  default     = []
}

variable "schema_registry_config" {
  description = "Schema Registry configuration."
  type        = list(any)
  default     = []
}

variable "service_integrations" {
  description = "Service integrations to specify when creating a service."
  type        = list(any)
  default     = []
}

variable "ip_filter_object" {
  description = "Allow incoming connections from CIDR address block, e.g. '10.20.0.0/16'."
  type        = list(any)
  default = [
    {
      network = "0.0.0.0/0"
    }
  ]
}