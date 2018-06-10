# bashcurses-monitor
Simple system monitor with bashsimplecurses

### Requirements
- bashsimplecurses (https://github.com/metal3d/bashsimplecurses)
- ansiweather (https://github.com/fcambus/ansiweather)
- taskwarrior (https://taskwarrior.org/)

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
  INTERFACE="wl3ps0"
```

To check the IP address you need to define the required interface in `scripts/ip.sh`
```
  # Network interface
  interface="wlp3s0"
```

### Todo

- [ ] Make the script more portable and system independent
- [ ] Define variables and paths in a config file and read them from the scripts

### License

The MIT License (MIT)

Copyright (c) 2018 Miroslav Vidović

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
