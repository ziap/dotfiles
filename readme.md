<div align="center">

# SwayWM dotfiles

A custom wayland desktop environment fine-tuned to my development workflow and daily usage.

</div>

![](rice.png)

## Informations

- OS: [Fedora Linux](https://getfedora.org/)
- WM: [sway](https://swaywm.org/)
- Shell: [zsh](https://www.zsh.org/)
- Editor: [neovim](https://neovim.io/)
- Terminal: [wezterm](https://wezfurlong.org/wezterm/)
- Browser: [firefox](https://www.mozilla.org/en-US/firefox/)
- Launcher: [rofi](https://github.com/davatorium/rofi)
- Bar: [waybar](https://github.com/Alexays/Waybar)
- Colorscheme: [gruvbox](https://github.com/morhetz/gruvbox)

### Features

- ✨ Minimal and aesthetic gruvbox themed desktop
- 🍱 Window management with autotiling
- 🗨️  Lightweight yet powerful ZSH shell with starship prompt
- 🚀 Functional developer environment for
    + C and C++
    + Vanilla web development
    + Python
- 📄 Document editing with markdown, latex, pandoc and reveal.js
- 📁 File browsing and application launcher with rofi
- 📷 Screenshot with support for
    + Region
    + Window
    + Screen
- 🔌 Power menu and a very basic lock screen
- 🔧 Essential Fedora modification (rpmfusion, codecs) included in the install script

### Plan

- Add more rofi menus
- Rust, Svelte development environment
- Notification with dunst
- Setup on a more minimal Fedora installation

## Installation

```bash
# Enable rpmfusion
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

# Install packages
sudo dnf install @multimedia bat clang-tools-extra exa fd-find gcc gcc-c++ git \
  grim light lua ImageMagick neovim nodejs npm pandoc playerctl python3 \
  python3-pip ripgrep rofi slurp sqlite starship sway texlive util-linux-user \
  waybar wl-clipboard zathura zathura-pdf-mupdf zsh zsh-autosuggestions \
  zsh-syntax-highlighting

# Install wezterm
sudo dnf install https://github.com/wez/wezterm/releases/download/20220624-141144-bd1b7c5d/wezterm-20220624_141144_bd1b7c5d-1.fc36.x86_64.rpm

# Clone this repo
git clone --depth=1 https://github.com/ziap/dotfiles
cd dotfiles

# Setup zsh
chsh -s $(which zsh)
cp .zshrc ~

# Copy files
cp -rp .config ~
cp -rp .local ~

# Make zathura the default pdf reader
xdg-mime default org.pwmt.zathura.desktop application/pdf

# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Install Neovim language servers
sudo npm i -g pyright vscode-langservers-extracted typescript \
  typescript-language-server emmet-ls
```

Log out from your current session and login to sway

# License

This project is licensed under the [MIT license](LICENSE).
