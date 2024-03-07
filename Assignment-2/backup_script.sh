#!/bin/bash

# Check if two arguments are given
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 source_directory destination_directory"
  exit 1
fi

# Assign the first argument as the source directory
SOURCE_DIR=$1

# Assign the second argument as the destination directory
DEST_DIR=$2

# Get current date and time for the filename
CURRENT_DATE=$(date +"%Y-%m-%d_%H-%M-%S")

# Create the backup filename
BACKUP_NAME=$(basename "$SOURCE_DIR")_$CURRENT_DATE.tar.gz

# Full path for the backup file
BACKUP_PATH="$DEST_DIR/$BACKUP_NAME"

# Check if the source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
  echo "Error: Source directory does not exist."
  exit 1
fi

# Check if the destination directory exists, if not, create it
if [ ! -d "$DEST_DIR" ]; then
  echo "Destination directory does not exist, creating it now."
  mkdir -p "$DEST_DIR"
fi

# Create the backup
echo "Creating backup of $SOURCE_DIR in $BACKUP_PATH"
tar -czf "$BACKUP_PATH" -C "$(dirname "$SOURCE_DIR")" "$(basename "$SOURCE_DIR")"

# Verify if the backup was successful
if [ $? -eq 0 ]; then
  echo "Backup was successful."
else
  echo "Backup failed."
  exit 1
fi

