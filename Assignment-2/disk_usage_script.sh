#!/bin/bash

# Initialize variables
list_flag=0
num_entries=8

# Parse command-line options
while getopts "dn:" opt; do
  case ${opt} in
    d )
      list_flag=1
      ;;
    n )
      num_entries=$OPTARG
      ;;
    \? )
      echo "Usage: cmd [-d] [-n number] directory"
      exit 1
      ;;
  esac
done
shift $((OPTIND -1))

# Check if directory argument is provided
if [ $# -eq 0 ]; then
    echo "You must specify a directory."
    echo "Usage: $0 [-d] [-n number] directory"
    exit 1
fi

# Iterate over all directories provided as arguments
for dir in "$@"; do
    if [ -d "$dir" ]; then
        echo "Checking disk usage in: $dir"
        if [ $list_flag -eq 1 ]; then
            # List both files and directories
            du -ah "$dir" | sort -rh | head -n $num_entries
        else
            # List only the top directories
            du -sh "$dir"/* | sort -rh | head -n $num_entries
        fi
    else
        echo "Error: Directory $dir not found."
    fi
done

