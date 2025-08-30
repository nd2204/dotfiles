#!/bin/bash

# --- CPU Usage ---
# Get overall CPU usage (user + sys)
cpu_idle=$(top -l 1 | grep "CPU usage" | awk '{print $7}' | sed 's/%//')

read cpu_usage cpu_percent <<EOF
  $(echo "scale=4; u=(100-$cpu_idle)/100; print u; print \" \"; print u*100" | bc)
EOF

sketchybar --push $NAME.graph $cpu_usage
sketchybar --set $NAME.percentage label=$(printf "%.0f%%" "$cpu_percent")
