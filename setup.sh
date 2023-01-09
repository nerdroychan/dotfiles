#!/bin/bash

DIR=$(cd `dirname $0` && pwd)
echo "Current directory:" $DIR

source config

function __git {
    ln -sf $DIR/gitignore_global $HOME/.gitignore_global
    git config --global core.excludesfile $HOME/.gitignore_global
}

function __vim {
    rm $HOME/.vim &>/dev/null
    ln -sf $DIR/vim $HOME/.vim
}

function __i3 {
    mkdir -p $HOME/.config/i3
    rm $HOME/.config/i3/* &>/dev/null
    ln -sf $DIR/i3/* $HOME/.config/i3/
}

function __tmux {
    ln -sf $DIR/tmux/tmux.conf $HOME/.tmux.conf
}

function __xorg {
    ln -sf $DIR/xinitrc $HOME/.xinitrc
    ln -sf $DIR/Xresources $HOME/.Xresources
    sudo -l -U $USER &> /dev/null || return
    sudo cp $DIR/xorg/* /etc/X11/xorg.conf.d/
}

function __bash {
    ln -sf $DIR/bash/bash_profile $HOME/.bash_profile
    ln -sf $DIR/bash/bashrc $HOME/.bashrc
}

function __fontconfig {
    mkdir -p $HOME/.config/fontconfig &>/dev/null
    rm $HOME/.config/fontconfig/* &>/dev/null
    ln -sf $DIR/fontconfig/* $HOME/.config/fontconfig/
}

function __modprobe {
    sudo -l -U $USER &> /dev/null || return
    sudo cp $DIR/modprobe/* /etc/modprobe.d/
}

function __udev {
    sudo -l -U $USER &> /dev/null || return
    sudo cp $DIR/udev/* /etc/udev/rules.d/
}

function __systemd {
    sudo -l -U $USER &> /dev/null || return
    sudo cp $DIR/systemd/* /etc/systemd/system/
    sudo systemctl enable suspend@chen
}

function __pacman {
    sudo -l -U $USER &> /dev/null || return
    sudo cp $DIR/pacman/pacman.conf /etc/pacman.conf
    sudo mkdir -p /etc/pacman/hooks
}

function __xsecurelock {
    ln -sf $DIR/misc/lock.sh $HOME/.lock.sh
    ln -sf $DIR/misc/lock.jpg $HOME/.lock.jpg
}

function __mpv {
    mkdir -p $HOME/.config/mpv
    rm $HOME/.config/mpv/* &>/dev/null
    ln -sf $DIR/mpv/* $HOME/.config/mpv/
}

function __firejail {
    mkdir -p $HOME/.config/firejail
    rm $HOME/.config/firejail/* &>/dev/null
    ln -sf $DIR/firejail/* $HOME/.config/firejail/
}

function __alacritty {
    mkdir -p $HOME/.config/alacritty
    rm $HOME/.config/alacritty/* &>/dev/null
    ln -sf $DIR/alacritty/*.yml $HOME/.config/alacritty/
}

function __pulseaudio {
    mkdir -p $HOME/.config/pulse
    ln -sf $DIR/pulse/default.pa $HOME/.config/pulse/default.pa
}

function __picom {
    ln -sf $DIR/picom/picom.conf $HOME/.config/picom.conf
}

function __polybar {
    mkdir -p $HOME/.config/polybar
    rm $HOME/.config/polybar/* &>/dev/null
    ln -sf $DIR/polybar/* $HOME/.config/polybar/
}

function __rofi {
    mkdir -p $HOME/.config/rofi
    rm $HOME/.config/rofi/* &>/dev/null
    ln -sf $DIR/rofi/* $HOME/.config/rofi/
}

function __misc {
    ln -sf $DIR/misc/open-display.sh $HOME/.open-display.sh
}

function __gtk {
    ln -sf $DIR/gtk/gtkrc-2.0 $HOME/.gtkrc-2.0
}

function __gnupg {
    mkdir -p $HOME/.gnupg
    rm $HOME/.gnupg/*.conf &> /dev/null
    ln -sf $DIR/gnupg/* $HOME/.gnupg/
}

for f in $(compgen -A function); do
    if [ "${f::2}" != "__" ]; then
        echo "skip invalid env:" $f
        continue
    fi
    F=`echo "$f" | tr '[:lower:]' '[:upper:]'`
    if [ "${!F}" == "y" ]; then
        echo "setup: "$f
        $f
    else
        echo "skip:  "$f
    fi
done
