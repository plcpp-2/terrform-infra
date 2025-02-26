# Required Variables for OCI Infrastructure

variable "compartment_id" {
  description = "The OCID of the compartment where resources will be created"
  type        = string
}

variable "availability_domain" {
  description = "The availability domain where resources will be created"
  type        = string
}

variable "instance_image_ocid" {
  description = "The OCID of the instance image"
  type        = map(string)
  default = {
    # Oracle-Linux-8.8-2024.01.26-0-OKE-1.26.7-588
    us-chicago-1 = "ocid1.image.oc1.us-chicago-1.aaaaaaaawlpqcgkdkr2zcuqxg4qmqmooymwb5xjkjxeqhkm2myxhyrbbbpqa"
  }
}

variable "ssh_public_key" {
  description = "SSH public key to be included in the compute instance"
  type        = string
}

variable "region" {
  description = "OCI region where resources will be provisioned"
  type        = string
}

variable "tenancy_ocid" {
  description = "The OCID of the root tenancy"
  type        = string
}

variable "user_ocid" {
  description = "The OCID of the user account used for authentication"
  type        = string
}

variable "fingerprint" {
  description = "Fingerprint of the API signing key"
  type        = string
}

variable "private_key_path" {
  description = "Path to the private key file used for API authentication"
  type        = string
}
