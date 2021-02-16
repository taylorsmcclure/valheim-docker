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
