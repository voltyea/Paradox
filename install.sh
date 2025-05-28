#!/usr/bin/bash

rfkill unblock wlan
rfkill unblock bluetooth

sudo pacman -Syu --needed my_packages

chsh $USER
