#!/bin/sh

mkdir -p .config/nvim
mkdir -p .config/emacs

cp -r ~/.config/nvim .config
cp ~/.config/emacs/init.el .config/emacs
