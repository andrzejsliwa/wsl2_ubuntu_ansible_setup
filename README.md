# This is the provisioning of my personal WSL2 setup (using Ansible).

Reasoning:

I'm a heavy user of MacOSX since 2008, but after so many years with Apple, I have decided to give a chance for Win11 Pro (with WSL2) as a development environment
So far I'm positively impressed and currently experimenting with using JetBrains Gateway as remote environment on WSL2 and remote vis SSH.

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