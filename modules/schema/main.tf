resource "aiven_kafka_schema" "this" {
  count               = var.create ? 1 : 0
  project             = var.project
  service_name        = var.service_name
  subject_name        = var.subject_name
  compatibility_level = var.compatibility_level
  schema              = var.schema
  schema_type         = var.schema_type
}