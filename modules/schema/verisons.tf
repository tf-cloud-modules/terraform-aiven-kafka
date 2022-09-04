terraform {
  required_version = ">= 0.13.1"

  required_providers {
    aiven = {
      source  = "aiven/aiven"
      version = ">= 3.0.0"
    }
  }
}