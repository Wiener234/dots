#!/bin/bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit


#polybar placeholder -c ~/.config/polybar/wiener016.ini | tee -a /tmp/polybar.log & disown
polybar base -c ~/.config/polybar/nord.ini | tee -a /tmp/polybar.log & disown
# polybar workspaces -c ~/.config/polybar/pastel.ini | tee -a /tmp/polybar.log & disown
# polybar tray -c ~/.config/polybar/pastel.ini | tee -a /tmp/polybar.log & disown


#polybar placeholder2 -c ~/.config/polybar/wiener016.ini | tee -a /tmp/polybar.log & disown
polybar base2 -c ~/.config/polybar/nord.ini | tee -a /tmp/polybar.log & disown
# polybar tray2 -c ~/.config/polybar/pastel.ini | tee -a /tmp/polybar.log & disown
echo "Polybar launched..."
