## Install ansible in LXC container ##

# Update System
sudo apt update ; apt upgrade -y

# Create ansible user & add to sudo group
sudo adduser ansible
sudo usermod -aG sudo ansible

### Login as ansible user ###
# Install python installer
sudo apt install pipx
sudo apt install sshpass

# Install ansible
sudo pipx install --include-deps ansible

# Set environment path
pipx ensurepath

# Upgrade ansible
pipx upgrade --include-injected ansible

# Install ansible collection for remote key - https://docs.ansible.com/ansible/latest/collections/ansible/posix/authorized_key_module.html#examples
ansible-galaxy collection install ansible.posix

# Make homelab dir
mkdir /home/ansible/homelab

# Generate ansible_key ssh key
ssh-keygen -t ed25519
ssh-copy-id -i /home/ansible/.ssh/ansible_key user@host

# variable in ansible playbook
   vars:
     ansible_ssh_private_key_file: "{{ key1 }}"

# Ansible Test Connectivity
ansible homelab -m ping -u ansible --ask-pass

# run bootstrap playbook
ansible-playbook bootstrap.yml -u root -k
