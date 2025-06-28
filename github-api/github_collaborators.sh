#!/bin/bash

#######################################
# Author  : Yakhoub Soumare                 
# Date    : 2025-06-28                      
# Version : 1.0                             
# Purpose : List GitHub collaborators       
#           with read access                
#######################################

set -x		# Disable Debug (+x) mode to not expose secrets

# Cofiguration from environment
REPO_OWNER="$REPO_OWNER"
REPO_NAME="$REPO_NAME"
GITHUB_TOKEN="$GITHUB_TOKEN"

# Base API url
API_URL="https://api.github.com"

set -e		# Cancel on command failure
set -o pipefail	# Cancel on pipefailures

# Validate required inputs are present
function validate_env_vars() {
	if [[ -z "$REPO_OWNER" || -z "$REPO_NAME" || -z "$GITHUB_TOKEN" ]]; then
    		echo "Error: One or more environment variables are missing."
    		exit 1
	fi
}

# List repository collaborators
function list_collaborators() {
	response=$(curl -L \
  		-H "Accept: application/vnd.github+json" \
  		-H "Authorization: Bearer ${GITHUB_TOKEN}" \
  		-H "X-GitHub-Api-Version: 2022-11-28" \
		${API_URL}/repos/${REPO_OWNER}/${REPO_NAME}/collaborators)
	
	collaborators=$(echo "${response}" | jq -r '.[] | select(.permissions.pull==true) | .login')

	if [ -z "${collaborators}" ]; then
		echo "No users with read access found for ${REPO_OWNER}/${REPO_NAME}."
	else
		echo "Users with read access to ${REPO_OWNER}/${REPO_NAME}:"
    		echo "$collaborators"
	fi
	
}


# Main execution

validate_env_vars
echo "Listing users with read access to $REPO_OWNER/$REPO_NAME:"
list_collaborators # curl to get list

