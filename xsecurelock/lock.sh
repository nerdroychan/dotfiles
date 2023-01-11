#!/bin/sh

env XSECURELOCK_PASSWORD_PROMPT=time_hex \
    XSECURELOCK_BLANK_TIMEOUT=-1 \
    XSECURELOCK_NO_COMPOSITE=1 \
    XSECURELOCK_SAVER=saver_mpv \
    XSECURELOCK_IMAGE_DURATION_SECONDS=inf \
    XSECURELOCK_LIST_VIDEOS_COMMAND="echo ~/.lock.jpg" \
    xsecurelock