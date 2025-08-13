#/bin/bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

eval "$(/opt/homebrew/bin/brew shellenv)"

brew install neovim
brew install stow brew install yabai
brew install wezterm
brew tap FelixKratz/formulae && brew install sketchybar
brew install borders
brew install posting
brew install lazydocker
brew tap zegervdv/zathura \
  && brew install zathura \
  && brew install zathura-pdf-mupdf \
  && mkdir -p $(brew --prefix zathura)/lib/zathura \
  && ln -s $(brew --prefix zathura-pdf-mupdf)/libpdf-mupdf.dylib $(brew --prefix zathura)/lib/zathura/libpdf-mupdf.dylib
