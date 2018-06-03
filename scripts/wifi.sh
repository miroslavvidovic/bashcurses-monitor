# Wifi Interface
INTERFACE="wlo1"

get_signal(){
  if [ $(ifconfig "$INTERFACE" | grep UP | wc -l) -eq 1 ]; then
    link_quality="$(iwconfig $INTERFACE | grep Quality | cut -d'=' -f2 | cut -d' ' -f1 | cut -d'/' -f1)"
    link_name="$(iwconfig $INTERFACE | grep ESSID | cut -d':' -f2)"

    SIGNAL_QUALITY=$(($link_quality * 100 / 70))

    echo "[$SIGNAL_QUALITY%] on $link_name"
  else 
    echo "No info."
  fi
}

get_signal

exit 0
