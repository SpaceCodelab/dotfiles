#!/bin/sh

# Make Wayland environment available to D-Bus
dbus-update-activation-environment --all

# Start GNOME Keyring secret service
gnome-keyring-daemon --start --components=secrets &

# Start dwl first, with the status bar pipe
status() {
  while true; do
    cpu=$(top -bn1 | awk '/Cpu\(s\)/ {printf "%.0f%%", 100 - $8}')
    ram=$(free -h | awk '/Mem:/ {print $3 "/" $2}')
    bat=$(cat /sys/class/power_supply/BAT1/capacity 2>/dev/null || echo "?")
    vol=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ 2>/dev/null | awk '{printf "%d%%", $2 * 100}')
    date=$(date '+%a %d %b | %H:%M')

    printf 'CPU %s | RAM %s | VOL %s | BAT %s%% | %s\n' \
      "$cpu" "$ram" "$vol" "$bat" "$date"

    sleep 1
  done
}

status | dwl &
DWL_PID=$!

# Give dwl a moment to create the Wayland socket
# sleep 0.3
#
# wait till wayland socket creates a connection
while ! ls "$XDG_RUNTIME_DIR"/wayland-* >/dev//null 2>&1; do
  sleep 0.01
done

# Start wallpaper after dwl is running
swaybg -i "$HOME/Downloads/wallpaper.jpg" -m fill &

# Wait for dwl to exit
wait "$DWL_PID"
