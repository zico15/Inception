# versao 10
FROM debian:buster-slim

RUN apt update \
    && apt install mariadb-server procps -y

COPY ./tools/script.sh .

COPY ./conf/db_script.sql /etc/mysql/conf.d/

RUN chmod +x /script.sh

WORKDIR /var/lib/mysql

ENTRYPOINT ["bash", "-c", "/script.sh"]
