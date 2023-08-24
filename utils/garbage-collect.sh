#! /usr/bin/env bash

docker exec \
    -e MLFLOW_TRACKING_URI=http://127.0.0.1:5000 \
    mlflow-server \
    mlflow gc --backend-store-uri mysql://mlflow:mlflow@backend-store:3306/mlflow