#!/bin/bash

# Function to compare semantic versions
# Returns 0 if v1 > v2, 1 otherwise
version_gt() {
  [ "$(printf '%s\n%s\n' "$1" "$2" | sort -V | head -n1)" != "$1" ]
}

# Read GitHub version (use raw URL, NOT the GitHub HTML URL)
github_version=$(curl -s https://raw.githubusercontent.com/voltyea/dotfiles/main/VERSION.txt)

local_version=""
# Read local version (fall back to empty string if missing)
if [[ -f "$HOME/.config/VERSION.txt" ]]; then
  local_version=$(cat "$HOME/.config/VERSION.txt")
fi

# Compare versions and clone if GitHub version is newer
if version_gt "$github_version" "$local_version"; then
  git clone https://github.com/voltyea/dotfiles.git /tmp/dotfiles
fi
