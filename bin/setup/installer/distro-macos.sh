#!/bin/bash

if tput colors &>/dev/null && [[ $(tput colors) -ge 8 ]]; then
    COLOR_SUPPORTED=true
else
    COLOR_SUPPORTED=false
fi

if [[ $COLOR_SUPPORTED == true ]]; then
    RED="\033[31m"
    NC="\033[0m"
    YELLOW="\033[33m"
    GREEN="\033[32m"
else
    RED=""
    NC=""
    YELLOW=""
    GREEN=""
fi

DOTFILES=${DOTFILES:-~/dotfiles}

[[ -z $DOTFILES ]] && echo "ERROR: DOTFILES env variable not set. Aborting" && exit 1

echo -e "${YELLOW}INSTALLING DEPENDENCIES${NC}"
brew install cmake ruby-build pip rust
echo -e "${GREEN}DONE${NC}"
[[ -z $(command -v rg) ]]      && echo -e "${YELLOW}INSTALLING RIPGREP${NC}"        && brew install ripgrep && echo -e "${GREEN}DONE${NC}";
[[ -z $(command -v tmux) ]]    && echo -e "${YELLOW}INSTALLING TMUX${NC}"           && brew install tmux && echo -e "${GREEN}DONE${NC}";
[[ -z $(command -v cloc) ]]    && echo -e "${YELLOW}INSTALLING CLOC${NC}"           && brew install cloc && echo -e "${GREEN}DONE${NC}";
[[ -z $(command -v stow) ]]    && echo -e "${YELLOW}INSTALLING STOW${NC}"           && brew install stow && echo -e "${GREEN}DONE${NC}";
[[ -z $(command -v btop) ]]    && echo -e "${YELLOW}INSTALLING BTOP${NC}"           && brew install btop && echo -e "${GREEN}DONE${NC}";
[[ -z $(command -v exa) ]]     && echo -e "${YELLOW}INSTALLING EXA${NC}"            && sudo cargo install exa && echo -e "${GREEN}DONE${NC}";
[[ -z $(command -v batcat) ]]  && echo -e "${YELLOW}INSTALLING BAT${NC}"            && brew install bat && echo -e "${GREEN}DONE${NC}";
[[ -z $(command -v gh) ]]      && echo -e "${YELLOW}INSTALLING GH${NC}"             && brew install gh && echo -e "${GREEN}DONE${NC}"; 
[[ -z $(command -v lazygit) ]] && echo -e "${YELLOW}INSTALLING LAZYGIT${NC}"        && brew install gh && echo -e "${GREEN}DONE${NC}"; 
[[ -z $(command -v fzf) ]]     && echo -e "${YELLOW}INSTALLING FZF${NC}"            && brew install fzf && echo -e "${GREEN}DONE${NC}"; 
[[ -z $(command -v sketchybar) ]]     && echo -e "${YELLOW}INSTALLING SKETCHYBAR${NC}" \ 
  && brew tap FelixKratz/formulae && brew install sketchybar && echo -e "${GREEN}DONE${NC}"; 
  brew install --cask font-jetbrains-mono-nerd-font font-roboto-mono-nerd-font
$DOTFILES/bin/setup/installer/install.sh omz;
