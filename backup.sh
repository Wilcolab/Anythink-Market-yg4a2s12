#!/bin/bash

# Check if the log file argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <log_file>"
  exit 1
fi

log_file="$1"
backup_file="/root"

# Check if the log file exists
if [ ! -f "$log_file" ]; then
  echo "Error: Log file not found!"
  exit 1
fi

# Create the backup directory if it doesn't exist
backup_dir="$(dirname "$backup_file")"
mkdir -p "$backup_dir"

# Archive the log file
tar -czvf "$backup_file" "$log_file"

echo "Log file backed up successfully to $backup_file"

