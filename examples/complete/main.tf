module "kafka" {
  source          = "../.."
  project         = "tf-cloud-modules"
  service_name    = "test"
  kafka_connect   = true
  schema_registry = true
  plan            = "business-4"
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
  replication  = 3
}

module "acl" {
  source       = "../../modules/acl"
  project      = module.kafka.project
  service_name = module.kafka.service_name
  topic        = "test"
  permission   = "admin"
  username     = module.user.username
}

module "connector" {
  source         = "../../modules/connector"
  project        = module.kafka.project
  service_name   = module.kafka.service_name
  connector_name = "test"

  config = {
    "topics" = "test"
    "connector.class" : "io.aiven.kafka.connect.opensearch.OpensearchSinkConnector"
    "type.name"           = "os-connector"
    "name"                = "test"
    "connection.url"      = "https://url.com:9243"
    "connection.username" = "test"
    "connection.password" = "fakepassword"
  }
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