#!/bin/sh -e

NF_VERSION="v3.0.1"
FONTS="FiraCode VictorMono RobotoMono"
INSTALL_DIR="$HOME/.local/share/fonts"

mkdir -p $INSTALL_DIR

for FONT in $FONTS
do
  wget "https://github.com/ryanoasis/nerd-fonts/releases/download/$NF_VERSION/$FONT.zip"
  unzip "$FONT.zip" -d "$INSTALL_DIR/$FONT Nerd Font"
  rm "$FONT.zip"
done
