# mpqdata-db

## Overview

Database for storing and maintain MPQ base character and locale data,
supporting the API / front end.

## Usage

### Maven

````bash
# Build the schema creation and initialization scripts.
$ ./mvnw build
````

### Docker

````bash
# Build the Docker container
$ docker build -t "zometer/mpqdata-db:latest" .
````

````bash
# run the Docker container
$ docker run \
		-d \
		-p 5432:5432 \
		-e POSTGRES_DB=mpqdata \
		-e POSTGRES_USER=$POSTGRES_USER \
		-e POSTGRES_PASSWORD=$POSTGRES_PASSWORD \
		--name mpqdata-db \
		zometer/mpqdata-db:latest
````


## Dependencies

### Databases

1. MPQDATA - Postgres database containing baseline MPQ character data.

### Environment Variables

| Name               | Value             |
|--------------------|-------------------|
| POSTGRES_DB        | Name of database containing the MPQ character data. |
| POSTGRES_USER      | Username of database user. |
| POSTGRES_PASSWORD  | Username of database user. |


## Issues


## TODOs


## Additional Information

1. https://zenhax.com/viewtopic.php?t=12756

