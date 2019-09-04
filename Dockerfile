FROM alpine:3.10

MAINTAINER Citybase

ARG ASTERISK_VERSION=16.3.0

COPY config /etc/asterisk

RUN apk add --no-cache asterisk~=$ASTERISK_VERSION

CMD asterisk -cvv
