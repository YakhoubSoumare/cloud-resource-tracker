#!/bin/bash

##############################################
# Author: Yakhoub Soumare
# Date: 2025-06-26
# Version: 1.0
# Purpose: Track AWS resource usage report
# (EC2, S3, Lambda, IAM)
##############################################

set -x		# Debug mode
set -e		# Cancel on command failure
set -o		# Cancel on pipefailure

# List all instances ids
echo "===== EC2 Instances ====="
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId'
