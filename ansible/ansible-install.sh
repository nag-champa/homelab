#!/bin/bash

## Steps to install ansible in lxc container
#1. Update System
#2. Create ansible user
#3. Install apps
#4. Install ansible
#5. Prep ansible user environment

# Update System
sudo apt update ; apt upgrade -y

# Create ansible user & add to sudo group
adduser ansible
usermod -aG sudo ansible

# Install applications
apt install git pipx sshpass curl gh -y

#Login as ansible user
su - ansible

# Install ansible
pipx install --include-deps ansible

# Prep ansible user environment
pipx ensurepath #set ansible path
ssh-keygen -t ed25519 -f /home/ansible/.ssh/ansible_key #create ssh keys
git clone https://github.com/nag-champa/homelab.git  #Git clone homelab code repo


## Reference
## Run to Upgrade ansible
pipx upgrade --include-injected ansible

# Install ansible collection for remote key - https://docs.ansible.com/ansible/latest/collections/ansible/posix/authorized_key_module.html#examples
ansible-galaxy collection install ansible.posix

# Copies ssh key to remote host (covered in bootstrap playbook)
ssh-copy-id -i /home/ansible/.ssh/ansible_key user@host

# variable in ansible playbook
   vars:
     ansible_ssh_private_key_file: "{{ key1 }}"

# Ansible Test Connectivity
ansible homelab -m ping -u ansible --ask-pass

