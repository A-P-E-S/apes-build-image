#!/bin/sh

VERSION=2.15.0

ARCH_SUFFIX=x86_64
if [ "$TARGETARCH" = "arm64" ]; then
	ARCH_SUFFIX="aarch64"
fi

wget https://awscli.amazonaws.com/awscli-exe-linux-${ARCH_SUFFIX}-${VERSION}.zip -O awscli.zip || exit 1
unzip awscli.zip || exit 1
./aws/install || exit 1
rm -R ./aws || exit 1
rm awscli.zip || exit 1
