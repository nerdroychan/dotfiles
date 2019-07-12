export GDK_SCALE=2
export GDK_DPI_SCALE=1
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export QT_SCREEN_SCALE_FACTORS=2

export QT_AUTO_SCREEN_SCALE_FACTOR=1
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

fcitx &
pasystray &
redshift-gtk -l 31:121 &
numlockx &
copyq &

pactl set-card-profile 0 output:hdmi-stereo

exec i3 
