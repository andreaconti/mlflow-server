#! /usr/bin/env bash

FILE_DIR=$(dirname $BASH_SOURCE)
cd $FILE_DIR/..
docker-compose run --rm server db upgrade mysql://mlflow:mlflow@backend-store:3306/mlflow
docker-compose down
cd -