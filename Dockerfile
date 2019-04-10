FROM alpine:3.9

MAINTAINER Citybase

ARG ASTERISK_VERSION=15.7.1

COPY config /etc/asterisk

RUN apk add --no-cache asterisk~=$ASTERISK_VERSION

CMD asterisk -cvv
