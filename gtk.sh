#!/bin/bash

mkdir -p $HOME/.local/share/themes/
cp -r /usr/share/themes/. $HOME/.local/share/themes/

sudo flatpak override --filesystem=$HOME/.local/share/themes

# Change to suite your flavor / accent combination
export FLAVOR="mocha"
export ACCENT="mauve"

# Set the theme
sudo flatpak override --env=GTK_THEME="catppuccin-${FLAVOR}-${ACCENT}-standard+default"
