# testssl.sh Dockerfile

This is a Dockerfile for [testssl.sh](https://testssl.sh/) based on Debian Jessie.
The image runs a fully functional `testssl.sh` with it's own `openssl` binary.

It will:

* Install all necessary dependencies and Debian's ca-certificates.
* Download the custom openssl binary from https://testssl.sh
* Download [testssl.sh](https://github.com/drwetter/testssl.sh/raw/master/testssl.sh) from Git master.

## Building

```
docker build -t testssl .
```

## Running

```
docker run -it --rm testssl --help
docker run -it --rm testssl https://example.com
...
```
