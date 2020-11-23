#!/bin/sh

env XSECURELOCK_PASSWORD_PROMPT=time_hex \
    XSECURELOCK_BLANK_DPMS_STATE=on \
    XSECURELOCK_COMPOSITE_OBSCURER=0 \
    XSECURELOCK_SAVER=saver_mpv \
    XSECURELOCK_IMAGE_DURATION_SECONDS=inf \
    XSECURELOCK_LIST_VIDEOS_COMMAND="echo ~/.wallpaper.jpg" \
    xsecurelock
