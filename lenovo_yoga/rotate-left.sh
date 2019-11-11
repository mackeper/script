#!/bin/sh

#portrait (left)

xrandr -o left
xinput set-prop "Wacom HID 50DC Finger" --type=float "Coordinate Transformation Matrix" 0 -1 1 1 0 0 0 0 1
xinput set-prop "SYNA2B2C:01 06CB:7F27 Touchpad" --type=float "Coordinate Transformation Matrix" 0 -1 1 1 0 0 0 0 1
xinput set-prop "Virtual core XTEST pointer" --type=float "Coordinate Transformation Matrix" 0 -1 1 1 0 0 0 0 1
