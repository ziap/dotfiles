#!/bin/sh -x

git clone --depth=1 https://github.com/ziap/dotfiles
cd dotfiles

sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y @multimedia

sudo dnf install -y ImageMagick bat cargo clang-tools-extra exa \
  fcitx5-configtool fcitx5-gtk fcitx5-qt fcitx5-unikey fd-find foot gcc \
  gcc-c++ gh git git-delta grim light luajit mpv neovim nodejs npm pandoc \
  papirus-icon-theme playerctl pulseaudio-utils python3 python3-pip ripgrep \
  rofi rust rust-analyzer skim slurp sqlite sway sxiv texlive util-linux-user \
  waybar wl-clipboard zathura zathura-pdf-mupdf zsh zsh-autosuggestions \
  zsh-syntax-highlighting

sudo npm i -g pyright vscode-langservers-extracted typescript \
  typescript-language-server emmet-ls

./download_fonts.sh

cp -rp .config .zshrc .Xresources $HOME
chsh -s $(which zsh)

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

nvim -c PlugInstall
