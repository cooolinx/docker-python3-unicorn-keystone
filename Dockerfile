FROM python:3.7.6-alpine

LABEL maintainer "fallen_lord@126.com"

# Patch timezone
RUN apk add -U tzdata && \
    rm -rf /etc/localtime && \
    ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# gcc should be kept for running Python dynamic library
# Fix keystone pypi bug: https://github.com/keystone-engine/keystone/issues/386
RUN apk add cmake make g++ linux-headers && \
    pip install unicorn==1.0.2rc2 \
                pyelftools==0.24 \
                hexdump==3.3 \
                keystone-engine==0.9.1-3 && \
    mv /usr/local/lib/python3.7/site-packages/usr/local/lib/python3.7/site-packages/keystone/libkeystone.so /usr/local/lib/python3.7/site-packages/keystone/ && \
    apk del cmake make linux-headers

