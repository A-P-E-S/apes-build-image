#!/bin/sh

DOCTL_VERSION=1.104.0

wget https://github.com/digitalocean/doctl/releases/download/v${DOCTL_VERSION}/doctl-${DOCTL_VERSION}-linux-${TARGETARCH}.tar.gz || exit 1
tar -xf doctl-${DOCTL_VERSION}-linux-${TARGETARCH}.tar.gz || exit 1
mv ./doctl /usr/bin/doctl || exit 1
rm doctl-${DOCTL_VERSION}-linux-${TARGETARCH}.tar.gz || exit 1
