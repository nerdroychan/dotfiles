xrdb -merge $HOME/.Xresources
xrdb -merge $HOME/.config/polybar/default.xresources

export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx5
export XMODIFIERS=@im=fcitx5

# intel-media-driver and vaapi/vdpau
export LIBVA_DRIVER_NAME=iHD
export VDPAU_DRIVER=va_gl

# disable DRI3
export LIBGL_DRI3_DISABLE=1

# disable DPMS and Xscreensaver
xset s off -dpms

# set mouse speed (maybe)
xset m 1 1

# mute sound
pamixer -m

# turn on num lock
numlockx

exec i3
