#!/bin/bash

# Check for permissions
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root to install globally (or use sudo)."
    exit
fi

# Download the script
curl -o ~/Desktop/git-helper.sh https://raw.githubusercontent.com/3bube/git-helper/main/git-helper.sh

# Make it executable
chmod +x ~/Desktop/git-helper.sh

echo "git-helper installed successfully! You can now use it with 'git-helper \"Your commit message\"'."
