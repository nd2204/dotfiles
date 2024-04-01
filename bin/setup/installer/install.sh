#!/usr/bin/bash

RED="\e[0;31m"
NC="\e[0m"
YELLOW="\e[0;33m"
GREEN="\e[0;32m"

#====================================================================================
# Oh my zsh Installer
#====================================================================================
function install_omz() {
    if [[ ! -z $(command -v zsh) && ! -d ~/.oh-my-zsh ]]; then
        echo -e "${YELLOW}INSTALLING OMZ${NC}"
        cd $HOME && sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        echo -e "${GREEN}DONE${NC}";
    else
        echo "omz already exist"
    fi
    echo -e "${YELLOW}INSTALLING OMZ PLUGINS${NC}"
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
    git clone https://github.com/jeffreytse/zsh-vi-mode ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-vi-mode
    ln -s ${DOTFILES:-~/dotfiles/zsh/.oh-my-zsh/themes/haru.zsh-theme} ~/.oh-my-zsh/themes/haru.zsh-theme 
    echo -e "${GREEN}DONE${NC}";
}

#====================================================================================
# Nvim Installer
#====================================================================================
function install_neovim() {
    if [[ ! -z $(command -v nvim) ]]; then
        echo "Neovim already installed"
    else
        echo -e "${YELLOW}INSTALLING NEOVIM${NC}"
        case $1 in
            "latest")
                curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
                ;;
            "nightly" | "dev")
                curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage 
                ;;
            *)
                curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
                ;;
        esac
        chmod u+x nvim.appimage
        ./nvim.appimage --appimage-extract
        rm -rf nvim.appimage
        sudo mv squashfs-root /
        sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
        echo -e "${GREEN}DONE${NC}";
    fi

    # Install extensions
    if [ ! -z $(command -v gem) ]; then
        gem install neovim
    else
        echo "gem not found on path or installed please install using your package manager"
    fi

    if [ ! -z $(command -v pip3) ]; then
        pip3 install --user --upgrade pynvim
    else
        echo "pip3 not found on path or installed please install using your package manager or through https://www.python.org/"
    fi
}

#====================================================================================
# Zellij installer
#====================================================================================
function install_zellij() {
    echo -e "${YELLOW}INSTALLING ZELLIJ${NC}"
    dir="$HOME/.local/bin/"
    [ -d "$dir" ] && mkdir $dir
    [[ -x "$dir/zellij" ]] && exit

    case $(uname -m) in
        "x86_64"|"aarch64")
            arch=$(uname -m)
            ;;
        "arm64")
            arch="aarch64"
            ;;
        *)
            echo "Unsupported cpu arch: $(uname -m)"
            exit 2
            ;;
    esac

    case $(uname -s) in
        "Linux")
            sys="unknown-linux-musl"
            ;;
        "Darwin")
            sys="apple-darwin"
            ;;
        *)
            echo "Unsupported system: $(uname -s)"
            exit 2
            ;;
    esac

    url="https://github.com/zellij-org/zellij/releases/latest/download/zellij-$arch-$sys.tar.gz"
    curl --location "$url" | tar -C "$dir" -xz
    if [[ $? -ne 0 ]]
    then
        echo
        echo "Extracting binary failed, cannot launch zellij :("
        echo "One probable cause is that a new release just happened and the binary is currently building."
        echo "Maybe try again later? :)"
        exit 1
    fi
    echo -e "${GREEN}DONE${NC}";
}

#====================================================================================
# Nodejs version manager (nvm) Installer
#====================================================================================
function install_nvm() {
    if [[ -z $(command -v nvm) ]]; then
        echo -e "${YELLOW}INSTALLING NVM${NC}"
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
        export NVM_DIR="$HOME/.nvm"
        [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
        [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
        echo -e "${GREEN}DONE${NC}";
    else 
        echo "nvm already installed"
        exit 0
    fi
    echo -e "${YELLOW}INSTALLING NODEJS LTS${NC}"
    nvm install --lts
    echo -e "${GREEN}DONE${NC}";
}

#====================================================================================
# Lazygit Installer
#====================================================================================
function install_lazygit() {
    if [ -n $(command -v lazygit) ]; then
        echo -e "${YELLOW}INSTALLING LAZYGIT${NC}"
        LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
        curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
        tar xf lazygit.tar.gz lazygit
        sudo install lazygit /usr/local/bin
        rm lazygit lazygit.tar.gz
        echo -e "${GREEN}DONE${NC}";
    else
        version=$(lazygit -v | awk '{print $6}' | sed 's/,//')
        echo "Lazygit version=$version already installed"
    fi
}

#====================================================================================
# FZF Installer
#====================================================================================
function install_fzf() {
    echo -e "${YELLOW}INSTALLING FZF${NC}"
    [ ! -d ~/.fzf ] && git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
    echo -e "${GREEN}DONE${NC}";
}

#====================================================================================
# Rustup Installer
#====================================================================================
function install_rustup() {
    echo -e "${YELLOW}INSTALLING RUSTUP${NC}"
    # Install Rustup
    [[ -z $(command -v rustup) ]] \
        && curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh \
        || echo "rustup already installed"
    echo -e "${GREEN}DONE${NC}";
}

[[ "lazygit" =~ $@ ]] && install_lazygit
[[ "neovim" =~ $@ ]]  && install_neovim
[[ "zellij" =~ $@ ]]  && install_zellij
[[ "rustup" =~ $@ ]]  && install_rustup
[[ "omz" =~ $@ ]]     && install_omz
[[ "nvm" =~ $@ ]]     && install_nvm
[[ "fzf" =~ $@ ]]     && install_fzf
