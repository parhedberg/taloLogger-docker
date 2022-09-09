FROM python:2.7.18-alpine
COPY --from=httpd:alpine / /
ENV <-(merge)- docker inspect httpd:alpine --format='{{.Config.Env}}'
COPY --from=php:alpine / /
ENV <-(merge)- docker inspect php:alpine --format='{{.Config.Env}}'

LABEL org.opencontainers.image.authors="par.holmdahl@gmail.com"

EXPOSE 80

RUN apk update && apk add unzip
RUN pip install paho-mqtt python-etcd
RUN mkdir -p /home/talo/
RUN mkdir -p /home/talo/taloLogger
RUN mkdir -p /home/talo/taloLoggerGraph

WORKDIR /home/talo

RUN wget https://olammi.iki.fi/sw/taloLogger/taloLogger_v17k.zip
RUN wget https://olammi.iki.fi/sw/taloLoggerGraph/taloLoggerGraph_v12d.zip

RUN unzip /home/talo/taloLogger_v17k.zip -d /home/talo/
RUN unzip /home/talo/taloLoggerGraph_v12d.zip -d /home/talo

COPY taloLogger.conf /home/talo/taloLogger

VOLUME ["/home/talo/data/"]

ENTRYPOINT [ "python", "/home/talo/taloLogger/taloLogger.py", "-f", "/home/talo/taloLogger/taloLogger.conf" ]

#ENTRYPOINT ["sh", "-c", "top"]
