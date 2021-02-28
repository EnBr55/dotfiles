#!/usr/bin/env bash

if pgrep -x polybar
then
  pkill polybar
else
  bash ~/.config/polybar/launch.sh
fi
