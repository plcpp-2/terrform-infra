# VCN (Virtual Cloud Network)
resource "oci_core_vcn" "blockchain_vcn" {
  compartment_id = var.compartment_id
  cidr_blocks    = ["10.0.0.0/16"]
  display_name   = "blockchain-vcn"
  dns_label      = "blockchainvcn"

  # Use existing VCN if needed
  # id = "ocid1.vcn.oc1.us-chicago-1.amaaaaaa3iapnsaahughdzctehemxpav6ew6dkgy7hbmgwqj7rluwvonxrra"
}

# Internet Gateway
resource "oci_core_internet_gateway" "ig" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.blockchain_vcn.id
  display_name   = "blockchain-internet-gateway"
  enabled        = true
}

# Route Table
resource "oci_core_route_table" "rt" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.blockchain_vcn.id
  display_name   = "blockchain-route-table"

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.ig.id
  }
}

# Security List
resource "oci_core_security_list" "blockchain_security_list" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.blockchain_vcn.id
  display_name   = "blockchain-security-list"

  # Ingress rules
  ingress_security_rules {
    protocol    = "6" # TCP
    source      = "0.0.0.0/0"
    stateless   = false

    tcp_options {
      min = 22  # SSH
      max = 22
    }
  }

  ingress_security_rules {
    protocol    = "6" # TCP
    source      = "0.0.0.0/0"
    stateless   = false

    tcp_options {
      min = 80  # HTTP
      max = 80
    }
  }

  ingress_security_rules {
    protocol    = "6" # TCP
    source      = "0.0.0.0/0"
    stateless   = false

    tcp_options {
      min = 443  # HTTPS
      max = 443
    }
  }

  # Egress rules
  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "all"
  }
}

# Subnet
resource "oci_core_subnet" "blockchain_subnet" {
  compartment_id     = var.compartment_id
  vcn_id             = oci_core_vcn.blockchain_vcn.id
  display_name       = "blockchain-subnet"
  cidr_block         = "10.0.1.0/24"
  route_table_id     = oci_core_route_table.rt.id
  security_list_ids  = [oci_core_security_list.blockchain_security_list.id]
  dns_label          = "blockchainsubnet"
  availability_domain = var.availability_domain
}
