#!/bin/bash

# install homebrew - https://brew.sh/
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install build essentials
sudo apt-get install build-essential -y

# load brew to current shell
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc
source ~/.bashrc

# install gcc
brew install gcc

# isntall Tasks
brew install go-task