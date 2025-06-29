#!/bin/bash
current_dir=${PWD}
backups_dir="~/.config/backups"

rm -rf ${backups_dir}
mkdir -p ${backups_dir}

# ags conf
mv ~/.config/ags ${backups_dir}
ln -s ${current_dir}/config/ags ~/.config/ags

# hypr conf
mv ~/.config/hypr ${backups_dir}
ln -s ${current_dir}/config/hypr ~/.config/hypr

# alacritty conf
mv ~/.config/alacritty ${backups_dir}
ln -s ${current_dir}/config/alacritty ~/.config/alacritty

# tmux conf
mv ~/.tmux.conf ${backups_dir}
ln -s ${current_dir}/tmux.conf ~/.tmux.conf

# fcitx5
mkdir -p ~/.local/share/fcitx5/themes
cp -r ${current_dir}/local/share/fcitx5/themes/* ~/.local/share/fcitx5/themes

# ~/.bashrc
mv ~/.bashrc ${backups_dir}
cp bashrc ~/.bashrc

# ~/.condarc
cp condarc ~/.condarc

# gtk
cp -r ${current_dir}/config/gtk-3.0 ~/.config/gtk-3.0
cp ${current_dir}/gtkrc-2.0 ~/.gtkrc-2.0