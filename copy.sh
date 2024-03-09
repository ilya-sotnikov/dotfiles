#!/bin/sh

mkdir -p .config/nvim
mkdir -p .config/alacritty
mkdir -p .config/i3
mkdir -p .config/i3blocks
mkdir -p etc/X11/xorg.conf.d

cp -r ~/.config/nvim .config
cp ~/.xinitrc .
cp ~/.zprofile .
cp ~/.config/user-dirs.dirs .config
cp ~/.config/alacritty/alacritty.toml .config/alacritty
cp ~/.config/i3/config .config/i3
cp ~/.config/i3blocks/config .config/i3blocks
cp /etc/X11/xorg.conf.d/* etc/X11/xorg.conf.d
