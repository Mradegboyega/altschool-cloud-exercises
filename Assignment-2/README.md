README for Disk Usage and Backup Scripts
Disk Usage Script
Description

This script is designed to check the disk usage of specified directories. It can list both files and directories or just the top N entries based on disk usage, making it a handy tool for monitoring and managing disk space.

yourscript.sh [-d] [-n number] directory [directory2 ...]

    -d: List both files and directories within the specified directory(s).
    -n number: Limit the output to the top N entries based on disk usage. Defaults to 8 entries if not specified.
    directory: The path to the directory you want to check. You can specify multiple directories separated by spaces.

Examples

    List the top 5 directories by disk usage in /var:

    bash

./disk_usage_script.sh -n 5 /var

List both directories and files in /var, showing the top 8 entries by default:

bash

./disk_usage_script.sh -d /var

Specify both options and check multiple directories:

bash

./disk_usage_script.sh -d -n 5 /var /usr /tmp
Backup Script
Description

This script creates a tar.gz archive backup of a given directory and saves it in another directory with a timestamp. It ensures easy and efficient backups of important data, keeping them uniquely identifiable.
Usage

bash

backup_script.sh source_directory destination_directory

    source_directory: The directory to be backed up.
    destination_directory: The directory where the backup archive will be stored.

The backup file will be named in the format: source_directory_nameYYYY-MM-DD_HH-MM-SS.tar.gz.
Example

To back up /path/to/source into /path/to/destination:

bash

./backup_script.sh /path/to/source /path/to/destination

Prerequisites

    Write permissions are required in both the source and destination directories.
    The tar utility must be installed on your system (commonly available by default).
