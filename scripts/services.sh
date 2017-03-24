#!/usr/bin/env bash

# Services to check
services=(apache2.service mysql.service mongodb.service couchdb.service monit.service docker.service ssh.service)

# Separator line
separator(){
  printf '%40s\n' | tr ' ' -
}

# Check each function with builtin systemctl is-active and if a service
# is active print the status in green color. If a service is not active
# print the status in red.
check_service_status(){
  status=$(systemctl is-active $1)
  if [ "$status" == "active" ]; then
    output=$(echo $1 | cut -d "." -f1)
    echo "$output"
  fi
}

main(){
  for service in "${services[@]}"
  do
    check_service_status $service
  done
}

main

exit 0
