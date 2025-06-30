#!/bin/bash

swww-daemon

while ! swww query &>/dev/null; do
  sleep 0.5
done

swww img $HOME/wallpapers/Raiden_shogun.png --transition-type any

$HOME/.config/hypr/wallpaper2.sh
