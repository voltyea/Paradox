#!/usr/bin/bash

rfkill unblock wlan
rfkill unblock bluetooth

#adding insults to sudo
echo "Defaults insults" | sudo tee /etc/sudoers.d/insults

#Pacman stuff
if ! grep -qF "ILoveCandy" /etc/pacman.conf; then
  echo -e "\n\n[options]\nILoveCandy" | sudo tee -a /etc/pacman.conf
fi

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

sudo pacman -S --needed --noconfirm rate-mirrors
sudo chmod +x ./update
sudo cp ./update /usr/bin
update
xargs -a ./my_packages sudo pacman -Syu --needed --noconfirm
# aur packages
xargs -a ./aur_packages yay -Syu --needed --noconfirm

#cpu stuff
vendor=$(grep -m 1 'vendor_id' /proc/cpuinfo | awk '{print $3}')
case "$vendor" in
GenuineIntel)
  sudo pacman -S --needed --noconfirm intel-ucode vulkan-intel lib32-vulkan-intel
  ;;
AuthenticAMD)
  sudo pacman -S --needed --noconfirm amd-ucode vulkan-radeon lib32-vulkan-radeon
  ;;
esac

#changing grub timeout
search_line="GRUB_TIMEOUT=5"
file="/etc/default/grub"

if grep -Fxq "$search_line" "$file"; then

  sudo sed -i 's/^GRUB_TIMEOUT=5$/GRUB_TIMEOUT=0/' /etc/default/grub

fi

#Copying dotfiles
version_gt() {
  [ "$(printf '%s\n%s\n' "$1" "$2" | sort -V | head -n1)" != "$1" ]
}
github_version=$(curl -s https://raw.githubusercontent.com/voltyea/dotfiles/main/VERSION.txt)
local_version=""
if [[ -f "$HOME/.config/VERSION.txt" ]]; then
  local_version=$(cat "$HOME/.config/VERSION.txt")
fi
if version_gt "$github_version" "$local_version"; then
  git clone https://github.com/voltyea/dotfiles.git /tmp/dotfiles/
  cp -r /tmp/dotfiles/. ~/.config/
fi

#installing sddm theme
sudo chmod +x ./sddm.sh
./sddm.sh

#install catppuccin cursor theme
sudo chmod +x ./cursor.sh
./cursor.sh

#installing tpm for tmux
git clone https://github.com/tmux-plugins/tpm/ ~/.config/tmux/plugins/tpm/

#Nyarch goodies

#installing nyarch assistant >⩊<
if ! flatpak list | grep -q "moe.nyarchlinux.assistant"; then
  wget -P /tmp/ https://github.com/nyarchlinux/nyarchassistant/releases/latest/download/nyarchassistant.flatpak
  flatpak install /tmp/nyarchassistant.flatpak
fi

#catgirl downloader
if ! flatpak list | grep -q "moe.nyarchlinux.catgirldownloader"; then
  wget -P /tmp/ https://github.com/nyarchlinux/catgirldownloader/releases/latest/download/catgirldownloader.flatpak
  flatpak install /tmp/catgirldownloader.flatpak
fi

#waifu downloader
if ! flatpak list | grep -q "moe.nyarchlinux.waifudownloader"; then
  wget -P /tmp/ https://github.com/nyarchlinux/waifudownloader/releases/latest/download/waifudownloader.flatpak
  flatpak install /tmp/waifudownloader.flatpak
fi

#starting services
sudo systemctl enable sddm.service
sudo systemctl enable NetworkManager.service

#regenerating mkinitcpio and the grub config
sudo mkinitcpio -P
sudo grub-mkconfig -o /boot/grub/grub.cfg

#Changing shell to fish

FISH_PATH=$(command -v fish)
CURRENT_SHELL=$(basename "$SHELL")

if [ "$CURRENT_SHELL" != "fish" ]; then
  chsh -s "$FISH_PATH" $USER
fi

#rebooting the system
# Prompt the user
read -p "Do you want to reboot the system now? (yes/no): " answer

# Convert answer to lowercase
answer=$(echo "$answer" | tr '[:upper:]' '[:lower:]')

# Check the user's input
if [[ "$answer" == "yes" || "$answer" == "y" ]]; then
  echo "Rebooting now..."
  sudo reboot
elif [[ "$answer" == "no" || "$answer" == "n" ]]; then
  echo "Reboot canceled."
else
  echo "Invalid input. Please enter yes or no."
fi
