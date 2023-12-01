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
${YELLOW}exa${NC} - oxidized ls
${YELLOW}ripgrep${NC} - Find matched patterns in file
${YELLOW}make, cmake${NC} - Build system 
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

    echo -e "${YELLOW}INSTALLING FZF${NC}"
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
    echo -e "${GREEN}DONE${NC}"

    echo -e "${YELLOW}INSTALLING LAZYGIT${NC}"
    $DOTFILE/bin/setup/installer/install-lazygit.sh
    echo -e "${GREEN}DONE${NC}"

    echo -e "${YELLOW}INSTALLING STOW, CLOC, RIPGREP, BAT, JQ, BTOP${NC}"
    sudo apt install -y stow cloc ripgrep bat jq btop
    echo -e "${GREEN}DONE${NC}"

    echo -e "${YELLOW}INSTALLING EXA DEPENDENCIES${NC}"
    sudo cargo install exa
    echo -e "${GREEN}DONE${NC}"
    # Add your Ubuntu-specific setup code here

    echo -e "${YELLOW}INSTALLING NEOVIM${NC}"
    $DOTFILE/bin/setup/installer/install-nvim.sh
    echo -e "${GREEN}DONE${NC}"
else
    echo "Aborting."
    exit 1
fi
