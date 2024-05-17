#!/bin/bash

# Update System
sudo apt update ; apt upgrade -y

# Create ansible user & add to sudo group
adduser ansible
usermod -aG sudo ansible

# Install applications
apt install git pipx sshpass curl gh -y
