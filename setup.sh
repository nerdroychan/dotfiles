#!/bin/sh

DIR=$(cd `dirname $0` && pwd)
echo "Current directory:" $DIR

# global .gitignore
ln -sf "$DIR"/gitignore_global "$HOME"/.gitignore_global
git config --global core.excludesfile "$HOME"/.gitignore_global

# vim
rm "$HOME"/.vim
ln -sf "$DIR"/vim "$HOME"/.vim

# i3
mkdir -p "$HOME"/.config/i3
rm "$HOME"/.config/i3/*
ln -sf "$DIR"/i3/* "$HOME"/.config/i3/

# kitty
mkdir -p "$HOME"/.config/kitty
rm "$HOME"/.config/kitty/*
ln -sf "$DIR"/kitty/*.conf "$HOME"/.config/kitty/

# alacritty
mkdir -p "$HOME"/.config/alacritty
rm "$HOME"/.config/alacritty/*
ln -sf "$DIR"/alacritty/*.yml "$HOME"/.config/alacritty/

# tmux
ln -sf "$DIR"/tmux/tmux.conf "$HOME"/.tmux.conf

# xorg
ln -sf "$DIR"/xinitrc "$HOME"/.xinitrc
ln -sf "$DIR"/Xresources "$HOME"/.Xresources
ln -sf "$DIR"/Xresources-uhd "$HOME"/.Xresources-uhd

# xkbmap
rm "$HOME"/.xkbmap
ln -sf "$DIR"/xkbmap "$HOME"/.xkbmap

# zsh
ln -sf "$DIR"/zsh/zshrc "$HOME"/.zshrc

# fontconfig (arch)
echo -n "Set fontconfigs? (y/n) "
read ans
if [ "$ans" != "${ans#[Yy]}" ]; then
    sudo rm /etc/fonts/conf.avail/64-language-selector-prefer.conf &>/dev/null
    sudo cp "$DIR"/fontconfig/64-language-selector-prefer.conf /etc/fonts/conf.avail/
    sudo ln -sf /etc/fonts/conf.avail/64-language-selector-prefer.conf /etc/fonts/conf.d/64-language-selector-prefer.conf
fi

# xorg (arch)
echo -n "Set xorg? (y/n) "
read ans
if [ "$ans" != "${ans#[Yy]}" ]; then
    sudo cp "$DIR"/xorg/* /etc/X11/xorg.conf.d/
fi

# display toggle
ln -sf "$DIR"/misc/display-toggle.sh "$HOME"/.display-toggle.sh
ln -sf "$DIR"/misc/open-display.sh "$HOME"/.open-display.sh

