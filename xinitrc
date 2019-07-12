[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

pactl set-card-profile 0 output:hdmi-stereo

exec i3 
