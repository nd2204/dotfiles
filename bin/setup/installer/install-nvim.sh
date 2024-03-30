#!/usr/bin/bash

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
