#!/bin/sh

#landscape (normal)

xrandr -o normal
xinput set-prop "Wacom HID 50DC Finger" --type=float "Coordinate Transformation Matrix" 0 0 0 0 0 0 0 0 0
xinput set-prop "SYNA2B2C:01 06CB:7F27 Touchpad" --type=float "Coordinate Transformation Matrix" 0 0 0 0 0 0 0 0 0
xinput set-prop "Wacom HID 50DC Pen" --type=float "Coordinate Transformation Matrix" 0 0 0 0 0 0 0 0 0
