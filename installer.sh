#!/bin/bash

# Get user input for execution time
echo -n "Enter the daily execution time (minutes): "
read -r execution_mins
echo -n "Enter the daily execution time (hours): "
read -r execution_hrs

# Get the absolute path of the setup.sh script
script_path=$(realpath "$0")
script_dir=$(dirname "$script_path")

# Verify if crontab exists, create if not 
if ! crontab -l > /dev/null 2>&1; then
    echo "Crontab does not exist. Creating a new crontab."
    crontab -u "$USER" /dev/null
fi

# Add Cron Job
if (crontab -l 2>/dev/null; echo "$execution_mins $execution_hrs * * * $script_dir/main.sh >> $script_dir/logfile.log 2>&1") | crontab -; then
    echo "Cron job added! main.sh will execute daily at $execution_hrs h and $execution_mins m"
else
    echo "Error: Failed to add cron job. Please check permissions and try again."
fi
