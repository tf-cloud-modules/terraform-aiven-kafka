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