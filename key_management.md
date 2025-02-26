# OCI Key Management Guide

## Directory Structure
```
~/.oci/
  ├── config                  # OCI configuration file
  ├── oci_api_key.pem        # Private key
  └── oci_api_key_public.pem # Public key
```

## Key File Locations
1. Configuration: `~/.oci/config`
2. Private Key: `~/.oci/oci_api_key.pem`
3. Public Key: `~/.oci/oci_api_key_public.pem`

## Security Best Practices
1. Set correct file permissions:
   ```bash
   chmod 600 ~/.oci/config
   chmod 600 ~/.oci/oci_api_key.pem
   chmod 644 ~/.oci/oci_api_key_public.pem
   ```

2. Never commit these files to version control
3. Keep backups in a secure location
4. Rotate keys periodically

## Environment Variables (Alternative)
```bash
export OCI_CLI_USER=ocid1.user.oc1..example
export OCI_CLI_TENANCY=ocid1.tenancy.oc1..example
export OCI_CLI_FINGERPRINT=your:fingerprint:here
export OCI_CLI_KEY_FILE=~/.oci/oci_api_key.pem
export OCI_CLI_REGION=us-chicago-1
```
