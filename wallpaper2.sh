#!/bin/bash

FILE="$HOME/.local/share/chezmoi/dot_config/hypr/hyprland.conf"
LINE='exec-once = $HOME/.config/hypr/wallpaper.sh'

# Escape regex special characters (minimal here since no '.', '*', etc.)
ESCAPED_LINE=$(printf '%s\n' "$LINE" | sed 's/[.[\*^$/]/\\&/g')

# Use sed to replace the line with a commented-out version
sed -i "s|^$ESCAPED_LINE\$|#${LINE}|" "$FILE"

FILE2="$HOME/.config/hypr/hyprland.conf"

# Escape regex special characters (minimal here since no '.', '*', etc.)
ESCAPED_LINE=$(printf '%s\n' "$LINE" | sed 's/[.[\*^$/]/\\&/g')

# Use sed to replace the line with a commented-out version
sed -i "s|^$ESCAPED_LINE\$|#${LINE}|" "$FILE2"

chezmoi apply
