#!/bin/bash

RED="\e[0;31m"
NC="\e[0m"
YELLOW="\e[0;33m"
GREEN="\e[0;32m"

[[ -z $DOTFILES ]] && echo "ERROR: DOTFILES env variable not set. Aborting" && exit 1

echo "This script will install the following pakage:"
[[ -z $(command -v rg) ]]      && echo -e "${YELLOW}ripgrep${NC} - Find matched patterns in file";
[[ -z $(command -v lazygit) ]] && echo -e "${YELLOW}lazygit${NC} - Git with cli interface";
[[ -z $(command -v nvim) ]]    && echo -e "${YELLOW}neovim${NC}  - Powerful file editor";
[[ -z $(command -v tmux) ]]    && echo -e "${YELLOW}tmux${NC}    - Terminal multiplexer";
[[ -z $(command -v cloc) ]]    && echo -e "${YELLOW}cloc${NC}    - Count line of code";
[[ -z $(command -v stow) ]]    && echo -e "${YELLOW}stow${NC}    - Dotfiles manager";
[[ -z $(command -v btop) ]]    && echo -e "${YELLOW}btop${NC}    - Better top";
[[ -z $(command -v zsh) ]]     && echo -e "${YELLOW}zsh${NC}     - Better console shell with various features";
[[ -z $(command -v fzf) ]]     && echo -e "${YELLOW}fzf${NC}     - Find files, dir interface";
[[ -z $(command -v exa) ]]     && echo -e "${YELLOW}exa${NC}     - Oxidized ls";
[[ -z $(command -v batcat) ]]  && echo -e "${YELLOW}bat${NC}     - Cat with wing";
[[ -z $(command -v jq) ]]      && echo -e "${YELLOW}jq${NC}      - Json Stream Processor";
[[ -z $(command -v gh) ]]      && echo -e "${YELLOW}gh${NC}      - Github CLI";

read -p "Do you want to proceed? (y/n) " answer
if [[ "$answer" =~ ^[Yy]$ ]]; then
  echo -e "${YELLOW}UPDATING UBUNTU${NC}"
  sudo apt update && sudo apt upgrade -y
  sudo apt install -y build-essential
  sudo apt install -y g++ gcc clang make cmake ruby-dev python3 python3-venv pip
  echo -e "${GREEN}DONE${NC}"
  [[ -z $(command -v rg) ]]      && echo -e "${YELLOW}INSTALLING RIPGREP${NC}" && sudo apt install -y ripgrep && echo -e "${GREEN}DONE${NC}";
  [[ -z $(command -v lazygit) ]] && echo -e "${YELLOW}INSTALLING LAZYGIT${NC}" && $DOTFILES/bin/setup/installer/install.sh lazygit && echo -e "${GREEN}DONE${NC}";
  [[ -z $(command -v nvim) ]]    && echo -e "${YELLOW}INSTALLING NEOVIM${NC}" && $DOTFILES/bin/setup/install-nvim.sh && echo -e "${GREEN}DONE${NC}";
  [[ -z $(command -v tmux) ]]    && echo -e "${YELLOW}INSTALLING TMUX${NC}" && sudo apt install tmux && echo -e "${GREEN}DONE${NC}";
  [[ -z $(command -v cloc) ]]    && echo -e "${YELLOW}INSTALLING CLOC${NC}" && sudo apt install -y cloc && echo -e "${GREEN}DONE${NC}";
  [[ -z $(command -v stow) ]]    && echo -e "${YELLOW}INSTALLING STOW${NC}" && sudo apt install -y stow && echo -e "${GREEN}DONE${NC}";
  [[ -z $(command -v btop) ]]    && echo -e "${YELLOW}INSTALLING BTOP${NC}" && sudo apt install -y btop && echo -e "${GREEN}DONE${NC}";
  [[ -z $(command -v zsh) ]]     && echo -e "${YELLOW}INSTALLING ZSH${NC}" && sudo apt install -y zsh && echo -e "${GREEN}DONE${NC}";
  [[ -z $(command -v fzf) ]]     && echo -e "${YELLOW}INSTALLING FZF${NC}" && $DOTFILES/bin/setup/installer/install.sh fzf && echo -e "${GREEN}DONE${NC}";
  [[ -z $(command -v exa) ]]     && echo -e "${YELLOW}INSTALLING EXA${NC}" && [[ ! -z $(command -v cargo) ]] && sudo cargo install -y exa && echo -e "${GREEN}DONE${NC}";
  [[ -z $(command -v batcat) ]]  && echo -e "${YELLOW}INSTALLING BAT${NC}" && sudo apt install -y bat && echo -e "${GREEN}DONE${NC}";
  [[ -z $(command -v jq) ]]      && echo -e "${YELLOW}INSTALLING JQ${NC}" && sudo apt install -y jq && echo -e "${GREEN}DONE${NC}";
  [[ -z $(command -v gh) ]]      && echo -e "${YELLOW}INSTALLING GH${NC}" && sudo apt install -y gh && echo -e "${GREEN}DONE${NC}"; 
else
  echo "Aborting."
  exit 1
fi
