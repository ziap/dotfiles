<div align="center">

# SwayWM dotfiles

A custom wayland desktop environment fine-tuned to my development workflow and daily usage.

</div>

## Informations

<img alt="screenshot" align="right" width="400px" src="img/rice.png"/>

- OS: [Fedora Linux](https://getfedora.org/)
- WM: [sway](https://swaywm.org/)
- Shell: [fish](https://fishshell.com/)
- Editor: [neovim](https://neovim.io/)
- Terminal: [kitty](https://sw.kovidgoyal.net/kitty/)
- Browser: [firefox](https://www.mozilla.org/en-US/firefox/)
- Launcher: [rofi](https://github.com/davatorium/rofi), [wayland fork](https://github.com/lbonn/rofi)
- Bar: [waybar](https://github.com/Alexays/Waybar)
- Colorscheme: [gruvbox](https://github.com/morhetz/gruvbox)

### Features

- ✨ Minimal and aesthetic gruvbox themed desktop
- 🗨️ Fish shell configured for my development workflow
- 🚀 Functional developer environment for
    + C and C++
    + Rust
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
- Svelte developer environment
- Notification with dunst
- Setup on a more minimal Fedora installation

## Installation

### Clone repository

```bash
git clone --depth=1 https://github.com/ziap/dotfiles
cd dotfiles

cp -rp .config .Xresources ~
```

### RPMFusion and media codecs

```bash
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

sudo dnf install @multimedia
```

### Fonts

Fonts being used are:
  - FiraCode (terminal, editor font)
  - VictorMono (italic font)
  - RobotoMono (UI font)

Run this script to download all fonts to the local font folder `~/.local/share/fonts`

```bash
./download_fonts.sh
```

### Terminal + Shell setup

![](img/terminal.png)

Install and setup kitty and fish

```bash
sudo dnf install kitty util-linux-user fish

chsh -s $(which fish)
```

Install extra packages

```bash
sudo dnf install sqlite ImageMagick bat eza ripgrep fd-find skim imv mpv
```

- `sqlite`: for dnf autocompletion
- `ImageMagick`: for command line image editing
- `bat`, `eza`: Syntax highlighting, icons for `cat` and `ls`
- `ripgrep`, `fd-find`: Faster `grep` and `find`
- `skim`: Fuzzy finder
- `imv`: Image viewer
- `mpv`: Video/audio player

### Desktop environment setup

![](img/desktop.png)

```bash
sudo dnf install sway rofi-wayland waybar luajit slurp grim light playerctl pulseaudio-utils wl-clipboard epapirus-icon-theme
```

- `luajit`: Run Lua rofi scripts
- `grim`, `slurp`: Screenshot tool
- `light`, `pulseaudio-utils`: Control screen brightness and audio volume
- `playerctl`: Media player controller
- `wl-clipboard`: Clipboard tool
- `epapirus-icon-theme`: ePapirus icon theme for rofi

### Developer environment setup

![](img/vim.png)

The packages for each programming languages are pretty self-explanatory

```bash
sudo dnf install neovim gh git git-delta python3 python3-pip nodejs npm gcc gcc-c++ clang-tools-extra
```

Install language servers

```bash
sudo npm i -g pyright vscode-langservers-extracted typescript typescript-language-server emmet-ls
```

Install rust and rust-analyzer

```bash
# During install select nightly profile
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

rustup component add rust-analyzer
```

While rust-analyzer isn't added to `~/.cargo/bin` by default

```bash
cat << EOF > ~/.cargo/bin/rust-analyzer
#!/bin/sh
rustup run nightly rust-analyzer
EOF

chmod +x ~/.cargo/bin/rust-analyzer
```

Install plugins

```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

nvim -c PlugInstall
```

### Firefox setup

![](img/firefox.png)

- `user.js` and custom theme in the `firefox` folder
- [Dark reader](https://darkreader.org/) with gruvbox theme

### Document editing workflow setup

```bash
sudo dnf install pandoc texlive zathura zathura-pdf-mupdf
```

### IME Setup

```bash
sudo dnf install fcitx5 fcitx5-qt fcitx5-gtk fcitx5-configtool
sudo dnf install fcitx5-unikey # Or your IME
```

You can automatically start fcitx by adding `exec_always fcitx5` to sway config but I prefer manually starting it in rofi.

# License

This project is licensed under the [GPL-3.0 license](LICENSE).
