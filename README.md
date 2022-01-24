# mpqdata-db

## Overview

Database for storing and maintain MPQ base character and locale data,
supporting the API / front end.

## Usage

The project will create database initialization scripts and starting data files in directory defined in the ``sqlOuputDir`` property in the build file.

### Maven

````bash
# Build the schema creation and initialization scripts.
$ ./mvnw package
````

### Docker

````bash
# run the Docker container
$ docker run \
	-d \
	-p 5432:5432 \
	-e POSTGRES_DB=mpqdata \
	-e POSTGRES_USER=$POSTGRES_USER \
	-e POSTGRES_PASSWORD=$POSTGRES_PASSWORD \
	-e POSTGRES_POSTGRES_PASSWORD=$POSTGRES_ADMIN_PASSWORD \
	-v $PWD/docker-entrypoint-initdb.d:/docker-entrypoint-initdb.d
	--name mpqdata-db \
	bitnami/postgresql
````

### Helm / Kubernetes

````bash
# Create Kubernetes namespace
$ kubectl create namespace mpqdata

# Create config map for mounting the init sql.
$ kubectl create configmap init-db-config-map  --namespace=mpqdata --from-file=target/docker-entrypoint-initdb.d/

# Install the helm chart
$ helm install mpqdata-db bitnami/postgresql \
	--namespace mpqdata \
	--set postgresqlPostgresPassword=$POSTGRES_ADMIN_PASSWORD,postgresqlDatabase=mpqdata,postgresqlUsername=$POSTGRES_USER,postgresqlPassword=$POSTGRES_PASSWORD,initdbScriptsConfigMap=init-db-config-map

# You will need to forward the port for local access outside of the cluster.
$ kubectl port-forward --namespace mpqdata svc/mpqdata-db-postgresql 5432:5432
````


## Dependencies

### Databases

1. Postgresql: database containing baseline MPQ character data. This example uses the bitnami image and chart, but others like the official distributions should work just as well.

### Environment Variables

| Name                        | Value             |
|-----------------------------|-------------------|
| POSTGRES_DB                 | Name of database containing the MPQ character data. |
| POSTGRES_USER               | User name for the database user. |
| POSTGRES_PASSWORD           | Password of database user. |
| POSTGRES_POSTGRES_PASSWORD  | Username of database admin user (postgres). |


## Issues


## TODOs


## Additional Information

1. https://hub.docker.com/r/bitnami/postgresql
1. https://artifacthub.io/packages/helm/bitnami/postgresql

