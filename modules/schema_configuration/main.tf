resource "aiven_kafka_schema_configuration" "this" {
  count               = var.create ? 1 : 0
  project             = var.project
  service_name        = var.service_name
  compatibility_level = var.compatibility_level
}