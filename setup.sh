#!/bin/bash

DIR=$(cd `dirname $0` && pwd)

if [ "$DIR" != "$HOME/.dotfiles" ]; then
    echo "The dotfiles directory must be $HOME/.dotfiles to run the setup script"
    exit 1
fi

# the default is linux-based distro, and macos is the outlier
OS=linux
if [[ "$OSTYPE" == 'darwin'* ]]; then
    OS=macos
fi

mkdir -p $HOME/.config &> /dev/null

SUDO="sudo -l -U $USER &> /dev/null || return"

function simple_link {
    name=$1
    rm -rf $HOME/.config/$1 &> /dev/null
    ln -s $DIR/$1 $HOME/.config/$1
}

# if the config resides in $HOME/.config, create a symlink for the whole dir
# otherwise, only link necessary files to avoid extra files getting tracked

function __git {
    ln -sf $DIR/git/gitignore_global $HOME/.gitignore_global
    git config --global core.excludesfile $HOME/.gitignore_global
    git config --global user.name "Chen Chen"
    git config --global user.email "mail@roychan.org"
    git config --global user.signkey "E6F1F8B1C9E2624D"
    git config --global commit.gpgsign "true"
}

function __vim {
    mkdir -p $HOME/.vim &> /dev/null
    ln -sf $DIR/vim/vimrc $HOME/.vim/vimrc
    rm -rf $HOME/.vim/syntax
    ln -sf $DIR/vim/syntax $HOME/.vim/syntax
}

function __nvim {
    simple_link nvim
}

function __i3 {
    simple_link i3
}

function __tmux {
    ln -sf $DIR/tmux/tmux.conf $HOME/.tmux.conf
}

function __x11 {
    ln -sf $DIR/x11/xinitrc $HOME/.xinitrc
    ln -sf $DIR/x11/Xresources $HOME/.Xresources
    ln -sf $DIR/x11/user-dirs.dirs $HOME/.config/user-dirs.dirs
    eval $SUDO
    sudo cp $DIR/x11/xorg.conf.d/*.conf /etc/X11/xorg.conf.d/
}

function __bash {
    ln -sf $DIR/bash/profile $HOME/.bash_profile
    ln -sf $DIR/bash/rc $HOME/.bashrc
}

function __fontconfig {
    simple_link fontconfig
}

function __modprobe {
    eval $SUDO
    sudo cp $DIR/modprobe/* /etc/modprobe.d/
}

function __pacman {
    eval $SUDO
    sudo cp $DIR/pacman/pacman.conf /etc/pacman.conf
    sudo cp $DIR/pacman/gnupg/gpg.conf /etc/pacman.d/gnupg/gpg.conf
}

function __xsecurelock {
    ln -sf $DIR/xsecurelock/lock.sh $HOME/.lock.sh
}

function __alacritty {
    simple_link alacritty
}

function __picom {
    simple_link picom
}

function __polybar {
    simple_link polybar
}

function __rofi {
    simple_link rofi
}

function __gtk {
    ln -sf $DIR/gtk/gtk-2.0/gtkrc-2.0 $HOME/.gtkrc-2.0
    mkdir -p $HOME/.config/gtk-3.0 &> /dev/null
    mkdir -p $HOME/.config/gtk-4.0 &> /dev/null
    ln -sf $DIR/gtk/gtk-3.0/settings.ini $HOME/.config/gtk-3.0/
    ln -sf $DIR/gtk/gtk-4.0/settings.ini $HOME/.config/gtk-4.0/
}

function __gnupg {
    mkdir -p $HOME/.gnupg &> /dev/null
    chmod 700 $HOME/.gnupg
    rm $HOME/.gnupg/*.conf &> /dev/null
    ln -sf $DIR/gnupg/gpg.conf $HOME/.gnupg/gpg.conf
    if [ "$OS" == "macos" ]; then
        ln -sf $DIR/gnupg/gpg-agent.conf.darwin $HOME/.gnupg/gpg-agent.conf
    else
        ln -sf $DIR/gnupg/gpg-agent.conf.linux $HOME/.gnupg/gpg-agent.conf
    fi
}

function __gdb {
    rm -f $HOME/.gdb-dashboard
    rm -f $HOME/.gdbinit
    git submodule update gdb/gdb-dashboard
    ln -sf $DIR/gdb/gdbinit $HOME/.gdbinit
    ln -sf $DIR/gdb/gdb-dashboard/.gdbinit $HOME/.gdb-dashboard
}

function __htop {
    simple_link htop
}

source config

for f in $(compgen -A function); do
    if [ "${f::2}" != "__" ]; then
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
