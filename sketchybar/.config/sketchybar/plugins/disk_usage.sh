#!/bin/bash

# --- Disk Usage ---
# Use root (/) partition as main disk usage
disk_usage=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')
disk_usage_norm=$(echo "scale=4; $disk_usage / 100" | bc)
