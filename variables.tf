# Required Variables
variable "tenancy_ocid" {
  description = "The OCID of your tenancy"
  type        = string
}

variable "user_ocid" {
  description = "The OCID of the user"
  type        = string
}

variable "fingerprint" {
  description = "The fingerprint of the key"
  type        = string
}

variable "private_key_path" {
  description = "The path to your private key file"
  type        = string
}

variable "region" {
  description = "The region to deploy resources to"
  type        = string
  default     = "us-ashburn-1"  # Change this to your preferred region
}

variable "ssh_public_key" {
  description = "The SSH public key content for instance access"
  type        = string
  default     = <<-EOF
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDQDvOvoCq0fJynAdbnnl/qY12hzsWZJHrxrpJmK4Djg4yXPoxAhCGgJ+c786lMrRFkA2YbsNxzlYYaJSZxSZvlW9PmXz93tb0kR4Bn37+WC5JduLRH2v2P9yMJiKSKFkn9SlGGITibeysT iWFb+mfEsGmMsxmkQmiHLpbCEbiAjz5cdXWfyP2Koc3l55Qo1CugZb6/J7yF/CY50IWEN7Luj+tVnBtJ6YHIflqYyczUlq4NH7310Qth4su5QC4DXwMbWjEz+jd74ypSz2RuhkOEn8s/4tihQ/UYFqyNOaLhYATbDOxqLVMUk3dvsBie2HwB5N+d5q+TGP12JXSbULJB
  EOF
}

variable "instance_image_ocid" {
  description = "Map of region:image-ocid for instance deployment"
  type        = map(string)
  default = {
    "us-chicago-1" = "ocid1.image.oc1.us-chicago-1.aaaaaaaagwvzwm4wk6lxvlv4hnpzpqbcw7zjxfxvlvqcpqrxkc5xwxqnxpnq"  # Oracle-Linux-8.8-aarch64-2024.01.26-0-OKE-1.28.2-653
  }
}

variable "compartment_id" {
  description = "OCID of the compartment where resources will be created"
  type        = string
}

variable "availability_domain" {
  description = "The availability domain to create the instance in"
  type        = string
}
