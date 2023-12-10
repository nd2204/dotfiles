#!/usr/bin/bash

if [ -x $(command -v nvim) ]
then
    echo "Neovim already installed"
else
    case $1 in
        "latest")
            curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
            ;;
        "nightly" | "dev")
            curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage && chmod u+x nvim.appimage
            ;;
        *)
            curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
            ;;
    esac
    ./nvim.appimage --appimage-extract
    rm -rf nvim.appimage
    sudo mv squashfs-root /
    sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
fi

# Install extensions
if [ -x $(command -v gem) ]
then
    gem install neovim
else
    echo "gem not found on path or installed please install using your package manager"
fi

if [ -x $(command -v python3) ]
then
    python3 -m pip install --user --upgrade pynvim
else
    echo "python3 not found on path or installed please install using your package manager or through https://www.python.org/"
fi
