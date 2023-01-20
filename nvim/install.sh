#!/bin/sh
set -e

mkdir -p ~/.config/nvim

ln -s ~/space/config-files/nvim/init.vim ~/.config/nvim/
ln -s ~/space/config-files/nvim/colors ~/.config/nvim/

cd ~
nvim +PlugInstall

echo "Installed the auto-neovim configuration successfully!"
