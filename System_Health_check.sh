#!/bin/bash

# Date format
TODAY=$(date +%F)

# Log running processes
echo "Logging all running processes to process_log_$TODAY.log..."
tasklist > "process_log_$TODAY.log"

# Check for high memory usage (>500MB)
echo "Checking for high memory usage (>500MB)..."
HIGH_MEM_PROCESSES=$(tasklist | awk 'NR>3 && $5 ~ /[0-9]/ {
    gsub(",", "", $5); mem=$5
    if (mem ~ /K$/) { mem = mem+0 }
    else if (mem ~ /M$/) { mem = mem * 1024 }
    if (mem > 512000) print
}' )

HIGH_MEM_COUNT=$(echo "$HIGH_MEM_PROCESSES" | grep -c '^')

if [ "$HIGH_MEM_COUNT" -gt 0 ]; then
    echo "WARNING: Found $HIGH_MEM_COUNT process(es) using more than 500MB memory!"
    echo "$HIGH_MEM_PROCESSES" >> high_mem_processes.log
fi

# Check Disk Usage on C:
echo "Checking disk usage on C: drive..."
DISK_INFO=$(df -h /c | awk 'NR==2 {print $5}' | tr -d '%')
DISK_USAGE=${DISK_INFO:-0}

if [ "$DISK_USAGE" -gt 80 ]; then
    echo "WARNING: Disk usage on C: drive is above 80% (Current: ${DISK_USAGE}%)"
fi

# Count total running processes
TOTAL_PROCESSES=$(tasklist | grep -c '^')

# Summary
echo ""
echo "========== System Health Summary =========="
echo "Total running processes         : $TOTAL_PROCESSES"
echo "Processes using >500MB memory   : $HIGH_MEM_COUNT"
echo "Disk usage on C: drive          : ${DISK_USAGE}%"
echo "==========================================="
