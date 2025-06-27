# Cloud Resource Tracker
Track and log AWS resource usage (AWS and Azure) using shell scripts and AWS CLI.  
Intended for automation and scheduled reporting via cron.

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

It’s designed to be run automatically (e.g., daily) using `crontab` and saves the output to a log file for review.

## Project Structure

cloud-resource-tracker/
├── aws/
│ ├── aws_resource_report.sh
│ 
├── azure/
│ ├── azure_resource_report.sh
|
├── docs/
│ ├── aws_resources.md
│ └── azure_resources.md
├── .gitignore
└── README.md

## Requirements

**For AWS:**
- AWS CLI installed and configured  
- IAM permissions to list EC2, S3, Lambda, IAM  
- `jq` installed for parsing JSON (optional but recommended)

**For Azure:**
- Azure CLI installed and logged in (`az login`)  
- Permissions to list VM, Storage, Function Apps, and AD users

## Usage

1. Make the script executable:
```bash
   chmod +x aws_resource_report.sh
   chmod +x azure_resource_report.sh
```

Run manually:
```bash
    ./aws_resource_report.sh
    ./azure_resource_report.sh
```

Or schedule with crontab:
```bash
    crontab -e
```

Add this line:

```bash
    0 6 * * * /full/path/to/cloud-resource-tracker/aws/aws_resource_report.sh >> /full/path/to/aws_report.log 2>&1
    0 6 * * * /full/path/to/cloud-resource-tracker/azure/azure_resource_report.sh >> /full/path/to/azure_report.log 2>&1
```

## Version
v1.2.0 — AWS and Azure tracking scripts and cron setup

## Future Improvements
- Add GCP support
- Combine AWS and Azure reports
- Add logging options and output delivery
- Parameterize regions and services
- Add support for email or blob/S3 export
