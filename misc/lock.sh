#!/bin/sh

env XSECURELOCK_PASSWORD_PROMPT=time_hex \
    XSECURELOCK_BLANK_DPMS_STATE=on \
    xsecurelock
