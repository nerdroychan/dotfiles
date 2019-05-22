xrandr --dpi 192 --output DP-2 --primary

export GDK_SCALE=2
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

fcitx &
pasystray &
redshift-gtk -l 31:121 &

feh --bg-fill $HOME/wallpaper.jpg

exec i3
