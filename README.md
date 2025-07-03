# Cloud Resource Tracker

Track and log AWS, Azure, and GitHub resource usage using shell scripts and CLI tools.  
Now includes Ansible-based automation for provisioning and deployment.  
Supports scheduled reporting via `cron`.

---

## Description

Collects and logs metadata for:

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
- Repository collaborators (via API)

Each script is designed for daily execution and logs output to files.  
Dependencies and repo setup are automated using Ansible.

---

## Project Structure

```
cloud-resource-tracker/
├── ansible/
│   ├── inventory.ini
│   ├── setup.yml
│   ├── vars.yml
│   └── roles/
│       └── common/
├── aws/
│   └── aws_resource_report.sh
├── azure/
│   └── azure_resource_report.sh
├── github/
│   └── github_collaborators.sh
├── docs/
│   ├── aws_resources.md
│   ├── azure_resources.md
│   ├── github-collaborators.md
│   └── ansible_setup.md
├── .gitignore
└── README.md
```

---

## Requirements

### AWS
- AWS CLI configured
- IAM permissions for EC2, S3, Lambda, IAM
- `jq` installed

### Azure
- Azure CLI authenticated (`az login`)
- Access to list VMs, storage, and AD users
- `jq` installed

### GitHub
- Personal access token (PAT)
- Environment variables:
  - `REPO_OWNER`
  - `REPO_NAME`
  - `GITHUB_TOKEN`

---

## Manual Script Usage

Make executable:

```bash
chmod +x aws/aws_resource_report.sh
chmod +x azure/azure_resource_report.sh
chmod +x github/github_collaborators.sh
```

Run:

```bash
./aws/aws_resource_report.sh
./azure/azure_resource_report.sh
./github/github_collaborators.sh
```

Schedule with cron:

```bash
crontab -e
```

Example entries:

```bash
0 6 * * * /full/path/aws_resource_report.sh >> /logs/aws.log 2>&1
0 6 * * * /full/path/azure_resource_report.sh >> /logs/azure.log 2>&1
0 6 * * * /full/path/github_collaborators.sh >> /logs/github.log 2>&1
```

---

## Ansible-Based Setup

To automatically install tools and clone the repo on EC2, Azure VM, and WSL:

```bash
ansible-playbook -i ansible/inventory.ini ansible/setup.yml
```

This will:
- Install Git and jq
- Install AWS CLI (on EC2) and Azure CLI (on VM)
- Clone the project repository
- Export GitHub environment variables (on WSL)

Before running Ansible, create a `vars.yml` file in the `ansible/` folder with GitHub credentials:

```yaml
GITHUB_TOKEN: your_token_here
REPO_OWNER: your_username
REPO_NAME: your_repo
```

See `docs/ansible_setup.md` for more details.

---

## Version

**v1.0.5** — Refactored setup with Ansible automation and documentation

