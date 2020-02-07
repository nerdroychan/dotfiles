[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

# intel-media-driver and vaapi/vdpau
export LIBVA_DRIVER_NAME=radeonsi
export VDPAU_DRIVER=radeonsi

# disable DPMS and Xscreensaver
xset s off -dpms

# set mouse speed (maybe)
xset m 1 1

# mute sound
pamixer -m

# turn on num lock
numlockx

exec i3
