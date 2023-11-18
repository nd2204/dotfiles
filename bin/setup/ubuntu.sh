#!/bin/bash

local RED="\e[0;31m"
local NC="\e[0m"
local YELLOW="\e[0;33m"
local GREEN="\e[0;32m"

echo "This script will install the following pakage:"
echo -e "
${YELLOW}zsh${NC} - better console shell with various feature
${YELLOW}tmux${NC} - terminal multiplexer
${YELLOW}Lazygit${NC} - Git Modern Interface
${YELLOW}man${NC} - pakage manual
${YELLOW}fd${NC} - Find files, directory
${YELLOW}fzf${NC} - Find files, dir interface
${YELLOW}jq${NC} - Json Input Processor
${YELLOW}cloc${NC} - Count line of code
${YELLOW}stow${NC} - dotfiles manager
${YELLOW}colorls${NC} - prettier ls
${YELLOW}ripgrep${NC} - Find matched patterns in file
${YELLOW}make, cmake${NC} - compiles (and run) c/c++ project
${YELLOW}neovim${NC} - powerful file editor
${YELLOW}btop${NC} - better top
${YELLOW}bat${NC} - cat with wing
"
read -p "Do you want to proceed? (y/n) " answer
if [[ "$answer" =~ ^[Yy]$ ]]; then
    sudo echo -e "${YELLOW}UPDATING DISTRIBUTION${NC}"
    sudo apt update && sudo apt upgrade
    echo -e "${GREEN}DONE${NC}"

    echo -e "${YELLOW}INSTALLING ZSH,TMUX${NC}"
    sudo apt install zsh tmux
    echo -e "${GREEN}DONE${NC}"

    echo -e "${YELLOW}INSTALLING NVM -> SETTING UP NODEJS${NC}"
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
    nvm install --lts
    echo -e "${GREEN}DONE${NC}"

    echo -e "${YELLOW}INSTALLING FZF${NC}"
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
    echo -e "${GREEN}DONE${NC}"

    echo -e "${YELLOW}INSTALLING LAZYGIT${NC}"
    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
    tar xf lazygit.tar.gz lazygit
    sudo install lazygit /usr/local/bin
    rm lazygit lazygit.tar.gz
    echo -e "${GREEN}DONE${NC}"

    echo -e "${YELLOW}INSTALLING STOW,CLOC,RIPGREP,BAT,JQ${NC}"
    sudo apt install -y stow cloc ripgrep bat jq
    echo -e "${GREEN}DONE${NC}"

    echo -e "${YELLOW}INSTALLING COLORLS DEPENDENCIES${NC}"
    sudo apt install ruby-dev g++ gcc clang make cmake 
    echo -e "${YELLOW}INSTALLING COLORLS${NC}"
    sudo gem install colorls
    echo -e "${GREEN}DONE${NC}"
    # Add your Ubuntu-specific setup code here
    
    echo -e "${YELLOW}INSTALLING BTOP${NC}"
    sudo apt install btop
    echo -e "${GREEN}DONE${NC}"

    echo -e "${YELLOW}INSTALLING NEOVIM${NC}"
    curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage && chmod u+x nvim.appimage
    # curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
    ./nvim.appimage --appimage-extract
    sudo mv squashfs-root /
    sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
    sudo apt install python3 python3-venv pip
    gem install neovim
    python3 -m pip install --user --upgrade pynvim
    echo -e "${GREEN}DONE${NC}"
else
    echo "Aborting."
    exit 1
fi
