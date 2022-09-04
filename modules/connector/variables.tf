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

variable "config" {
  description = "The Kafka Connector configuration parameters."
  type        = map(string)
}

variable "connector_name" {
  description = "The kafka connector name."
  type        = string
}