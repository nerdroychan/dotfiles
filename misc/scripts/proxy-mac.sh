#!/bin/sh

cmd=$1

case $cmd in
    lax)
        networksetup -setwebproxy Wi-Fi 127.0.0.1 6000
        networksetup -setsecurewebproxy Wi-Fi 127.0.0.1 6000
        ;;
    ord)
        networksetup -setwebproxy Wi-Fi 127.0.0.1 6001
        networksetup -setsecurewebproxy Wi-Fi 127.0.0.1 6001
        ;;
    mci)
        networksetup -setwebproxy Wi-Fi 127.0.0.1 6002
        networksetup -setsecurewebproxy Wi-Fi 127.0.0.1 6002
        ;;
    gfw)
        networksetup -setwebproxystate Wi-Fi off
        networksetup -setsecurewebproxystate Wi-Fi off
        ;;
    *)
        echo "lax: Los Angeles"
        echo "ord: Chicago"
        echo "mci: Kansas City"
        echo "gfw: China"
       ;;
esac
echo "- Current"
networksetup -getwebproxy Wi-Fi
networksetup -getsecurewebproxy Wi-Fi
 
