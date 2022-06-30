# Zap's dotfiles

Just some configuration I made to learn more about Linux and desktop operating system in general, optimizing my workflow and making something that looks good.

![](screenshot.png)

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

### Missing features

- Notification
- Media control panel
- Lock screen
- Wifi and bluetooth configuration menu
- Ibus

## Required packages

### Fedora 36

All packages can be installed with dnf
```
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

sudo dnf install @multimedia bat clang-tools-extra exa fd-find gcc gcc-c++ git grimshot kitty neovim nodejs npm python3 python3-pip ripgrep rofi sqlite starship sway util-linux-user waybar zsh zsh-autosuggestions zsh-syntax-highlighting
```

## Installation

```sh
# Install required packages (see above)

# Install FiraCode Nerd Font
git clone --depth=1 https://github.com/ryanoasis/nerd-fonts
cd nerd-fonts
sudo ./install.sh -S FiraCode
cd ..

# Clone this repo
git clone --depth=1 https://github.com/ziap/dotfiles
cd dotfiles

# Setup zsh
sudo chsh -s $(which zsh)
cp .zshrc ~

# Copy config files
cp -r .config ~

# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Install Neovim language servers
sudo npm i -g pyright vscode-langservers-extracted typescript typescript-language-server
```

Log out from your current session and login to sway

# License

This project is licensed under the [MIT license](LICENSE).
