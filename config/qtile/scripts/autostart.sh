#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

#Set your native resolution IF it does not exist in xrandr
#More info in the script
#run $HOME/.config/qtile/scripts/set-screen-resolution-in-virtualbox.sh

#Find out your monitor name with xrandr or arandr (save and you get this line)
xrandr --output DP-0 --off --output DP-1 --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-0 --primary --mode 1920x1080 --pos 1920x0 --rotate normal --output eDP-1-1 --off --output DP-1-1 --off --output HDMI-1-1 --off --output DP-1-2 --off --output DP-1-3 --off --output HDMI-1-2 --off

#change your keyboard if you need it
setxkbmap -layout us -variant intl

#autostart ArcoLinux Welcome App
run dex $HOME/.config/autostart/arcolinux-welcome-app.desktop &

#Some ways to set your wallpaper besides variety or nitrogen
feh --bg-fill /usr/share/backgrounds/arcolinux/arco-wallpaper.jpg &

#start sxhkd to replace Qtile native key-bindings
run sxhkd -c ~/.config/qtile/sxhkd/sxhkdrc &

#starting utility applications at boot time
run nm-applet &
numlockx on &
blueberry-tray &
picom --config $HOME/.config/qtile/scripts/picom.conf &

#starting user applications at boot time
run volumeicon &
