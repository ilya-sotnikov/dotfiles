#!/bin/sh

mkdir -p .config/nvim
mkdir -p .config/clangd
mkdir -p build/dwm
mkdir -p .local/bin
mkdir -p .config/alacritty


cp -r ~/.config/nvim .config
cp -r ~/.config/clangd .config
cp ~/.xinitrc .
cp ~/.zprofile .
cp ~/build/dwm/config.h build/dwm
cp ~/.local/bin/* .local/bin
cp ~/.config/user-dirs.dirs .config
cp ~/.config/alacritty/alacritty.yml .config/alacritty
