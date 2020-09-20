#!/bin/sh

# ==============================================================================
# GROCTEL'S TOUCHPAD TOGGLER FOR I3WM
# ------------------------------------------------------------------------------
# Check's whether the touchpad is accepting user input and changes its value to
# the opposite.
# This script is designed to be run from an keysym.
# ==============================================================================

status=$(synclient | grep TapButton1 | awk '{print $3;}')

if [ "$status" -eq 1 ]; then
	synclient TapButton1=0;
else
	synclient TapButton1=1;
fi
