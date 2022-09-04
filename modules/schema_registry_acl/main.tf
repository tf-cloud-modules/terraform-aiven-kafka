resource "aiven_kafka_schema_registry_acl" "this" {
  count        = var.create ? 1 : 0
  project      = var.project
  service_name = var.service_name
  permission   = var.permission
  resource     = var.resource
  username     = var.username
  acl_id       = var.acl_id
}