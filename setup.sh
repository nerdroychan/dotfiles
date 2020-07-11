#!/bin/sh

DIR=$(cd `dirname $0` && pwd)
echo "Current directory:" $DIR

# global .gitignore
ln -sf $DIR/gitignore_global $HOME/.gitignore_global
git config --global core.excludesfile $HOME/.gitignore_global

# vim
rm $HOME/.vim &>/dev/null
ln -sf $DIR/vim $HOME/.vim

# i3
mkdir -p $HOME/.config/i3
rm $HOME/.config/i3/* &>/dev/null
ln -sf $DIR/i3/* $HOME/.config/i3/

# tmux
ln -sf $DIR/tmux/tmux.conf $HOME/.tmux.conf

# xinit and xresources
ln -sf $DIR/xinitrc $HOME/.xinitrc
ln -sf $DIR/Xresources $HOME/.Xresources

# xkbmap
rm $HOME/.xkbmap &>/dev/null
ln -sf $DIR/xkbmap $HOME/.xkbmap

# zsh
ln -sf $DIR/zsh/zshrc $HOME/.zshrc
ln -sf $DIR/zsh/*.zsh-theme $HOME/.oh-my-zsh/custom/themes/

# fontconfig (arch)
mkdir -p $HOME/.config/fontconfig &>/dev/null
rm $HOME/.config/fontconfig/* &>/dev/null
ln -sf $DIR/fontconfig/* $HOME/.config/fontconfig/

# xorg (arch)
echo -n "Set xorg? (y/n) "
read ans
if [ "$ans" != "${ans#[Yy]}" ]; then
    sudo cp $DIR/xorg/* /etc/X11/xorg.conf.d/
fi

# modprobe (arch)
echo -n "Set modprobe? (y/n) "
read ans
if [ "$ans" != "${ans#[Yy]}" ]; then
    sudo cp $DIR/modprobe/* /etc/modprobe.d/
fi

# udev (arch)
echo -n "Set udev? (y/n) "
read ans
if [ "$ans" != "${ans#[Yy]}" ]; then
    sudo cp $DIR/udev/* /etc/udev/rules.d/
fi

# systemd (arch)
echo -n "Set systemd? (y/n) "
read ans
if [ "$ans" != "${ans#[Yy]}" ]; then
    sudo cp $DIR/systemd/* /etc/systemd/system/
fi

# pacman (arch)
echo -n "Set pacman? (y/n) "
read ans
if [ "$ans" != "${ans#[Yy]}" ]; then
    sudo cp $DIR/pacman/pacman.conf /etc/pacman.conf
fi

# scripts
ln -sf $DIR/misc/display-toggle.sh $HOME/.display-toggle.sh
ln -sf $DIR/misc/open-display.sh $HOME/.open-display.sh
ln -sf $DIR/misc/pulseaudio-toggle.sh $HOME/.pulseaudio-toggle.sh
ln -sf $DIR/misc/switch-fhd.sh $HOME/.switch-fhd.sh
ln -sf $DIR/misc/switch-uhd.sh $HOME/.switch-uhd.sh

# lock
ln -sf $DIR/misc/lock.sh $HOME/.lock.sh

# mpv
mkdir -p $HOME/.config/mpv
rm $HOME/.config/mpv/* &>/dev/null
ln -sf $DIR/mpv/* $HOME/.config/mpv/

# firejail
mkdir -p $HOME/.config/firejail
rm $HOME/.config/firejail/* &>/dev/null
ln -sf $DIR/firejail/* $HOME/.config/firejail/

# alacritty
mkdir -p $HOME/.config/alacritty
rm $HOME/.config/alacritty/* &>/dev/null
ln -sf $DIR/alacritty/*.yml $HOME/.config/alacritty/

# pulse
mkdir -p $HOME/.config/pulse
ln -sf $DIR/pulse/default.pa $HOME/.config/pulse/default.pa

# picom
ln -sf $DIR/picom/picom.conf $HOME/.config/picom.conf

# polybar
mkdir -p $HOME/.config/polybar
rm $HOME/.config/polybar/* &>/dev/null
ln -sf $DIR/polybar/* $HOME/.config/polybar/

# rofi
mkdir -p $HOME/.config/rofi
rm $HOME/.config/rofi/* &>/dev/null
ln -sf $DIR/rofi/* $HOME/.config/rofi/

# abcde
ln -sf $DIR/abcde/abcde.conf $HOME/.abcde.conf
