resource "aiven_kafka_schema" "this" {
  count               = var.create ? 1 : 0
  project             = var.project
  service_name        = var.service_name
  subject_name        = var.subject_name
  compatibility_level = var.compatibility_level
  schema              = var.schema
  schema_type         = var.schema_type

  dynamic "references" {
    for_each = var.references
    content {
      name    = lookup(references.value, "name", null)
      subject = lookup(references.value, "subject", null)
      version = lookup(references.value, "version", null)
    }
  }
}