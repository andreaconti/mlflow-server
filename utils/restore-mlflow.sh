#! /usr/bin/env bash

# Simple script to automatically restore a backup in the current mlflow
# server, **attention: this overwrites the current content**

FILE_DIR=$(dirname $BASH_SOURCE)
BACKUP_PATH="${1:?Required Path}"
echo "BACKUP PATH >> $BACKUP_PATH"
"$FILE_DIR/restore-volume.sh" mlflow-server_artifacts "$BACKUP_PATH/mlflow-server_artifacts.tar"
"$FILE_DIR/restore-volume.sh" mlflow-server_db "$BACKUP_PATH/mlflow-server_db.tar"