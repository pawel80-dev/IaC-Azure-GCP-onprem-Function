terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
  # Terraform cloud
  cloud {
    organization = "tf-pawel-org"
    workspaces {
      name = "tf-gcp"
    }
  }
}

provider "google" {
  # project     =   var.gc_project_id
  # region      =   var.gc_region
  # zone        = var.GCP_ZONE
}