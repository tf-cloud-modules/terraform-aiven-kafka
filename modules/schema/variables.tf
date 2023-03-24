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

variable "subject_name" {
  description = "The Kafka Schema Subject name."
  type        = string
}

variable "compatibility_level" {
  description = "Kafka Schemas compatibility level."
  type        = string
  default     = null
}

variable "schema" {
  description = "Kafka Schema configuration should be a valid Avro Schema JSON format."
  type        = string
}

variable "schema_type" {
  description = "Kafka Schema type JSON or AVRO"
  type        = string
  default     = "AVRO"
}
