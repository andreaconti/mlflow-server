#! /usr/bin/env bash

# Simple script to automatically save in a directory with the current date
# name the dump of the two mlflow volumes

FILE_DIR=$(dirname $BASH_SOURCE)
OUT_DIR="${1:?Required Path}/$(date +'%Y_%m_%d')"
mkdir -p "$OUT_DIR"
"$FILE_DIR/backup-volume.sh" mlflow-server_artifacts "$OUT_DIR/mlflow-server_artifacts.tar"
"$FILE_DIR/backup-volume.sh" mlflow-server_db "$OUT_DIR/mlflow-server_db.tar"