[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

# intel-media-driver and vaapi/vdpau
export LIBVA_DRIVER_NAME=iHD
export VDPAU_DRIVER=va_gl

exec i3 
