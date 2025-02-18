FROM ubuntu:latest

ENV DB_USER=admin
ENV DB_PASSWORD=secret

RUN apt-get update && apt-get install -y curl wget openssl && apt-get clean

ADD app/config.json http://example.com/config.json

COPY app /app
RUN chmod -R 755 /app

EXPOSE 80

CMD [ "Python3", "/app/main.py" ]

