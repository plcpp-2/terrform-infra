# Terraform Cloud Configuration
terraform {
  cloud {
    organization = "PPFN-W"
    workspaces {
      name = "spacework"
    }
  }

  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "~> 5.0"
    }
  }
}

# Configure the Oracle Cloud Infrastructure provider
provider "oci" {
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  region           = var.region
}
