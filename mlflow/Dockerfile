FROM python:3.9.13-slim

RUN apt update && apt install -y build-essential default-libmysqlclient-dev
RUN pip install mlflow mysqlclient

ENTRYPOINT ["mlflow", "server"]