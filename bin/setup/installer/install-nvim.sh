#!/usr/bin/bash

if [ -n $(command -v nvim) ]; then
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
else
    echo "Neovim already installed"
fi

# Install extensions
sudo apt install python3 python3-venv pip
gem install neovim
python3 -m pip install --user --upgrade pynvim
