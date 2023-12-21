#!/bin/sh

VERSION=1.6.4

wget https://releases.hashicorp.com/terraform/${VERSION}/terraform_${VERSION}_linux_${TARGETARCH}.zip || exit 1
unzip terraform_${VERSION}_linux_${TARGETARCH}.zip || exit 1
mv terraform /usr/bin || exit 1
rm terraform_${VERSION}_linux_${TARGETARCH}.zip || exit 1
