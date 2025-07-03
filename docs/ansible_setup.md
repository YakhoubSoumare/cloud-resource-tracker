# Ansible Setup

Automates setup and configuration across all tracker machines.

## What It Does

- Installs `git` and `jq`
- Clones the project repository
- Installs cloud CLIs (AWS CLI for EC2, Azure CLI for VM)
- Exports GitHub variables (WSL only)

## Structure

```
ansible/
├── inventory.ini
├── setup.yml
└── roles/
    └── common/
```

## Inventory Groups

```ini
[trackers]
ec2
vm
wsl

[remote_trackers]
ec2
vm
```

## Run Examples

Run all:

```bash
ansible-playbook -i inventory.ini setup.yml
```

Run specific:

```bash
ansible-playbook -i inventory.ini setup.yml --limit vm
```
