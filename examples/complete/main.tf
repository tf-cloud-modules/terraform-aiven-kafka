module "kafka" {
  source       = "../.."
  project      = "tf-cloud-modules"
  service_name = "test"
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