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

variable "topic" {
  description = "Topic name pattern for the ACL entry."
  type        = string
}

variable "permission" {
  description = "Kafka permission to grant."
  type        = string
}

variable "username" {
  description = "Username pattern for the ACL entry."
  type        = string
}

variable "acl_id" {
  description = "Kafka ACL ID."
  type        = string
  default     = null
}