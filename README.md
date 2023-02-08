# This is the provisioning of my personal WSL2 setup (using Ansible).

Prerequires:

    ./install_ansible.sh

Install:

    ./run_ansible.sh

or

    ansible-playbook playbooks/machine-wsl.yml -i hosts.yml -K 

Couple other useful commands:

    wsl —shutdown
    wsl --unregister Ubuntu-22.04
    wsl --install Ubuntu-22.04
    notepad "$env:USERPROFILE/.wslconfig"

content of `.wslconfig`
```properties
[wsl2]
memory=32GB
processors=6
```