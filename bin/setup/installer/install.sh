#!/usr/bin/bash

#====================================================================================
# Oh my zsh Installer
#====================================================================================
function install_omz() {
    if [[ ! -z $(command -v zsh) && ! -d ~/.oh-my-zsh ]]; then
	cd $HOME && sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    else
	echo "omz already exist"
    fi
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
    git clone https://github.com/jeffreytse/zsh-vi-mode ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-vi-mode
    ln -s ${DOTFILES:-~/dotfiles/zsh/.oh-my-zsh/themes/haru.zsh-theme} ~/.oh-my-zsh/themes/haru.zsh-theme 
}

#====================================================================================
# Nvim Installer
#====================================================================================
function install_neovim() {
    if [[ ! -z $(command -v nvim) ]]; then
        echo "Neovim already installed"
    else
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
}

#====================================================================================
# Nodejs version manager (nvm) Installer
#====================================================================================
function install_nvm() {
    if [[ -z $(command -v nvm) ]]; then
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
	export NVM_DIR="$HOME/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
	[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
    else 
        echo "nvm already installed"
	exit 0
    fi
    nvm install --lts
}

#====================================================================================
# Lazygit Installer
#====================================================================================
function install_lazygit() {
	echo "TODO"
}

[[ "neovim" =~ $@ ]] && install_neovim
[[ "omz" =~ $@ ]] && install_omz
[[ "zellij" =~ $@ ]] && install_zellij
[[ "nvm" =~ $@ ]] && install_nvm
[[ "lazygit" =~ $@ ]] && install_lazygit
