if [ "$QHD" -eq "1" ]
then
    [[ -f ~/.Xresources4k ]] && xrdb -merge -I$HOME ~/.Xresources4k
else
    [[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
fi

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

exec i3 
