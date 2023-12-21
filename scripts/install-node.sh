#!/bin/sh

VERSION=20.10.0

ARCH_SUFFIX=x64
if [ "$TARGETARCH" = "arm64" ]; then
	ARCH_SUFFIX="arm64"
fi

curl -o node-v${VERSION}-linux-${ARCH_SUFFIX}.tar.xz https://nodejs.org/dist/v${VERSION}/node-v${VERSION}-linux-${ARCH_SUFFIX}.tar.xz || exit 1
tar -xf node-v${VERSION}-linux-${ARCH_SUFFIX}.tar.xz || exit 1
mv node-v${VERSION}-linux-${ARCH_SUFFIX} /usr/bin/node || exit 1
rm node-v${VERSION}-linux-${ARCH_SUFFIX}.tar.xz || exit 1
