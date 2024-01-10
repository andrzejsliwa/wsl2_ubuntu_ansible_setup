#!/bin/bash

# install ansible ppa
sudo apt-add-repository ppa:ansible/ansible -y

# install stuff
sudo apt update
sudo apt install -y aptitude ansible dialog
sudo wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/bin/yq &&\
    sudo chmod +x /usr/bin/yq    
    
ansible-galaxy collection install bec.shell --force
ansible-galaxy role install gantsign.oh-my-zsh --force

ansible-galaxy role install danielrolls.nix --force
ansible-galaxy role install dotstrap.fzf --force
