#!/usr/bin/bash

rfkill unblock wlan
rfkill unblock bluetooth

 xargs -a ./my_packages sudo pacman -Syu --needed

# adding chaotic-aur

if [ ! -f /etc/pacman.d/chaotic-mirrorlist ]; then 
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB

sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst' 

 if ! grep -qF "[chaotic-aur]" /etc/pacman.conf; then
  echo -e "\n\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist" | sudo tee -a /etc/pacman.conf
  sudo pacman -Syu
  fi
fi

#Pacman stuff
if ! grep -qF "ILoveCandy" /etc/pacman.conf; then
  echo -e "\n\n[options]\nILoveCandy" | sudo tee -a /etc/pacman.conf
fi

#Changing shell to fish

FISH_PATH=$(command -v fish)
CURRENT_SHELL=$(basename "$SHELL")

if [ "$CURRENT_SHELL" != "fish" ]; then
  chsh -s "$FISH_PATH" $USER
fi

#changing grub timeout
search_line="GRUB_TIMEOUT=5"
file="/etc/default/grub"

if grep -Fxq "$search_line" "$file"; then
  
  sudo sed -i 's/^GRUB_TIMEOUT=5$/GRUB_TIMEOUT=0/' /etc/default/grub

  sudo grub-mkconfig -o /boot/grub/grub.cfg

fi

#adding insults to sudo
echo "Defaults insults" | sudo tee /etc/sudoers.d/insults
