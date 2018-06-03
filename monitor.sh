#!/usr/bin/env bash

# -----------------------------------------------------------------------------
# Info:
#   author:    Miroslav Vidovic
#   file:      monitor.sh
#   created:   23.03.2017.-16:03:09
#   revision:  03.06.2018.
#   version:   1.1
# -----------------------------------------------------------------------------
# Requirements:
#   bashsimplecurses(https://github.com/metal3d/bashsimplecurses)
#   ansiweather (https://github.com/fcambus/ansiweather)
# Description:
#   System monitor with bashsimplecurses library.
# Usage:
#   bash monitor.sh
# -----------------------------------------------------------------------------
# Script:

# Simple curses library
source ./bashsimplecurses/simple_curses.sh

main(){
  window "$(echo $USER)@$(hostname)" "blue" "22%"
    append "Kernel: $(uname -r)"
    addsep
    append "Uptime: $(uptime | cut -d " " -f 4,5 | tr -d ,)"
  endwin

  window "Network" "yellow" "23%"
    append "IP: $(scripts/ip.sh)"
    append "Wifi: $(scripts/wifi.sh)"
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

  window "Python" "green" "11%"
    append "$(python3 --version | cut -d" " -f2)"
  endwin

  col_right
  window "PHP" "blue" "11%"
    append "$(php --version | awk -F'-' 'NR==1{print $1}' | cut -d" " -f2)"
  endwin

  col_right
  window "Java" "yellow" "11%"
    append "$(java -version 2>&1 | awk 'NR==1{print $3}' | tr -d "\"")"
  endwin

  col_right
  move_up

  window "Last kernel messages" "blue" "44%"
    dmesg | tail -n 14 > /tmp/dmesg.txt
    append_file /tmp/dmesg.txt
    rm -f /tmp/dmesg.txt
  endwin

  window "Weather" "blue" "44%"
    append "$(ansiweather -l Zvornik,BA -a false)"
  endwin

  window "Taskwarrior" "green" "44%"
    append "Active: $(task status:pending count) Completed: $(task status:completed count)"
  endwin

  window "Files" "yellow" "44%"
    append "Downloads: $(ls -l ~/Downloads | wc -l) Trash: $(scripts/trash.sh)"
  endwin

  window "Haskell" "green" "11%"
    append "$(ghc --version | awk '{print $NF}')"
  endwin

  col_right

  window "GCC" "green" "11%"
    append "$(gcc --version | awk 'NR==1{print $4}')"
  endwin

  col_right

  window "Perl" "blue" "11%"
    append "$(perl -v | awk 'NR==2{print $9}' | tr -d "\(v" | tr -d "\)")"
  endwin

  col_right

  window "Bash" "blue" "11%"
    append "$(echo $BASH_VERSION | cut -d"-" -f1)"
  endwin
}

main_loop 5

exit 0
