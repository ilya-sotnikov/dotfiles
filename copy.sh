#!/bin/sh

mkdir -p .config/nvim
mkdir -p .config/Code/User
cp ~/.config/nvim/init.vim .config/nvim/init.vim
cp ~/.config/Code/User/settings.json .config/Code/User
code --list-extensions > .config/Code/User/extensions.txt
