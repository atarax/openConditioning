# atarax/kubernetes-toolbox
FROM debian:8.10-slim

RUN apt-get update && \
    apt-get install --yes curl && \
    cd /tmp && \
    curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl && \
    curl -LO https://storage.googleapis.com/kubernetes-helm/helm-v2.8.0-linux-amd64.tar.gz && \
    tar -xf helm-v2.8.0-linux-amd64.tar.gz && \
    mv linux-amd64/helm /usr/local/bin/helm && \
    rm -rf helm-v2.8.0-linux-amd64.tar.gz linux-amd64 && \
    apt-get purge --yes curl && \
    apt-get autoremove --yes && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*
