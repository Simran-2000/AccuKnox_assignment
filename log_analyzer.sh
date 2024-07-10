#!/bin/bash

# Log file location
LOG_FILE="/var/log/apache2/access.log"

# Ensure the log file exists
if [ ! -f "$LOG_FILE" ]; then
  echo "Log file not found: $LOG_FILE"
  exit 1
fi

# Initialize report file
REPORT_FILE="log_report.txt"
echo "Log Analysis Report" > $REPORT_FILE
echo "===================" >> $REPORT_FILE

# Count the number of 404 errors
ERROR_404_COUNT=$(grep " 404 " $LOG_FILE | wc -l)
echo "Number of 404 errors: $ERROR_404_COUNT" >> $REPORT_FILE

# Find the most requested pages
echo "" >> $REPORT_FILE
echo "Most Requested Pages:" >> $REPORT_FILE
awk '{print $7}' $LOG_FILE | sort | uniq -c | sort -nr | head -10 >> $REPORT_FILE

# Find the IP addresses with the most requests
echo "" >> $REPORT_FILE
echo "IP Addresses with Most Requests:" >> $REPORT_FILE
awk '{print $1}' $LOG_FILE | sort | uniq -c | sort -nr | head -10 >> $REPORT_FILE

# Output the report
cat $REPORT_FILE
