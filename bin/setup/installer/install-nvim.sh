#!/usr/bin/bash

curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage && chmod u+x nvim.appimage
# curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
./nvim.appimage --appimage-extract
sudo mv squashfs-root /
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
sudo apt install python3 python3-venv pip
gem install neovim
python3 -m pip install --user --upgrade pynvim
echo -e "${GREEN}DONE${NC}"
