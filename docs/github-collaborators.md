# List Collaborators with Read Access

This script lists users who have at least read (pull) access to a GitHub repository.  
It is useful for reviewing who has access in environments like EC2, Azure VM, or WSL.

GitHub API Reference:  
https://docs.github.com/en/rest/collaborators/collaborators?apiVersion=2022-11-28

## Requirements

The script expects two environment variables to be set:

- `REPO_OWNER` — the organization or username
- `REPO_NAME` — the name of the repository
- `GITHUB_TOKEN` — a GitHub personal access token

If these are not set, the script will exit with an error.

## Setting Environment Variables

It is possible to export the variables directly in the terminal:

```bash
    export REPO_OWNER=the-org
    export REPO_NAME=the-repo
    export GITHUB_TOKEN=ghp_...
```

## Authentication

The script uses curl with a GitHub token for authentication:

```bash
    -H "Authorization: Bearer $GITHUB_TOKEN"
```

Make sure the token is stored securely and never committed to a repository.

