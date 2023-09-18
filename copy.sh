#!/bin/sh

mkdir -p .config/nvim
mkdir -p .config/clangd

cp -r ~/.config/nvim .config
cp -r ~/.config/clangd .config
cp ~/.zprofile .
