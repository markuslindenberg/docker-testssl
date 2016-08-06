FROM debian:jessie
MAINTAINER Markus Lindenberg <markus@lindenberg.io>

RUN apt-get update && apt-get -y upgrade && apt-get clean
RUN apt-get -y install openssl ca-certificates curl dnsutils bsdmainutils && apt-get clean

RUN mkdir -p /opt/testssl
WORKDIR /opt/testssl

RUN curl -sL https://testssl.sh/openssl-1.0.2i-chacha.pm.ipv6.Linux+FreeBSD.tar.gz | tar xz --strip-components=1 bin/openssl.Linux.x86_64 && chmod a+x openssl.Linux.x86_64
RUN curl -sOL https://testssl.sh/mapping-rfc.txt
RUN ln -s /etc/ssl/certs etc
RUN curl -sL https://github.com/drwetter/testssl.sh/raw/master/testssl.sh > testssl.sh && chmod a+x testssl.sh

WORKDIR /
USER nobody
ENTRYPOINT ["/opt/testssl/testssl.sh"]
