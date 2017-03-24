#!/bin/bash

 sensors | grep 'temp1' | awk {'print $2'} | grep -v 'N/A'
