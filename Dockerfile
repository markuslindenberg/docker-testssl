FROM debian:stretch
MAINTAINER Markus Lindenberg <markus@lindenberg.io>

RUN apt-get update && apt-get -y upgrade && apt-get clean
RUN apt-get -y install openssl ca-certificates curl dnsutils bsdmainutils procps && apt-get clean

RUN mkdir -p /opt/testssl
WORKDIR /opt/testssl

#RUN curl -L https://testssl.sh/openssl-1.0.2k-chacha.pm.ipv6.Linux+FreeBSD.tar.gz | tar xz bin/openssl.Linux.x86_64.static && mv bin/openssl.Linux.x86_64.static bin/openssl && chmod a+x bin/openssl
RUN curl -OL https://testssl.sh/mapping-rfc.txt
RUN ln -s /etc/ssl/certs etc
RUN curl -OL https://testssl.sh/testssl.sh && chmod a+x testssl.sh

WORKDIR /
USER nobody
ENTRYPOINT ["/opt/testssl/testssl.sh"]
