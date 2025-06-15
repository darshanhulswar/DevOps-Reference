#!/bin/bash

THRESHOLD=60

# Get CPU idle percentage from the second iteration of top
CPU_IDLE=$(mpstat 1 1 | awk '/Average:/ {print $NF}')

# Calculate CPU usage
CPU_USAGE=$(echo "100 - $CPU_IDLE" | bc)
CPU_USAGE_LIMIT=${CPU_USAGE%.*}
echo "current status $CPU_USAGE"

# Check if CPU usage is higher than threshold
if [ "$CPU_USAGE_LIMIT" -gt "$THRESHOLD" ]; then
    echo "Alert..!!!: High CPU detected - $CPU_USAGE%"

    echo "CPU usage is $CPU_USAGE%" | mail -s "High CPU Alert" dhulswar591@gmail.com
fi
