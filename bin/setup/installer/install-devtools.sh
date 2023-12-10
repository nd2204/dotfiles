#!/usr/bin/bash

sudo apt install build-essential

# Install c/cpp deps
sudo apt install g++ gcc clang make cmake

# Install ruby deps
sudo apt install ruby-dev

# Install Rustup
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh

# Install python
sudo apt install python3 python3-venv pip

# Install nodejs version manager
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
nvm install --lts
