#!/bin/bash

sudo systemctl enable keyd --now

sudo mkdir -p /etc/keyd/
sudo cp ./default.conf /etc/keyd/

sudo usermod -aG keyd $USER
sudo usermod -aG input $USER
