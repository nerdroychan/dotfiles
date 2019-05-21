#!/bin/sh

DIR=`pwd`
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

# imwheel
ln -sf $DIR/imwheelrc $HOME/.imwheelrc
