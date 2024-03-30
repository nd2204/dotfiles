#!/bin/bash

RED="\e[0;31m"
NC="\e[0m"
YELLOW="\e[0;33m"
GREEN="\e[0;32m"

[[ -z $DOTFILES ]] && echo "ERROR: DOTFILES env variable not set. Aborting" && exit 1

echo "This script will install the following pakage:"
[[ ! -z $ZSH ]]                  && echo -e "${YELLOW}zsh${NC}     - better console shell with various features"
[[ ! -z $(command -v tmux) ]]    && echo -e "${YELLOW}tmux${NC}    - terminal multiplexer"
[[ ! -z $(command -v lazygit) ]] && echo -e "${YELLOW}lazygit${NC} - git with cli interface"
[[ ! -z $(command -v man) ]]     && echo -e "${YELLOW}man${NC}     - pakage manual"
[[ ! -z $(command -v fd) ]]      && echo -e "${YELLOW}fd${NC}      - Find files, directory"
[[ ! -z $(command -v fzf) ]]     && echo -e "${YELLOW}fzf${NC}     - Find files, dir interface"
[[ ! -z $(command -v jq) ]]      && echo -e "${YELLOW}jq${NC}      - Json Stream Processor"
[[ ! -z $(command -v cloc) ]]    && echo -e "${YELLOW}cloc${NC}    - Count line of code"
[[ ! -z $(command -v stow) ]]    && echo -e "${YELLOW}stow${NC}    - dotfiles manager"
[[ ! -z $(command -v exa) ]]     && echo -e "${YELLOW}exa${NC}     - oxidized ls"
[[ ! -z $(command -v ripgrep) ]] && echo -e "${YELLOW}ripgrep${NC} - Find matched patterns in file"
[[ ! -z $(command -v make) ]]    && echo -e "${YELLOW}make${NC}    - Build system"
[[ ! -z $(command -v cmake) ]]   && echo -e "${YELLOW}cmake${NC}   - Generate Makefiles"
[[ ! -z $(command -v neovim) ]]  && echo -e "${YELLOW}neovim${NC}  - powerful file editor"
[[ ! -z $(command -v btop) ]]    && echo -e "${YELLOW}btop${NC}    - better top"
[[ ! -z $(command -v batcat) ]]  && echo -e "${YELLOW}bat${NC}     - cat with wing"

function install_fzf() { git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf; ~/.fzf/install }
function install_lazygit() { $DOTFILES/bin/setup/installer/install-lazygit.sh }
function install_exa() { [[ ! -z $(command -v cargo) ]] && sudo cargo install -y exa || echo "ERROR: cargo not installed"; }

read -p "Do you want to proceed? (y/n) " answer
if [[ "$answer" =~ ^[Yy]$ ]]; then
    echo -e "${YELLOW}UPDATING UBUNTU${NC}"
    sudo apt update && sudo apt upgrade
    echo -e "${GREEN}DONE${NC}"
    [[ -z $ZSH ]]                  && echo -e "INSTALLING ${YELLOW}ZSH${NC}" && sudo apt install zsh && echo -e "${GREEN}DONE${NC}";
    [[ -z $(command -v tmux) ]]    && echo -e "INSTALLING ${YELLOW}TMUX${NC}" && sudo apt install tmux && echo -e "${GREEN}DONE${NC}";
    [[ -z $(command -v lazygit) ]] && echo -e "INSTALLING ${YELLOW}LAZYGIT${NC}" && install_lazygit && echo -e "${GREEN}DONE${NC}";
    [[ -z $(command -v man) ]]     && echo -e "INSTALLING ${YELLOW}MAN${NC}" && sudo apt install man && echo -e "${GREEN}DONE${NC}";
    [[ -z $(command -v fd) ]]      && echo -e "INSTALLING ${YELLOW}FD${NC}" && sudo apt install fd && echo -e "${GREEN}DONE${NC}";
    [[ -z $(command -v fzf) ]]     && echo -e "INSTALLING ${YELLOW}FZF${NC}" && install_fzf && echo -e "${GREEN}DONE${NC}";
    [[ -z $(command -v jq) ]]      && echo -e "INSTALLING ${YELLOW}JQ${NC}" && sudo apt install -y jq && echo -e "${GREEN}DONE${NC}";
    [[ -z $(command -v cloc) ]]    && echo -e "INSTALLING ${YELLOW}CLOC${NC}" && sudo apt install -y cloc && echo -e "${GREEN}DONE${NC}";
    [[ -z $(command -v stow) ]]    && echo -e "INSTALLING ${YELLOW}STOW${NC}" && sudo apt install -y stow && echo -e "${GREEN}DONE${NC}";
    [[ -z $(command -v exa) ]]     && echo -e "INSTALLING ${YELLOW}EXA${NC}" && install_exa && echo -e "${GREEN}DONE${NC}";
    [[ -z $(command -v ripgrep) ]] && echo -e "INSTALLING ${YELLOW}RIPGREP${NC}" && sudo apt install -y ripgrep && echo -e "${GREEN}DONE${NC}";
    [[ -z $(command -v make) ]]    && echo -e "INSTALLING ${YELLOW}MAKE${NC}" && sudo apt install -y make && echo -e "${GREEN}DONE${NC}";
    [[ -z $(command -v cmake) ]]   && echo -e "INSTALLING ${YELLOW}CMAKE${NC}" && sudo apt install -y cmake && echo -e "${GREEN}DONE${NC}";
    [[ -z $(command -v nvim) ]]    && echo -e "INSTALLING ${YELLOW}NEOVIM${NC}" && $DOTFILES/bin/setup/install-nvim.sh && echo -e "${GREEN}DONE${NC}";
    [[ -z $(command -v btop) ]]    && echo -e "INSTALLING ${YELLOW}BTOP${NC}" && sudo apt install btop && echo -e "${GREEN}DONE${NC}";
    [[ -z $(command -v batcat) ]]  && echo -e "INSTALLING ${YELLOW}BAT${NC}" && sudo apt install bat && echo -e "${GREEN}DONE${NC}";
else
	echo "Aborting."
	exit 1
fi
