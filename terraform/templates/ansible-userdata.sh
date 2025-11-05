#!/bin/bash
set -xe

# Redirect logs
exec > >(tee /var/log/user-data.log | logger -t user-data -s 2>/dev/console) 2>&1

# Install prerequisites
apt-get update -y
apt-get install -y python3-pip git

# Install Ansible
pip install --upgrade pip
pip install ansible

# Clone your Ansible repo
git clone ${ansible_repo_url} /home/ubuntu/ansible-repo
chown -R ubuntu:ubuntu /home/ubuntu/ansible-repo

# Run playbook
cd /home/ubuntu/ansible-repo/ansible
ansible-playbook playbook.yml -i localhost, --connection=local
