# Cloud Resource Tracker
Track and log AWS, Azure, and GitHub resource usage using shell scripts and CLI tools.  
Intended for automation and scheduled reporting via cron.
Now includes Ansible-based setup for automated provisioning and script deployment.

## Description
These scripts collect information on:

### AWS
- EC2 instances
- S3 buckets
- Lambda functions
- IAM users

### Azure
- Virtual Machines
- Storage Accounts
- Function Apps
- Azure AD users

### GitHub
- Lists users with access to a specific repository (via API)

Scripts are designed for scheduled daily execution using `crontab`, logging results to files.
Provisioning of dependencies and repo setup is automated using Ansible.

## Project Structure
cloud-resource-tracker/  
├── ansible/  
│   ├── inventory.ini  
│   └── setup.yml  
├── aws/  
│   └── aws_resource_report.sh  
├── azure/  
│   └── azure_resource_report.sh  
├── github/  
│   └── github_collaborators.sh  
├── docs/  
│   ├── aws_resources.md  
│   ├── azure_resources.md  
│   └── github-collaborators.md  
├── .gitignore  
└── README.md    

## Requirements

**AWS:**
- AWS CLI installed and configured  
- IAM permissions for EC2, S3, Lambda, IAM  
- `jq` for JSON parsing (optional)

**Azure:**
- Azure CLI installed and authenticated (`az login`)  
- Access rights to list VMs, storage, functions, and users
- `jq` installed

**GitHub:**
- GitHub personal access token (PAT) with repo access
- Environment variables: `REPO_OWNER`, `REPO_NAME`, `GITHUB_TOKEN`

## Usage

1. Make scripts executable:
```bash
    chmod +x aws_resource_report.sh
    chmod +x azure_resource_report.sh
    chmod +x github_collaborators.sh
```

2. Run manually:
```bash
    ./aws_resource_report.sh
    ./azure_resource_report.sh
    ./github_collaborators.sh
```

3. Or schedule with crontab:
```bash
    crontab -e
```

Add entries:
```bash
0 6 * * * /full/path/to/aws_resource_report.sh >> /full/path/to/aws_report.log 2>&1
0 6 * * * /full/path/to/azure_resource_report.sh >> /full/path/to/azure_report.log 2>&1
0 6 * * * /full/path/to/github_collaborators.sh >> /full/path/to/github_report.log 2>&1
```

## Ansible-based setup:
Run this to install required tools and clone the project repo on EC2, Azure VM, and WSL:
```bash
ansible-playbook -i ansible/inventory.ini ansible/setup.yml
```

**This will:**
- Install Git, jq, and Azure/AWS CLI where needed
- Clone the project repo
- Set up required environment on all target servers

## Version
v1.0.4 — Added GitHub collaborators tracking and updated README

