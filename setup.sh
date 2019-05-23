#!/bin/sh

DIR=$(cd `dirname $0` && pwd)
echo "Current directory:" $DIR

# vim
rm $HOME/.vim
ln -sf $DIR/vim $HOME/.vim

mkdir -p $HOME/.config/i3
rm $HOME/.config/i3/*
ln -sf $DIR/i3/* $HOME/.config/i3

# kitty
mkdir -p $HOME/.config/kitty
rm $HOME/.config/kitty/*
ln -sf $DIR/kitty/*.conf $HOME/.config/kitty

# tmux
ln -sf $DIR/tmux/tmux.conf $HOME/.tmux.conf

# xinitrc
ln -sf $DIR/xinitrc $HOME/.xinitrc

# xkbmap
rm $HOME/.xkbmap
ln -sf $DIR/xkbmap $HOME/.xkbmap

# zsh
ln -sf $DIR/zsh/zshrc $HOME/.zshrc
