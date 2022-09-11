#!/bin/sh

case $1 in
  screen) grim - | wl-copy;;
  region) grim -g "$(slurp)" - | wl-copy ;;
  window) grim -g "$(
    swaymsg -t get_tree | jq -r '.. | select(.pid? and .visible?) | .rect | "\(.x),\(.y) \(.width)x\(.height)"' | slurp
  )" - | wl-copy;;
esac
