# bashcurses-monitor
Simple system monitor with bashsimplecurses

### Requirements
bashsimplecurses (https://github.com/metal3d/bashsimplecurses)
ansiweather (https://github.com/fcambus/ansiweather)
taskwarrior (https://taskwarrior.org/)

### How to run it
1. Download the bashsimplecurses library
2. Import the library in the monitor.sh script
```
  source ./bashsimplecurses/simple_curses.sh
```
<img src=http://i.imgur.com/NLPjOn6.png>

### Additional settings
To check the battery status you need to set the required path in `scripts/battery.sh`
```
  # Path to battery info
  battery_path=/sys/class/power_supply/BAT0
```

To check the WiFi signal strength you need to define the required interface in `scripts/wifi.sh`
```
  # Wifi Interface
  INTERFACE="wlo1"
```
