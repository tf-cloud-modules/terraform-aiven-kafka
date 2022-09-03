resource "aiven_kafka_user" "this" {
  count        = var.create ? 1 : 0
  project      = var.project
  service_name = var.service_name
  username     = var.username
}