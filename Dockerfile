FROM alpine:3.9

MAINTAINER Citybase

RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/main >> /etc/apk/repositories
RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories
RUN apk update

ARG ASTERISK_VERSION=16.3.0

COPY config /etc/asterisk

RUN apk add --no-cache asterisk~=$ASTERISK_VERSION

CMD asterisk -cvv
