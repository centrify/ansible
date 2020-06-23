# Ansible

## Installation


## Configuration

### Centrify Audit and Monitoring Services Role
Role is named *centrify_audit* under *roles* folder.
To start using this Role you should configure the default variables under *roles/centrify_audit/defaults/main.yml*

### Centrify Authentication and Privilege Elevation Services Role
Role is named *centrify_auth* under *roles* folder.
To start using this Role you should configure the default variables under *roles/centrify_auth/defaults/main.yml*
You will also need to generate the following files under *roles/centrify_auth/files
- adjoin.keytab
- Centrify Agent for Windows64.msi
- Group Policy Deployment.mst
- Join-CentrifyZone.ps1
- krb5.conf
- redhat.repo
- suse.repo

### Centrify Vault Role
Role is named *centrify_vault* under *roles* folder.
To start using this Role you should configure the default variables under *roles/centrify_vault/defaults/main.yml*
