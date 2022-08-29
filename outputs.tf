output "cloud_name" {
  description = "Defines where the cloud provider and region where the service is hosted in."
  value       = try(aiven_kafka.this[0].cloud_name, "")
}

output "components" {
  description = "Service component information objects."
  value       = try(aiven_kafka.this[0].components, "")
}

output "disk_space_cap" {
  description = "The maximum disk space of the service, possible values depend on the service type, the cloud provider and the project."
  value       = try(aiven_kafka.this[0].disk_space_cap, "")
}

output "disk_space_default" {
  description = "The default disk space of the service, possible values depend on the service type, the cloud provider and the project."
  value       = try(aiven_kafka.this[0].disk_space_default, "")
}

output "disk_space_step" {
  description = "The default disk space step of the service, possible values depend on the service type, the cloud provider and the project. "
  value       = try(aiven_kafka.this[0].disk_space_default, "")
}

output "id" {
  description = "The ID of this resource."
  value       = try(aiven_kafka.this[0].id, "")
}

output "maintenance_window_dow" {
  description = "Day of week when maintenance operations should be performed."
  value       = try(aiven_kafka.this[0].maintenance_window_dow, "")
}

output "maintenance_window_time" {
  description = "Time of day when maintenance operations should be performed."
  value       = try(aiven_kafka.this[0].maintenance_window_time, "")
}

output "plan" {
  description = "Defines what kind of computing resources are allocated for the service."
  value       = try(aiven_kafka.this[0].plan, "")
}

output "project" {
  description = "Aiven Cloud Project Name."
  value       = try(aiven_kafka.this[0].project, "")
}


output "service_host" {
  description = "The hostname of the service."
  value       = try(aiven_kafka.this[0].service_host, "")
}

output "service_integrations" {
  description = "Service integrations to specify when creating a service."
  value       = try(aiven_kafka.this[0].service_integrations, "")
}

output "service_name" {
  description = "Specifies the actual name of the service."
  value       = try(aiven_kafka.this[0].service_name, "")
}

output "service_password" {
  description = "Password used for connecting to the service, if applicable."
  sensitive   = true
  value       = try(aiven_kafka.this[0].service_password, "")
}

output "service_port" {
  description = "The port of the service."
  value       = try(aiven_kafka.this[0].service_port, "")
}

output "service_type" {
  description = "Aiven internal service type code."
  value       = try(aiven_kafka.this[0].service_type, "")
}

output "service_uri" {
  description = "URI for connecting to the service."
  sensitive   = true
  value       = try(aiven_kafka.this[0].service_uri, "")
}

output "service_username" {
  description = "Username used for connecting to the service."
  value       = try(aiven_kafka.this[0].service_username, "")
}

output "static_ips" {
  description = "Static IPs that are going to be associated with this service."
  value       = try(aiven_kafka.this[0].static_ips, "")
}

output "kafka_user_config" {
  description = "Kafka user configurable settings."
  sensitive   = true
  value       = try(aiven_kafka.this[0].kafka_user_config, "")
}

output "kafka" {
  description = "Kafka server provided values."
  sensitive   = true
  value       = try(aiven_kafka.this[0].kafka, "")
}