FROM ubuntu:14.04

RUN DEBIAN_FRONTEND=noninteractive apt-get -y install wget
RUN wget --quiet --no-check-certificate -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" > /etc/apt/sources.list.d/pgdg.list
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install pgbouncer net-tools vim
ENV PG_ENV_POSTGRESQL_MAX_CLIENT_CONN 10000
ENV PG_ENV_POSTGRESQL_DEFAULT_POOL_SIZE 400
ENV PG_ENV_POSTGRESQL_SERVER_IDLE_TIMEOUT 240
ADD run.sh /usr/local/bin/run

RUN chmod +x /usr/local/bin/run
EXPOSE 6432
CMD ["/usr/local/bin/run"]
