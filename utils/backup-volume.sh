#! /usr/bin/env bash

VOLUME_NAME=$1
VOLUME_BACKUP_PATH=$2
TMP_MOUNT_FROM="/volume_data_from"
TMP_MOUNT_TO="/volume_data_to"

docker run --rm \
    --volume $VOLUME_NAME:$TMP_MOUNT_FROM \
    --volume $(realpath $VOLUME_BACKUP_PATH | xargs dirname):$TMP_MOUNT_TO \
    ubuntu \
    tar cvf $TMP_MOUNT_TO/$(basename $VOLUME_BACKUP_PATH) $TMP_MOUNT_FROM
