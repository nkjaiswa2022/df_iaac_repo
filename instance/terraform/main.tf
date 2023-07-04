# Copyright 2022 Google LLC. This software is provided as is, without warranty 
# or representation for any use or purpose. 
# Your use of it is subject to your agreement with Google.

locals {
   insdatasets = csvdecode(file("${var.ins_list_path}"))
}

terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.45.0"
    }
  }
}

provider "google-beta" {
  project = var.project_id
  credentials = file("${var.auth_file}")
  region      = var.region_id
}

provider "google" {
  project = var.project_id
  credentials = file("${var.auth_file}")
  region      = var.region_id
}

resource "google_data_fusion_instance" "create_instance" {
  count = length(local.insdatasets)
  name = local.insdatasets[count.index].instance_name
  description = local.insdatasets[count.index].description
  region = var.region_id
  type = local.insdatasets[count.index].cdf_version
  enable_stackdriver_logging = true
  enable_stackdriver_monitoring = true
  private_instance = true
  enable_rbac = true
  labels = {
      owner = local.insdatasets[count.index].instance_owner
  }
  network_config {
    network = local.insdatasets[count.index].cdf_network
    ip_allocation = local.insdatasets[count.index].cdf_ip_range
  }
  version = local.insdatasets[count.index].cdf_release
  #dataproc_service_account = local.insdatasets[count.index].default_service_account 
}