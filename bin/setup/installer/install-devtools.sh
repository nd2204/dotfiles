#!/usr/bin/bash

# Installing c/cpp deps
sudo apt install g++ gcc clang make cmake

# Installing ruby deps
sudo apt install ruby-dev

# Installing Rustup
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh

# Installing nodejs version manager
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
nvm install --lts
