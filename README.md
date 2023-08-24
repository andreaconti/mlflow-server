# MLFlow Server

This project bundles together

- A MLFLow Server
- A MySQL Database
- A set of tools for backup/restore and removing deleted runs

In a simple way to deploy MLFlow easily on a single node.

## Run the server

To run the server just

```
$ git clone https://github.com/andreaconti/mlflow-server
$ cd mlflow-server
$ docker-compose up --detach
```

The previous commands will i) build the server image with the latest mlflow server version ii) downloads the mysql server image and lauch both. The server can be accessed under localhost:9999. It also creates two volumes:

1. **mlflow-server_artifacts** containing all the artifacts that are stored in the server
2. **mlflow-server_db** containing the MySQL Databases

## Perform a Backup

Performing a backup basically means saving the content of the two volumes. To do so can be used the `backup-mlflow.sh` script as follows

```
$ cd mlflow-server
$ utils/backup-mlflow.sh backups  # (it is the backup folder)
```

This command creates a folder with the current date and dumps in it two .tar files containing the content of the two volumes.

## Restore a Backup

To restore a backup can be used the `restore-mlflow.sh` script. **Pay attention: this will overwrite the volume content**,
before restoring content shut down the server.

```
$ cd mlflow-server
$ utils/restore-mlflow.sh backups/<date>
```

## Garbage Collection

When a run or experiment is deleted from MLFlow this latter is not really deleted but instead it is simply marked as removed. This means that the quantity of memory used always increases. To limit this issue garbage collection can be employed **to definitely remove the deleted runs**. To do so:

```
$ cd mlflow-server
$ utils/garbage-collect.sh
```