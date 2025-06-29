#!/bin/bash

sudo mkdir -p /usr/local/share/fonts/

sudo cp ./fonts/icomoon/fonts/icomoon.ttf /usr/local/share/fonts/
sudo cp "./fonts/JetBrains/JetBrains Mono Nerd.ttf" /usr/local/share/fonts/
sudo cp ./fonts/midorima/Midorima-PersonalUse-Regular.ttf /usr/local/share/fonts/
sudo cp ./fonts/rusilla_serif/Rusillaserif-Light.ttf /usr/local/share/fonts/
sudo cp ./fonts/rusilla_serif/Rusillaserif-Regular.ttf /usr/local/share/fonts/
sudo cp "./fonts/SF Pro Display/SF Pro Display Bold.otf" /usr/local/share/fonts/
sudo cp "./fonts/SF Pro Display/SF Pro Display Regular.otf" /usr/local/share/fonts/
sudo cp ./fonts/StretchPro/StretchPro.otf /usr/local/share/fonts/
sudo cp "./fonts/Suisse Int'l Mono/Suisse Int'l Mono.ttf" /usr/local/share/fonts/

fc-cache -fv
