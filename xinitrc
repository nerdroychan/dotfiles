xrandr --dpi 192 --output DP-2 --primary

export GDK_SCALE=2

fcitx &
imwheel &
pasystray &
redshift-gtk -l 31:121 &

feh --bg-fill $HOME/wallpaper.jpg

exec i3
