#!/bin/bash

GAMEPAD_NAME="Wireless Controller"
EVENT=$(grep -i "$GAMEPAD_NAME" /proc/bus/input/devices -A4 | grep -o 'event[0-9]\+' | head -n1)

if [ -z "$EVENT" ]; then
  echo "Gamepad not found."
  exit 1
fi

DEVICE="/dev/input/$EVENT"
echo "Gamepad detected: $DEVICE"

sudo xboxdrv \
--evdev "$DEVICE" \
--evdev-keymap "BTN_SOUTH=a,BTN_EAST=b,BTN_TL=lb,BTN_THUMBR=tr,BTN_SELECT=back,BTN_START=start,BTN_THUMBL=tl,BTN_TR=rb,BTN_NORTH=y,BTN_WEST=x" \
--evdev-absmap "ABS_RZ=rt,ABS_RY=y2,ABS_RX=x2,ABS_Z=lt,ABS_Y=y1,ABS_X=x1,ABS_HAT0X=dpad_x,ABS_HAT0Y=dpad_y" \
--axismap "-y2=y2,-y1=y1" \
--mimic-xpad \
--silent
