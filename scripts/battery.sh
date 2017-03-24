#!/usr/bin/env bash

battery_path=/sys/class/power_supply/BAT0

battery_charge() {
  battery_state=$(cat $battery_path/status)
  battery_full=$battery_path/charge_full
  battery_current=$battery_path/charge_now
  if [ "$battery_state" == 'Discharging' ]; then
    BATT_CONNECTED=0
  else
    BATT_CONNECTED=1
  fi
  now=$(cat $battery_current)
  full=$(cat $battery_full)
  BATT_PCT=$((100 * now / full))
}

print_status() {
# Print the battery status
  # If charger connected
  if ((BATT_CONNECTED)); then
    GRAPH="⚡"
  else
    GRAPH="|"
  fi

  echo "[$BATT_PCT%] $GRAPH"
}

battery_charge
print_status

exit 0
