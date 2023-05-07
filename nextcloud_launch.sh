#!/bin/bash
#

killall -p nextcloud

sleep 10
nextcloud --background & disown
