#!/bin/bash

FILE="$HOME/.config/hypr/hyprland.conf"
LINE='exec-once = $HOME/.config/hypr/wallpaper.sh'

# Escape for regex matching
ESCAPED_LINE=$(printf '%s\n' "$LINE" | sed 's/[.[\*^$/]/\\&/g')

# Uncomment the line (remove leading #)
sed -i "s|^#${ESCAPED_LINE}\$|$LINE|" "$FILE"
