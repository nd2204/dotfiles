#!/bin/bash

RED="\e[0;31m"
NC="\e[0m"
YELLOW="\e[0;33m"
GREEN="\e[0;32m"

[[ -z $DOTFILES ]] && echo "ERROR: DOTFILE env variable not set. Aborting"; exit 1

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
    $DOTFILES/bin/setup/installer/install-lazygit.sh
    echo -e "${GREEN}DONE${NC}"

    echo -e "${YELLOW}INSTALLING STOW, CLOC, RIPGREP, BAT, JQ, BTOP${NC}"
    sudo apt install -y stow cloc ripgrep bat jq btop
    echo -e "${GREEN}DONE${NC}"

    echo -e "${YELLOW}INSTALLING EXA${NC}"
    [[ -x $(command -v cargo) ]] && sudo cargo install exa || echo "ERROR: cargo not installed"
    echo -e "${GREEN}DONE${NC}"
    # Add your Ubuntu-specific setup code here

    echo -e "${YELLOW}INSTALLING NEOVIM${NC}"
    $DOTFILES/bin/setup/installer/install-nvim.sh
    echo -e "${GREEN}DONE${NC}"
else
    echo "Aborting."
    exit 1
fi
