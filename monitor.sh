#!/usr/bin/env bash

# -----------------------------------------------------------------------------
# Info:
#   author:    Miroslav Vidovic
#   file:      monitor.sh
#   created:   23.03.2017.-16:03:09
#   revision:  ---
#   version:   1.0
# -----------------------------------------------------------------------------
# Requirements: ---
# 
# Description:
# 
# Usage:
# 
# -----------------------------------------------------------------------------
# Script:

# Simple curses library
source ./bashsimplecurses/simple_curses.sh

main(){
  window "$(echo $USER)@$(hostname)" "blue" "23%"
    append "Kernel: $(uname -r)"
    addsep
    append "Uptime: $(uptime | cut -d " " -f 4,5 | tr -d ,)"
  endwin

  window "Network" "yellow" "23%"
    append "IP: $(scripts/ip.sh wlo1)"
    append "Wifi: $(scripts/wifi.sh wlo1)"
  endwin 

  window "Battery" "magenta" "23%"
    append "$(scripts/battery.sh)"
  endwin

  window "CPU" "green" "23%"
    append "$(scripts/cpu.sh)"
  endwin

  window "Filesystem" "red" "23%"
    append "Storage: $(scripts/filesystem.sh)"
  endwin

  window "RAM" "red" "23%"
    append "$(scripts/ram-memory.sh)"
  endwin

  window "Swap" "cyan" "23%"
    append "$(scripts/swap.sh)"
  endwin

  col_right 
  move_up

  window "Processes top20" "grey" "33%"
    for i in `seq 2 21`; do
      append_tabbed "`ps ax -o pid,rss,pcpu,ucmd --sort=-cpu,-rss | sed -n "$i,$i p" | awk '{printf "%s: %sM:  %s%%" , $4, $2/1024, $3 }'`" 3
    done
  endwin

  window "Temperature" "blue" "33%"
    append "$(scripts/temperature.sh)"
  endwin

  window "Active services" "gray" "33%"
    append "$(scripts/services.sh)"
  endwin

  col_right 
  move_up

  window "Last kernel messages" "blue" "43%"
    dmesg | tail -n 12 > /tmp/dmesg.txt
    append_file /tmp/dmesg.txt
    rm -f /tmp/dmesg.txt
  endwin

  window "Weather" "blue" "43%"
    append "$(ansiweather -l Zvornik,BA -a false)"
  endwin

  window "Trash" "green" "12%"
    append "$(scripts/trash.sh)"
  endwin

  col_right

  window "Taskwarrior" "blue" "22%"
    append "Active: $(task status:pending count)"
    append "Completed: $(task status:completed count)"
  endwin

  col_right 

  window "Downloads" "yellow" "10%"
    append "$(ls -l ~/Downloads | wc -l)"
  endwin

}

main_loop 5

exit 0
