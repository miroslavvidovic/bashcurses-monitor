#!/usr/bin/env bash

# Path to battery info
battery_path=/sys/class/power_supply/BAT0

# Check for a directory on the battery_path
check_battery_path() {
  if [ ! -d "$battery_path" ]; then
    local path_status=0
  else
    local path_status=1
  fi
  echo "$path_status"
}

# Check if the charger is connected
charger_connected() {
  local battery_state=$(cat $battery_path/status)
  if [ "$battery_state" == 'Discharging' ]; then
    local batt_conected=0
  else
    local batt_connected=1
  fi
  echo "$batt_connected"
}

# Read the battery percentage
battery_charge() {
  local battery_full=$battery_path/charge_full
  local battery_current=$battery_path/charge_now
  local now=$(cat $battery_current)
  local full=$(cat $battery_full)
  local batt_percentage=$((100 * now / full))
  echo "$batt_percentage"
}

main() {
  path_status=$(check_battery_path)
  # If there is a directory on the defined path
  if [[ $path_status -eq 1 ]]; then
    charging=$(charger_connected)
    batt_percentage=$(battery_charge)
    # If charger is connected
    if ((charging)); then
      graph="⚡"
    else
      graph="|"
    fi
    # Print the battery status
    echo "[$batt_percentage%] $graph"
  else
    echo "No info"
  fi
}

main

exit 0
