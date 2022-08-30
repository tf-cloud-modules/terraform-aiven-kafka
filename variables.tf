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

variable "ip_filter" {
  description = "IP filter."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "kafka_connect" {
  description = "Enable Kafka Connect service."
  type        = string
  default     = ""
}

variable "kafka_rest" {
  description = "Enable Kafka-REST service."
  type        = string
  default     = ""
}

variable "kafka_version" {
  description = ""
  type        = string
  default     = "3.2"
}

variable "schema_registry" {
  description = "Enable Schema-Registry service."
  type        = string
  default     = ""
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