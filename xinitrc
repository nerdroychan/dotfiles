[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

# intel-media-driver and vaapi
export LIBVA_DRIVER_NAME=iHD

exec i3 
