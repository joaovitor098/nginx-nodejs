FROM node:15

WORKDIR /app

COPY . .

ENV DOCKERIZE_VERSION v0.6.1

RUN apt-get install -y wget 

RUN wget -O - https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz | tar xzf - -C /usr/local/bin \
    && apt-get autoremove -yqq --purge wget && rm -rf /var/lib/apt/lists/*

RUN npm install

EXPOSE 3000

ENTRYPOINT dockerize -wait tcp://fc3_database:3306 -timeout 20s && npm start