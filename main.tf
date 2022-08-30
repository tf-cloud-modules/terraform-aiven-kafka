resource "aiven_kafka" "this" {
  count                   = var.create ? 1 : 0
  cloud_name              = var.cloud_name
  default_acl             = var.default_acl
  karapace                = var.karapace
  maintenance_window_dow  = var.maintenance_window_dow
  maintenance_window_time = var.maintenance_window_time
  plan                    = var.plan
  project                 = var.project
  project_vpc_id          = var.project_vpc_id
  static_ips              = var.static_ips
  service_name            = var.service_name
  termination_protection  = var.termination_protection

  kafka_user_config {
    custom_domain   = var.custom_domain
    ip_filter       = var.ip_filter
    kafka_connect   = var.kafka_connect
    kafka_rest      = var.kafka_rest
    kafka_version   = var.kafka_version
    schema_registry = var.schema_registry

    public_access {
      kafka           = var.public_access_kafka
      kafka_connect   = var.public_access_kafka_connect
      kafka_rest      = var.public_access_kafka_rest
      prometheus      = var.public_access_prometheus
      schema_registry = var.public_access_schema_registry
    }

    private_access {
      prometheus = var.private_access_prometheus
    }

    privatelink_access {
      jolokia         = var.privatelink_jolokia
      kafka           = var.privatelink_kafka
      kafka_connect   = var.privatelink_kafka_connect
      kafka_rest      = var.privatelink_kafka_rest
      prometheus      = var.privatelink_prometheus
      schema_registry = var.privatelink_schema_registry
    }
  }

  dynamic "tag" {
    for_each = var.tags
    content {
      key   = lookup(tag.value, "key", null)
      value = lookup(tag.value, "value", null)
    }
  }


}