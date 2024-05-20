#!/bin/bash

# Directories to clean
LOG_DIR="/var/log"
TEMP_DIR="/tmp"
CACHE_DIR="$HOME/.cache"

# Function to print current date in the specified format
print_date() {
    date +"%S:%M:%H %d/%m/%Y -> "
}

# Function to clean logs older than 5 days
clean_logs() {
    if [ -d "$1" ]; then
        find "$1" -type f -name "*.log" -mtime +5 -exec rm -f {} \;
        find "$1" -type f -name "*.gz" -mtime +5 -exec rm -f {} \;
        echo "$(print_date)Log files cleanup completed."
    else
        echo "$(print_date)Directory $1 does not exist. Skipping log cleanup."
    fi
}

# Function to clean temporary files older than 5 days
clean_temp_files() {
    if [ -d "$1" ]; then
        find "$1" -type f -mtime +5 -exec rm -f {} \;
        find "$1" -type d -empty -delete
        echo "$(print_date)Temporary files cleanup completed."
    else
        echo "$(print_date)Directory $1 does not exist. Skipping temp files cleanup."
    fi
}

# Function to clean cache directory
clean_cache() {
    if [ -d "$1" ]; then
        find "$1" -type f -mtime +5 -exec rm -f {} \;
        find "$1" -type d -empty -delete
        echo "$(print_date)Cache directory cleanup completed."
    else
        echo "$(print_date)Directory $1 does not exist. Skipping cache cleanup."
    fi
}

# Function to clean package management files
clean_package_management() {
    sudo apt-get autoremove -y
    sudo apt-get clean -y
    sudo apt-get autoclean -y
    echo "$(print_date)Package management cleanup completed."
}

# Function to clean Node.js and npm cache
clean_node_cache() {
    if command -v npm &> /dev/null; then
        npm cache clean --force
        npm prune
        echo "$(print_date)Node.js and npm cache cleanup completed."
    else
        echo "$(print_date)npm is not installed. Skipping Node.js cache cleanup."
    fi
}

# Execute cleanup functions
clean_logs "$LOG_DIR"
clean_temp_files "$TEMP_DIR"
clean_cache "$CACHE_DIR"
clean_package_management
clean_node_cache

echo "$(print_date)All cleanup tasks completed."
echo "-----------------------------------------"
echo
