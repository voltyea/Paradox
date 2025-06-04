#!/bin/sh

sudo systemctl enable keyd --now

sudo mkdir -p /etc/keyd/
sudo cp ./default.conf /etc/keyd/
