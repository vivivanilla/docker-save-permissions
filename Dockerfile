FROM alpine

RUN apk add bash sed tree

COPY . /opt/run

CMD ["/opt/run/run.sh"]

