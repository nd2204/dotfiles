#!/bin/bash

pagesize=$(pagesize)
vm_stat_output=$(vm_stat)

free=$(echo "$vm_stat_output"       | awk '/Pages free/ {print $3}' | sed 's/\.//')
active=$(echo "$vm_stat_output"     | awk '/Pages active/ {print $3}' | sed 's/\.//')
inactive=$(echo "$vm_stat_output"   | awk '/Pages inactive/ {print $3}' | sed 's/\.//')
speculative=$(echo "$vm_stat_output"| awk '/Pages speculative/ {print $3}' | sed 's/\.//')
wired=$(echo "$vm_stat_output"      | awk '/Pages wired down/ {print $3}' | sed 's/\.//')
purgeable=$(echo "$vm_stat_output"  | awk '/Pages purgeable/ {print $3}' | sed 's/\.//')
compressed=$(echo "$vm_stat_output" | awk '/Pages occupied by compressor/ {print $5}' | sed 's/\.//')

# Convert to MB
free_mb=$(( (free + speculative) * pagesize / 1024 / 1024 ))
inactive_mb=$(( inactive * pagesize / 1024 / 1024 ))
purgeable_mb=$(( purgeable * pagesize / 1024 / 1024 ))
active_mb=$(( active * pagesize / 1024 / 1024 ))
wired_mb=$(( wired * pagesize / 1024 / 1024 ))
compressed_mb=$(( compressed * pagesize / 1024 / 1024 ))

avail_mb=$((free_mb + inactive_mb + purgeable_mb))
used_mb=$((active_mb + wired_mb + compressed_mb))
total_mb=$((avail_mb + used_mb))

read mem_usage mem_percent <<EOF
$(awk "BEGIN {u=$used_mb/$total_mb; printf \"%.4f %.0f\", u, u*100}")
EOF

sketchybar --push $NAME.graph $mem_usage
sketchybar --set $NAME.percentage label="${mem_percent}%"
