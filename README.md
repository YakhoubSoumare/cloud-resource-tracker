# Cloud Resource Tracker
Track and log AWS resource usage using shell scripts and AWS CLI.  
Intended for automation and scheduled reporting via cron.

## Description

This script collects information on:
- EC2 instances
- S3 buckets
- Lambda functions
- IAM users

It’s designed to be run automatically (e.g., daily) using `crontab` and saves the output to a log file for review.

## Project Structure

cloud-resource-tracker/
├── aws/
│ ├── aws_resource_report.sh
│ └── aws_report.log (ignored)
├── .gitignore
└── README.md

## Requirements

- AWS CLI installed and configured  
- IAM permissions to list EC2, S3, Lambda, IAM  
- `jq` installed for parsing JSON (optional but recommended)

## Usage

1. Make the script executable:
```bash
   chmod +x aws_resource_report.sh
```

Run manually:
```bash
    ./aws_resource_report.sh
```

Or schedule with crontab:
```bash
    crontab -e
```

Add this line:

```bash
    0 8 * * * /full/path/aws_resource_report.sh >> /full/path/aws_report.log 2>&1
```

## Version
v1.0.0 — AWS tracking script and cron setup
Planned: v1.1.0 with Azure/GCP support

## Future Improvements
- Extend support to Azure and GCP
- Organize cloud-specific scripts into separate directories
- Combine results into one unified report
- Add logging and optional delivery (email or S3 upload)
- Support argument flags for manual/custom runs
