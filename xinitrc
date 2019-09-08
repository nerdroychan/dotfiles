[[ -f ~/.Xresources4k ]] && xrdb -merge -I$HOME ~/.Xresources4k

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

exec i3 
