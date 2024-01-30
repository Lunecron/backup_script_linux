#!/bin/bash

# Set source and destination paths
source_path="/path/dir_to_be_saved"
backup_path="/path/backup_dir"

# Create a timestamp for the backup folder name
timestamp=$(date +"%Y_%m_%d-%H_%M_%S")

# Use rsync to perform the backup
rsync -av --delete $source_path $backup_path/$timestamp

# Delete old backups beyond the last 48
ls -t $backup_path | tail -n +49 | xargs -I {} rm -r $backup_path/{}