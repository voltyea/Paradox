#!/bin/bash

sudo mkdir -p /opt/spotify
sudo mkdir -p /opt/spotify/Apps

sudo chmod a+wr /opt/spotify
sudo chmod a+wr /opt/spotify/Apps -R

curl -fsSL https://raw.githubusercontent.com/spicetify/cli/main/install.sh | sh
