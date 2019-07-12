[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

xrandr --auto --dpi 144

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

copyq &

pactl set-card-profile 0 output:hdmi-stereo

exec i3 
