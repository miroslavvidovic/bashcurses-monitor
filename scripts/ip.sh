#!/usr/bin/env bash

# Network interface
interface="wlp3s0"

ip=$(ifconfig $interface | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1')

echo "$ip"

exit 0
