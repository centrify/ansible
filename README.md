# Centrify for Ansible

## Installation
To make these roles available in your playbooks, simply copy the content of *roles* folder under *.ansible/roles* located in the home directory of the user running playbooks or under */etc/ansible/roles*. 

## Configuration

### Centrify Audit and Monitoring Services Role
Role is named *centrify_audit* under *roles* folder.  
To start using this Role you should check the default variables under *roles/centrify_audit/defaults/main.yml* and declare values for your inventory using host_vars or group_vars

### Centrify Authentication and Privilege Elevation Services Role
Role is named *centrify_auth* under *roles* folder.  
To start using this Role you should check the default variables under *roles/centrify_auth/defaults/main.yml* and declare values for your inventory using host_vars or group_vars
You will also need to generate or edit the following files under *roles/centrify_auth/files*
- adjoin.keytab
- Centrify Agent for Windows64.msi
- Group Policy Deployment.mst
- Join-CentrifyZone.ps1
- krb5.conf

**adjoin.keytab:**  
You can generate a keytab file to use with Active Directory service account using the followin commands on Linux (requires a Centrify joined Linux server).

**Centrify Agent for Windows64.msi and Group Policy Deployment.mst:**  
Both those files should be copied from the software source of the Centrify Infrastructure Services for Windows in use. Those two files are located under */Agent* folder.

**Join-CentrifyZone.ps1:**  
This PowerShell script is provided as as sample and is used to join Windows system to existing Centrify Zone. This script can be modified to satisfy any customisation of the join process in your environment.
 
**krb5.conf:**  
You can copy the Kerberos config file of any of your Centrify joined Linux systems to the same Active Directory domain you plan to join using Ansible. Alternatively you can manually create this file using Kerberos docuementation.

### Centrify Vault Role
Role is named *centrify_vault* under *roles* folder.  
To start using this Role you should check the default variables under *roles/centrify_vault/defaults/main.yml* and declare values for your inventory using host_vars or group_vars

### Example
This is an example of hosts file declaring default inventory. 

**hosts**
```
---
# Grouped by OS
linux:
  hosts:
    rhel-nsblapp01.domain.name:
    rhel-nsblweb01.domain.name:
    suse-pgrsdb01.domain.name:
    ubnt-pgadmweb01.domain.name:

windows:
  hosts:
    win-centapp01.domain.name:
    win-centapp02.domain.name:
    win-rdpgw01.domain.name:

# Grouped by type
application:
  hosts:
    rhel-nsblapp01.domain.name:
    win-centapp01.domain.name:
    win-centapp02.domain.name:

database:
  hosts:
    suse-pgrsdb01.domain.name:

webserver:
  hosts:
    rhel-nsblweb01.domain.name:
    ubnt-pgadmweb01.domain.name:
    win-rdpgw01.domain.name:
```

Then an example of how to set values for Centrify roles on the Linux group of systems, using a file named linux under group_vars

**linux**
```
# Connection variable for linux
ansible_user: ansible 
ansible_become: yes

# Centrify variables for linux
centrify_redhat_urltoken: tc-xxxxxxxx-M0EV
centrify_debian_urltoken: dp-xxxxxxxx-WLgR
centrify_suse_urltoken: ga-xxxxxxxx-caHL

# Centrify Vault variables for linux
centrify_vault_tenant_url: https://company.my.centrify.net
centrify_vault_registration_code: I3-XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX-AWQJ5O1
centrify_vault_features: aapm,dmc 

# Centrify Auth variables for linux
centrify_auth_domain: domain.name
centrify_auth_service_principal: svc_adjoin@DOMAIN.NAME
centrify_auth_container: domain.name/Centrify/Computers
centrify_auth_zone: domain.name/Centrify/Zones/AWS/Linux

# Centrify Audit variables for linux
centrify_audit_installation_name: CentrifyAMS
```