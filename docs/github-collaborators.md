# List Collaborators with Read Access

This script lists users who have at least read (pull) access to a GitHub repository.  
It is useful for reviewing who has access in environments like EC2, Azure VM, or WSL.

GitHub API Reference:  
https://docs.github.com/en/rest/collaborators/collaborators?apiVersion=2022-11-28

## Requirements

The script expects two environment variables to be set:

- `OWNER` — the organization or username
- `REPO` — the name of the repository

If these are not set, the script will exit with an error.

## Setting Environment Variables

It is possible to export the variables directly in the terminal:

```bash
    export OWNER=the-org
    export REPO=the-repo
```

Alternatively, save them in a local file and source it:

```bash
    # ~/.env
    export OWNER=the-org
    export REPO=the-repo
    export GITHUB_TOKEN=ghp_...

    # Load it in the terminal
    source ~/.github_env
```

To clear the values when done:

```bash
    unset OWNER REPO GITHUB_TOKEN
```

## Authentication

The script uses curl with a GitHub token for authentication:

```bash
    -H "Authorization: Bearer $GITHUB_TOKEN"
```

Make sure the token is stored securely and never committed to a repository.

