export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"

xrandr --dpi 192 --output DP-2 --primary

export GDK_SCALE=2

fcitx &
redshift-gtk -l 31:121 &
pasystray & 

feh --bg-fill /home/chen/Wallpapers/1.jpg
exec i3
