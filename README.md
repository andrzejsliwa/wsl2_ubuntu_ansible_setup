# This is the provisioning of my personal WSL2 setup (using Ansible).

Reasoning:

Win11 (with WSL2) as a development environment configured using Ansible

Why Ansible? Because re-creating (I was using a simple make file in the previous iteration: https://github.com/andrzejsliwa/wsl2_ubuntu) from scratch the whole state of the environment is time-consuming, I enjoy idempotency provided by ansible - I'm able to revert my atomic changes quickly

Prerequires:

    ./install_ansible.sh
    ./install_brew.sh

Install:

    ./run.sh

<!-- TODO:  add Taskfile.yml   -->

Couple other useful commands:

    wsl —shutdown
    wsl --unregister Ubuntu-22.04
    wsl --install Ubuntu-22.04
    notepad "$env:USERPROFILE/.wslconfig"

<!-- content of `.wslconfig`:
```properties
[wsl2]
memory=32GB
processors=6
``` -->
