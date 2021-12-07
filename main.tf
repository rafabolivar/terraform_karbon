terraform {
  required_providers {
    nutanix = {
      source  = "nutanix/nutanix"
      version = "1.2.0"
    }
  }
}

data "nutanix_cluster" "cluster" {
  name = var.cluster_name
}
data "nutanix_subnet" "subnet" {
  subnet_name = var.subnet_name
}

provider "nutanix" {
  username     = var.user
  password     = var.password
  endpoint     = var.endpoint
  insecure     = true
  wait_timeout = 60
}

module "karbon" {
  source                            = "terraform-nutanix-karbon"
  version                           = "1.0.3"
  create_karbon                     = true
  karbon_cluster_name               = "test-karbon-cluster"
  storage_class_config_username     = var.user
  storage_class_config_password     = var.password
  nutanix_cluster_name              = var.cluster_name
  subnet_name                       = var.subnet_name
}

