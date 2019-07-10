xrandr --dpi 192 --output DP1 --primary

export GDK_SCALE=2
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

fcitx &
pulseaudio --start &
pasystray &
redshift-gtk -l 31:121 &
numlockx &

feh --bg-fill $HOME/.wallpaper.jpg

exec i3
