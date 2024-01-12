# Development env setup

## Reasoning:

As I work with Linux on various systems (wsl/on-company-laptop, wsl/on-personal-laptop, homelab/servers, dualbooted/Linux and pottential/future Macbook(s)), I need a fairly swift and consistent way to deploy the tools on all of these in a fairly consistent way.

Note from the repo I forked for this : 
> Why Ansible? Because re-creating (I was using a simple make file in the previous iteration: https://github.com/andrzejsliwa/wsl2_ubuntu) from scratch the whole state of the environment is time-consuming, I enjoy idempotency provided by ansible - I'm able to revert my atomic changes quickly

## Prerequires:

- fix DNS based on this: <https://gist.github.com/coltenkrauter/608cfe02319ce60facd76373249b8ca6>
    - I would also suggest using in `/etc/resolv.conf` the company name servers (if company machine) or your prefered DNS servers

- ~~place SSH-specific files to `.ssh` folder [optional]~~ no need, SSH role will take care of this

- install Ansible `./install_ansible.sh`

- install Homebrew `./install_brew.sh`

## Execute:

As the `./install_brew.sh` also installs [Task](https://taskfile.dev/), at this point I suggest to do a `task`, which defaults to the list of the available tasks, with their short description.

```bash
 task
# task: [default] task --list-all
# task: Available tasks for this project:
# * default:
# * init:                       Prepare WSL2 to meet the pre-requisites
# * ansible:apt:                Tasks utilising `apt` package manager
# * ansible:bash:               Configuration of 'bash' and related files
# * ansible:brew:               Tasks using Homebrew
# * ansible:docker:             Tasks configuring `Docker`
# * ansible:dot:                Task to update/create a few configuration files
# * ansible:git:                Tasks configuring `Git` client
# * ansible:list:               List Ansible tags
# * ansible:nix:                Install Nix package manager
# * ansible:python:             Install Python and required packages
# * ansible:sporting:           Configurations specific to Sporting Solutions Company
# * ansible:ssh:                SSH client and server configuration
# * ansible:sys:                Tasks configuring the Linux system in general
# * ansible:wsl:                Tasks configuring `wsl`
# * ansible:zsh:                Install ZSH
# * init:install-ansible:       Install Ansible
# * init:install-brew:          Install Homebrew
# * wsl:home:                   Prepare WSL installation on my personal [Windows] system [skipp Sporting-specific settings]
# * wsl:work:                   Prepare WSL installation on my work [Windows] system
```

You can than pick an action suitable for your needs 

> note: this list will likely be different by the time you run this, as I likely will be adding / removing tasks; consider it an **example only**!

<!-- TODO:  add Taskfile.yml   -->

## Couple other useful commands:

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

## Future plans

I am also considering turning this to [Nix](https://nixos.wiki/wiki/Nix_package_manager), but I prefer to NOT use NixOS everywhere, and so far just got limited success with using `nix`, `home manager` and `Flakes` on _non-Nix_ systems --> this is planned only. If you want to help/contribute with such, feel free to PR or reach out to discus.
