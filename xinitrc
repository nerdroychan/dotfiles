xrandr --output eDP1 --auto --dpi 144

export QT_AUTO_SCREEN_SCALE_FACTOR=1

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

fcitx &
pasystray &
redshift-gtk -l 31:121 &
numlockx &
copyq &

$HOME/.pulseaudio-toggle.sh d

exec i3 
