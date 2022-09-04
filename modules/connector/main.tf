resource "aiven_kafka_connector" "this" {
  count          = var.create ? 1 : 0
  project        = var.project
  service_name   = var.service_name
  config         = var.config
  connector_name = var.connector_name
}