module "kafka" {
  source          = "../.."
  project         = var.project
  service_name    = "test"
  schema_registry = true
  plan            = "developer-2-1d"
  kafka_version   = "4.2"
  tags = [
    {
      key   = "env"
      value = "test"
    }
  ]
}

module "user" {
  source       = "../../modules/user"
  project      = module.kafka.project
  service_name = module.kafka.service_name
  username     = "test"
}

module "topic" {
  source       = "../../modules/topic"
  project      = module.kafka.project
  service_name = module.kafka.service_name
  topic_name   = "test"
  partitions   = 5
  replication  = 1
}

module "acl" {
  source       = "../../modules/acl"
  project      = module.kafka.project
  service_name = module.kafka.service_name
  topic        = "test"
  permission   = "admin"
  username     = module.user.username
}

module "schema" {
  source              = "../../modules/schema"
  project             = module.kafka.project
  service_name        = module.kafka.service_name
  subject_name        = "kafka-schema1"
  compatibility_level = "FORWARD"

  schema = <<EOT
    {
       "doc": "example",
       "fields": [{
           "default": 5,
           "doc": "my test number",
           "name": "test",
           "namespace": "test",
           "type": "int"
       }],
       "name": "example",
       "namespace": "example",
       "type": "record"
    }
    EOT
}

module "schema_configuration" {
  source              = "../../modules/schema_configuration"
  project             = module.kafka.project
  service_name        = module.kafka.service_name
  compatibility_level = "FORWARD"
}

module "schema_registry_acl" {
  source       = "../../modules/schema_registry_acl"
  project      = module.kafka.project
  service_name = module.kafka.service_name
  permission   = "schema_registry_read"
  resource     = "Subject:test"
  username     = module.user.username
}
