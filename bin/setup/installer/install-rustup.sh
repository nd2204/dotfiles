#!/usr/bin/bash

# Install Rustup
[[ -z $(command -v rustup) ]] \
       	&& curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh \
       	|| echo "rustup already installed"
