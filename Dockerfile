FROM postgres:14-alpine3.15

ENV MPQ_DB_USER=mpqdata

RUN mkdir -p /docker-entrypoint-initdb.d/

COPY target/sql/*.sql target/classes/data/* /docker-entrypoint-initdb.d/
