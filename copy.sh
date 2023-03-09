#!/bin/sh

mkdir -p .config/nvim
mkdir -p .config/Code/User
cp -r ~/.config/nvim .config
cp ~/.config/Code/User/settings.json .config/Code/User
code --list-extensions > .config/Code/User/extensions.txt
