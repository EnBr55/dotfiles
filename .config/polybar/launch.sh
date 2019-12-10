#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bars
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar example >>/tmp/polybar.log 2>&1 &
#polybar bar2 >>/tmp/polybar2.log 2>&1 &

#if type "xrandr"; then
  #for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    #MONITOR=$m polybar --reload example &
  #done
#else
  #polybar --reload example &
#fi

echo "Bars launched..."
