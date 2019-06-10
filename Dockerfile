FROM ubuntu:18.04

MAINTAINER Citybase

RUN apt-get update && apt-get install -y \
    build-essential \
    pkg-config \
    curl \
    libsqlite3-dev \
    libedit-dev \
    libjansson-dev \
    uuid-dev \
    libxml2-dev \
    libspeex-dev \
    libspeexdsp-dev \
    libogg-dev \
    libvorbis-dev \
    libasound2-dev \
    portaudio19-dev \
    libpq-dev \
    unixodbc-dev \
    libneon27-dev \
    libgmime-2.6-dev \
    liblua5.2-dev \
    liburiparser-dev \
    libxslt1-dev \
    libssl-dev \
    libcurl4-openssl-dev \
    xmlstarlet \
    bison \
    flex \
    libjack-jackd2-dev \
    bash \
    bzip2 \
    patch \
    python-dev \
    libcodec2-dev \
    libfftw3-dev \
    libsndfile1-dev \
    libunbound-dev \
&& rm -rf /var/lib/apt/lists/*

RUN cd /usr/local/src \
  && curl -O http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-16-current.tar.gz \
  && tar -zxvf asterisk-16-current.tar.gz

RUN cd /usr/local/src/asterisk-16.4.0 \
  && ./configure \
  && make \
  && make install

COPY ./config /etc/asterisk

CMD asterisk -cpvvvvvvvvv
