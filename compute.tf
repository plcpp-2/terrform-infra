# Compute Instance
resource "oci_core_instance" "blockchain_node" {
  # Use hardcoded AD instead of variable
  availability_domain = var.availability_domain
  compartment_id     = var.compartment_id
  display_name       = "blockchain-node"
  
  # A1 shape configuration
  shape = "VM.Standard.A1.Flex"
  shape_config {
    ocpus         = 4
    memory_in_gbs = 24
    baseline_ocpu_utilization = "BASELINE_1_1"  # Full CPU performance
  }

  source_details {
    source_type = "image"
    source_id   = var.instance_image_ocid["us-chicago-1"]  # Hardcoded region
    # Maximum performance for free trial
    boot_volume_size_in_gbs = 200
  }

  create_vnic_details {
    subnet_id                 = oci_core_subnet.blockchain_subnet.id
    display_name             = "primary-vnic"
    assign_public_ip         = true
    assign_private_dns_record = true
  }

  metadata = {
    ssh_authorized_keys = var.ssh_public_key
  }

  preserve_boot_volume = false

  timeouts {
    create = "60m"  # Increased timeout for provisioning
  }

  # Tags for resource management
  defined_tags = {
    "Oracle-Tags.CreatedBy" = "Terraform"
    "Oracle-Tags.CreatedOn" = timestamp()
  }
}
