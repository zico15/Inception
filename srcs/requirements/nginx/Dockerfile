FROM debian:buster-slim

RUN apt-get update -y && apt-get install -y nginx openssl

# Copy the default configuration file to /etc/nginx/conf.d/default.conf
RUN rm /etc/nginx/nginx.conf
COPY ./default.conf /etc/nginx/nginx.conf

COPY nginx_start.sh /usr/local/bin
RUN chmod +x /usr/local/bin/nginx_start.sh

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 \
    -subj "/C=PT/ST=Lisboa/L=Lisbon/O=42 Lisbon/CN=edos-san.42.fr" \
    -keyout /etc/nginx/ssl/nginx.key \
    -out /etc/nginx/ssl/nginx.crt

EXPOSE 443

ENTRYPOINT [ "/usr/local/bin/nginx_start.sh" ]
CMD ["nginx", "-g", "daemon off;"]