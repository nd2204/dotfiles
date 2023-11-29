# Download font
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip && unzip JetBrainsMono.zip -d font && rm -rf JetBrainsMono.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/RobotoMono.zip && unzip RobotoMono.zip -d font && rm -rf RobotoMono.zip

# create directory if none
mkdir ~/.local/share/fonts/
mkdir ~/usr/share/fonts/

# Move font to system folder
sudo cp -r ./font/*.ttf ~/.local/share/fonts/
sudo cp -r ./font/*.ttf ~/usr/share/fonts/

# clean up the operation dependencies
rm -rf font/
