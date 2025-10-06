#!/usr/bin/env bash

echo "Setting symlinks"

# check if .config is created

ln -sfv ~/.dotfiles/alacritty ~/.config
ln -sfv ~/.dotfiles/nvim ~/.config
ln -sfv ~/.dotfiles/karabiner ~/.config
ln -sfv ~/.dotfiles/tmux ~/.config

ln -sfv ~/.dotfiles/.zshrc ~
ln -sfv ~/.dotfiles/.gitconfig ~
ln -sfv ~/.dotfiles/.Brewfile ~

ln -sfv ~/.dotfiles/wallpaper ~/Pictures
