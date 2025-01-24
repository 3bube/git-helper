#!/bin/bash

# Ensure the script is run with sudo
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script with sudo."
  exit 1
fi

# Copy git-helper to /usr/local/bin
cp ./dist/git-helper /usr/local/bin/git-helper
chmod +x /usr/local/bin/git-helper

echo "Git Helper installed successfully! You can now use 'git-helper' globally."
