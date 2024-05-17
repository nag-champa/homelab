#!/bin/bash

# Install ansible
pipx install --include-deps ansible

# Prep ansible user environment
pipx ensurepath #set ansible path
ssh-keygen -t ed25519 -N '' -f /home/ansible/.ssh/ansible_key #create ssh keys
git clone https://github.com/nag-champa/homelab.git  #Git clone homelab code repo

# Authenticate to github
#gh auth login
