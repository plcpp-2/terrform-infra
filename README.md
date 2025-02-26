# Personal Blockchain and Portfolio Infrastructure

## Project Overview
Personal infrastructure for blockchain applications and portfolio management using Oracle Cloud Infrastructure (OCI) and Terraform.

## Infrastructure Components
- Compute Instance: Blockchain node and portfolio application host
- Network Configuration: VCN, Subnet, Security Lists
- Deployment: Terraform-managed infrastructure

## Configuration Details
- **Region**: us-chicago-1
- **Compute Shape**: VM.Standard.A1.Flex (4 OCPUs, 24GB RAM)
- **Primary Use**: Personal blockchain and asset management

## Security Considerations
- Minimal external access
- SSH-only authentication
- No multi-user support

## Deployment Instructions
1. Ensure OCI CLI is configured
2. Validate variables in `terraform.tfvars`
3. Run `terraform init`
4. Run `terraform plan`
5. Run `terraform apply`

## Troubleshooting
- Check OCI IAM policies
- Verify network security configurations
- Validate API key permissions

## Future Improvements
- Implement more granular security rules
- Add monitoring and logging
- Explore multi-region redundancy

## Maintenance
Regular updates and security patches recommended.

## Prerequisites

1. [Oracle Cloud Infrastructure](https://www.oracle.com/cloud/) account
2. [Terraform](https://www.terraform.io/downloads.html) installed (version 0.12 or later)
3. OCI CLI configured with API key
4. SSH key pair for instance access

## Configuration

1. Create your API signing key:
```bash
openssl genrsa -out ~/.oci/oci_api_key.pem 2048
openssl rsa -pubout -in ~/.oci/oci_api_key.pem -out ~/.oci/oci_api_key_public.pem
```

2. Upload the public key to OCI Console:
   - Navigate to User Settings
   - Add the public key in API Keys section
   - Save the fingerprint

3. Copy `terraform.tfvars.example` to `terraform.tfvars`:
```bash
cp terraform.tfvars.example terraform.tfvars
```

4. Edit `terraform.tfvars` with your specific values:
   - `tenancy_ocid`
   - `user_ocid`
   - `fingerprint`
   - `private_key_path`
   - `compartment_id`
   - `availability_domain`

## Usage

1. Initialize Terraform:
```bash
terraform init
```

2. Review the plan:
```bash
terraform plan
```

3. Apply the configuration:
```bash
terraform apply
```

4. When finished, destroy the infrastructure:
```bash
terraform destroy
```

## Security Considerations

- Enhanced Instance Security:
  - Secure Boot prevents unauthorized boot loaders and kernels
  - TPM provides hardware-based security features
  - Measured Boot ensures platform integrity
  - Memory Encryption protects against physical memory attacks
- The security list is configured with basic rules. Adjust according to your needs.
- SSH access is restricted by default
- All sensitive information should be stored in `terraform.tfvars` (git-ignored)
- Use environment variables for additional security:
  ```bash
  export TF_VAR_tenancy_ocid="your-tenancy-ocid"
  export TF_VAR_user_ocid="your-user-ocid"
  export TF_VAR_fingerprint="your-fingerprint"
  export TF_VAR_private_key_path="path-to-your-private-key"
  ```
