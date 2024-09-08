#!/bin/bash

# get packages info which contains nerd-fonts
sudo pacman -Ss font | grep nerd-fonts | while IFS= read -r line; do
    # get package name
    package_name=$(echo "$line" | awk '{print $1}' | sed 's/.*\///')
    echo "installing $package_name ..."
    # install
    sudo pacman -S --noconfirm "$package_name"
done

# install ttf-jetbrains-mono-nerd adobe-source-han-sans-cn-fonts adobe-source-code-pro-fonts
sudo pacman -S --noconfirm adobe-source-han-sans-cn-fonts adobe-source-code-pro-fonts
