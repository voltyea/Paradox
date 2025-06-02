#!/usr/bin/bash

#copying the catppuccin-mocha lavendar cursor theme, you can change it if you like.
sudo cp -r /usr/share/icons/catppuccin-mocha-lavender-cursors/ ~/.local/share/icons/
sudo cp -r /usr/share/icons/catppuccin-mocha-lavender-cursors/ ~/.icons/
sudo cp -r /usr/share/icons/catppuccin-mocha-lavender-cursors/ /usr/share/themes/
sudo cp -r /usr/share/icons/catppuccin-mocha-lavender-cursors/ ~/.themes/

#setting the gtk xcursor theme
gsettings set org.gnome.desktop.interface cursor-theme 'catppuccin-mocha-lavender-cursors'

#setting the flatpak theme
flatpak override --filesystem=~/.themes:ro --filesystem=~/.icons:ro --user
