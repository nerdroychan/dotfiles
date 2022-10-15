#!/bin/sh

# with tray icons
fcitx5 &
flameshot &

# headless, assuming they won't crash..
redshift -t 6500:5000 -l 41.88:-87.62 &
picom -CGb &
parcellite -n &

# The access to xdg user directories should be rare..
function monitor_xdg_dirs {
    LOGFILE=/tmp/inotifywait-$USER.log

    killall -w -u inotifywait

    if ! [ -x "$(command -v inotifywatch)" ]; then
        i3-nagbar -m 'Please install inotify-tools' -t warning &> /dev/null
    fi

    touch $LOGFILE
    inotifywait -m -o $LOGFILE \
                --timefmt '%c' \
                --format '%T [%e]: %w %f' \
                -e open,modify,delete \
                -r \
                $HOME/Archives \
                $HOME/Desktop \
                $HOME/Documents \
                $HOME/Downloads \
                $HOME/Music \
                $HOME/Pictures \
                $HOME/Public \
                $HOME/Templates \
                $HOME/Videos
}
monitor_xdg_dirs &

exit 0
