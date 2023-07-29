FROM nginx:latest

RUN  rm /etc/nginx/conf.d/default.conf

COPY nginx.conf /etc/nginx/conf.d/default.conf

ENV DOCKERIZE_VERSION v0.6.1

RUN apt-get update && apt-get install -y wget 

RUN wget -O - https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz | tar xzf - -C /usr/local/bin \
    && apt-get autoremove -yqq --purge wget && rm -rf /var/lib/apt/lists/*

EXPOSE 80

ENTRYPOINT dockerize -wait tcp://fc3_API:3000 -timeout 20s && nginx -g 'daemon off;'


