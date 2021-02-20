#!/usr/bin/env bash

set -e

timestamp() {
  date "+%Y.%m.%d-%H.%M"
}

while getopts s:f: flag
do
    # shellcheck disable=SC2220
    case "${flag}" in
        s) SOURCE_PATH=${OPTARG};;
        f) BACKUP_PATH=${OPTARG};;
    esac
done

FILE_NAME="`timestamp`_backup.zip"

echo "`timestamp` - Backing up Valheim worlds..."
zip -r "${BACKUP_PATH}${FILE_NAME}" $SOURCE_PATH
echo "`timestamp` - Successfully saved backup to: ${BACKUP_PATH}${FILE_NAME}"

echo "`timestamp` - Deleting backups older than one day..."
find $BACKUP_PATH -mtime +1 -type f -exec rm {} \;
echo "`timestamp` - Deletion completed."
