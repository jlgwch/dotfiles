#!/bin/bash

config_source_dir=${PWD}/config
config_target_dir=${HOME}/.config

items=(
    hypr
    alacritty
    chrome-flags.conf
    code-flags.conf
    electron-flags.conf
    qq-flags.conf
    spotify-launcher.conf
)

for item in "${items[@]}"; do
    src="$config_source_dir/$item"
    dst="$config_target_dir/$item"

    echo "ln -sf" $src $dst

    rm -rf $dst
    ln -sf $src $dst
done

items=(
    bash_profile
    bashrc
    vimrc
    condarc
    gitconfig
    tmux.conf
)

for item in "${items[@]}"; do
    src="$PWD/$item"
    dst="$HOME/.$item"

    echo "ln -sf" $src $dst

    rm -rf $dst
    ln -sf $src $dst
done

rm -rf $HOME/.local/share/fcitx5/themes/Dracula
ln -sf $PWD/local/share/fcitx5/themes/Dracula $HOME/.local/share/fcitx5/themes/Dracula

rm -rf $HOME/.local/share/icons
ln -sf $PWD/local/share/icons $HOME/.local/share/icons