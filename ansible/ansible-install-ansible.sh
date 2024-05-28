#!/bin/bash

## Run this script as ansible user

# Install ansible
pipx install --include-deps ansible

# Prep ansible user environment
pipx ensurepath #set ansible path
ssh-keygen -t ed25519 -N '' -f /home/ansible/.ssh/ansible_key #create ssh keys
git clone https://github.com/nag-champa/homelab.git  #Git clone homelab code repo

# Create ansible vault password file
/home/ansible/.ansible_vault_passwd

# Authenticate to github
gh auth login
