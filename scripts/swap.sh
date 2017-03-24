#!/bin/sh


free -m | awk 'NR==3{printf "%s/%sMB (%.2f%%)\n", $3,$2,$3*100/$2}'
