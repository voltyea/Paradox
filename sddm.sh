#!/usr/bin/bash

sudo mkdir -p /etc/sddm.conf.d/
sudo cp dotfiles/sddm/sddm.conf /etc/sddm.conf.d/
sudo cp -r dotfiles/sddm/themes/corners/ /usr/share/sddm/themes/
sudo cp dotfiles/sddm/user_face_icons/volty.face.icon /usr/share/sddm/faces/
