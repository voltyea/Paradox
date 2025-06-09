#!/bin/bash

sudo mkdir -p /etc/sddm.conf.d/
sudo cp dotfiles/sddm/sddm.conf /etc/sddm.conf.d/
sudo cp -r dotfiles/sddm/themes/corners/ /usr/share/sddm/themes/
sudo cp dotfiles/sddm/user_face_icons/user.face.icon /usr/share/sddm/faces/$USER.face.icon
sudo mkdir -p /etc/X11/xorg.conf.d/
sudo cp ./30-touchpad.conf /etc/X11/xorg.conf.d/
