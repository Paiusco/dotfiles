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
xrandr --output eDP-1 --mode 1920x1080 --pos 1920x0 --rotate normal --output DP-1 --off --output HDMI-1 --off --output DP-2 --off --output DP-3 --off --output HDMI-2 --off --output DP-1-0 --off --output DP-1-1 --off --output HDMI-1-0 --primary --mode 1920x1080 --pos 0x0 --rotate normal

#Some ways to set your wallpaper besides variety or nitrogen
feh --bg-fill /usr/share/backgrounds/arcolinux/wallpaper.jpg &

#start sxhkd to replace Qtile native key-bindings
run sxhkd -c ~/.config/qtile/sxhkd/sxhkdrc &

#starting utility applications at boot time
run nm-applet &
numlockx on &
blueberry-tray &
#picom --config $HOME/.config/qtile/scripts/picom.conf &

#starting user applications at boot time
run volumeicon &
