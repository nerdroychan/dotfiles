xrdb -merge $HOME/.Xresources
xrdb -merge $HOME/.config/polybar/default.xresources

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

export LIBVA_DRIVER_NAME=iHD
export VDPAU_DRIVER=va_gl

# disable DPMS and Xscreensaver
xset s off -dpms

# set mouse speed (maybe)
xset m 1 1

# mute sound
pamixer -m

# turn on num lock
numlockx

exec i3
