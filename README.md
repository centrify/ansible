# Centrify for Ansible

## Installation

## Configuration

### Centrify Audit and Monitoring Services role
The role is named *centrify_audit* and it is located under the *roles* folder.  
To start using this role, configure the default variables under *roles/centrify_audit/defaults/main.yml*

### Centrify Authentication and Privilege Elevation Services role
The role is named *centrify_auth* and it is located under the *roles* folder.  
To start using this role, configure the default variables under *roles/centrify_auth/defaults/main.yml*  
You must also generate or edit the following files under *roles/centrify_auth/files*
- adjoin.keytab
- Centrify Agent for Windows64.msi
- Group Policy Deployment.mst
- Join-CentrifyZone.ps1
- krb5.conf
- redhat.repo
- suse.repo

**adjoin.keytab:**  
You can generate a keytab file to use with Active Directory service account using the followin commands on Linux (requires a Centrify joined Linux server).

**Centrify Agent for Windows64.msi and Group Policy Deployment.mst:**  
Both files should be copied from the software source of the Centrify Infrastructure Services for Windows in use. Those two files are located under the */Agent* folder.

**Join-CentrifyZone.ps1:**  
This PowerShell script is provided as as sample and is used to join Windows system to existing Centrify Zone. This script can be modified to satisfy any customisation of the join process in your environment.
 
**krb5.conf:**  
You can copy the Kerberos config file of any of your Centrify joined Linux systems to the same Active Directory domain you plan to join using Ansible. Alternatively you can manually create this file using Kerberos docuementation.

**redhat.repo:**  
This file is provided as a sample and is using Centrify public repository. You must edit and replace the <REPOKEY> value with your Repo Credentials that can be found from the Centrify Download Center after creation of a Repo Key.
You may also edit the information of the repo to point to an internal mirror in case systems targeted by Ansible may not have Internet access.

**suse.repo:**  
This file is provided as a sample and is using Centrify public repository. You must edit and replace the <REPOKEY> value with your Repo Credentials that can be found from the Centrify Download Center after creation of a Repo Key.
You may also edit the information of the repo to point to an internal mirror in case systems targeted by Ansible may not have Internet access.

### Centrify Vault Role
The role is named *centrify_vault* under *roles* folder.  
To start using this Role you should configure the default variables under *roles/centrify_vault/defaults/main.yml*  
You will also need to edit the following files under *roles/centrify_vault/files*
- redhat.repo
- suse.repo

**redhat.repo:**  
This file is provided as a sample and is using Centrify public repository. You must edit and replace the <REPOKEY> value with your Repo Credentials that can be found from the Centrify Download Center after creation of a Repo Key.
You may also edit the information of the repo to point to an internal mirror in case systems targeted by Ansible may not have Internet access.

**suse.repo:**  
This file is provided as a sample and is using Centrify public repository. You must edit and replace the <REPOKEY> value with your Repo Credentials that can be found from the Centrify Download Center after creation of a Repo Key.
You may also edit the information of the repo to point to an internal mirror in case systems targeted by Ansible may not have Internet access.
