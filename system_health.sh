#!/bin/bash

# Set threshold values (lowered for testing)
CPU_THRESHOLD=10
MEMORY_THRESHOLD=10
DISK_THRESHOLD=10

# Log file location
LOG_FILE="/home/simran/system_health.log"

# Function to check CPU usage
check_cpu_usage() {
  CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
  echo "CPU Usage: $CPU_USAGE%"  # Debug output
  if (( $(echo "$CPU_USAGE > $CPU_THRESHOLD" | bc -l) )); then
    echo "$(date): High CPU usage detected: ${CPU_USAGE}%" >> $LOG_FILE
  fi
}

# Function to check memory usage
check_memory_usage() {
  MEMORY_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
  echo "Memory Usage: $MEMORY_USAGE%"  # Debug output
  if (( $(echo "$MEMORY_USAGE > $MEMORY_THRESHOLD" | bc -l) )); then
    echo "$(date): High memory usage detected: ${MEMORY_USAGE}%" >> $LOG_FILE
  fi
}

# Function to check disk usage
check_disk_usage() {
  DISK_USAGE=$(df -h / | grep / | awk '{ print $5 }' | sed 's/%//g')
  echo "Disk Usage: $DISK_USAGE%"  # Debug output
  if (( DISK_USAGE > DISK_THRESHOLD )); then
    echo "$(date): High disk usage detected: ${DISK_USAGE}%" >> $LOG_FILE
  fi
}

# Function to check running processes
check_running_processes() {
  RUNNING_PROCESSES=$(ps -e --no-headers | wc -l)
  echo "Running Processes: $RUNNING_PROCESSES"  
  echo "$(date): Number of running processes: ${RUNNING_PROCESSES}" >> $LOG_FILE
}

# Main function to perform all checks
perform_checks() {
  echo "Performing system health checks..."  
  echo "Logging to $LOG_FILE"  
  touch $LOG_FILE  # Ensure the log file is created
  check_cpu_usage
  check_memory_usage
  check_disk_usage
  check_running_processes
  echo "Checks completed. Waiting for next interval..."  
}

# Run checks every minute
while true; do
  perform_checks
  sleep 60
done
