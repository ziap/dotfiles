# Zap's dotfiles

Just some configuration I made to learn more about Linux and desktop operating system in general, optimizing my workflow and making something that looks good.

![](rice.png)

## Informations

- OS: [Fedora Linux](https://getfedora.org/)
- WM: [sway](https://swaywm.org/)
- Shell: [zsh](https://www.zsh.org/)
- Editor: [neovim](https://neovim.io/)
- Terminal: [kitty](https://sw.kovidgoyal.net/kitty/)
- Browser: [firefox](https://www.mozilla.org/en-US/firefox/)
- Launcher: [rofi](https://github.com/davatorium/rofi)
- Bar: [waybar](https://github.com/Alexays/Waybar)
- Colorscheme: [gruvbox](https://github.com/morhetz/gruvbox)

### Features

- Gruvbox themed desktop
- Window management with autotiling
- Lightweight yet powerful ZSH shell with starship prompt
- Working development environment for
    + C++
    + HTML/CSS/JS
    + Python
- Document editing with markdown, latex, pandoc and reveal.js
- File browsing and application launcher with rofi
- Screenshot with support for
    + Region
    + Window
    + Screen
- Power menu and a very basic lock screen
- Essential Fedora modification (rpmfusion, codecs) included in the install script

### Plan

- Rust, Svelte development environment
- Notification with dunst
- Wifi, bluetooth and more widgets with eww
- Setup on a more minimal Fedora installation

## Required packages

All packages can be installed with dnf

```bash
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

sudo dnf install @multimedia bat clang-tools-extra exa fd-find gcc gcc-c++ git grim kitty light ImageMagick neovim nodejs npm papirus-icon-theme python3 pandoc playerctl python3-pip ripgrep rofi slurp sqlite starship sway texlive util-linux-user waybar wl-clipboard zathura zathura-pdf-mupdf zsh zsh-autosuggestions zsh-syntax-highlighting
```

## Installation

```bash
# Install required packages (see above)

# Install FiraCode Nerd Font
git clone --depth=1 https://github.com/ryanoasis/nerd-fonts
cd nerd-fonts
sudo ./install.sh -S FiraCode   # Terminal font
sudo ./install.sh -S RobotoMono # UI font
cd ..

# Clone this repo
git clone --depth=1 https://github.com/ziap/dotfiles
cd dotfiles

# Setup zsh
chsh -s $(which zsh)
cp .zshrc ~

# Copy files
cp -r .config ~

# Make zathura default pdf reader
xdg-mime default org.pwmt.zathura.desktop application/pdf

# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Install Neovim language servers
sudo npm i -g pyright vscode-langservers-extracted typescript typescript-language-server emmet-ls
```

Log out from your current session and login to sway

# License

This project is licensed under the [MIT license](LICENSE).
