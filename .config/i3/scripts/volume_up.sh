#!/bin/sh

id=$(pactl list short | grep RUNNING | sed -e 's,^\([0-9][0-9]*\)[^0-9].*,\1,' | head -1)


pactl set-sink-volume $id +5%
