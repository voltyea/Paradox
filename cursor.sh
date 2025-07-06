#!/bin/bash

#copying the catppuccin-mocha mauve cursor theme, you can change it if you like.
cp -r /usr/share/icons/catppuccin-mocha-mauve-cursors/ $HOME/.local/share/icons/
cp -r /usr/share/icons/catppuccin-mocha-mauve-cursors/ $HOME/.icons/
sudo cp -r /usr/share/icons/catppuccin-mocha-mauve-cursors/ /usr/share/themes/
cp -r /usr/share/icons/catppuccin-mocha-mauve-cursors/ $HOME/.themes/

#setting the gtk xcursor theme
gsettings set org.gnome.desktop.interface cursor-theme 'catppuccin-mocha-mauve-cursors'

#setting the flatpak theme
flatpak override --filesystem=$HOME/.themes:ro --filesystem=$HOME/.icons:ro --user
