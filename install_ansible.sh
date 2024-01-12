#!/bin/bash

# add Ansible repo
sudo apt-add-repository ppa:ansible/ansible -y

# Install pre-requisites
sudo apt update
sudo apt install -y aptitude ansible dialog
sudo wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/bin/yq &&\
    sudo chmod +x /usr/bin/yq    

# Install used collections    
ansible-galaxy collection install bec.shell --force

# Install used roles
ansible-galaxy role install danielrolls.nix  --force
ansible-galaxy role install dotstrap.fzf  --force
ansible-galaxy role install gantsign.oh-my-zsh  --force
ansible-galaxy role install geerlingguy.docker --force
ansible-galaxy role install geerlingguy.pip --force

