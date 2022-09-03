resource "aiven_kafka_acl" "this" {
  count        = var.create ? 1 : 0
  project      = var.project
  service_name = var.service_name
  topic        = var.topic
  permission   = var.permission
  username     = var.username
  acl_id       = var.acl_id
}