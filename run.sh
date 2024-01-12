#!/bin/bash
ansible-playbook playbooks/machineconfig.yml --tags wsl --skip-tags sporting -i hosts.yml -K 
