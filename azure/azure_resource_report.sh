#!/bin/bash

##############################################
# Author: Yakhoub Soumare
# Date: 2025-06-27
# Version: 1.0
# Purpose: Track Azure resource usage report
# (VM, Blob Storage, Azure Functions, AAD)
##############################################

set -x		# Debug mode
set -e		# Cancel on command failure
set -o		# Cancel on pipefailures

# List all Azure VMs
echo "===== Azure Virtual Machines ====="
az vm list --query "[].{Name:name, ResourceGroup:resourceGroup}"

# List all Azure Storage Accounts
echo "===== Azure Storage Accounts ====="
az storage account list --query "[].{Name:name, ResourceGroup: resourceGroup}" -o table

# List all Azure Function Apps
echo "===== Azure Function Apps ====="
az functionapp list --query "[].{Name:name, ResourceGroup:resourceGroup}" -o table

# List all Azure AD Users
echo "===== Azure AD Users ====="
az ad user list --query "[].{Name:displayName, UserPrincipalName:userPrincipalName}" -o table
