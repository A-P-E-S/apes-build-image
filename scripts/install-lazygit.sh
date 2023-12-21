#!/bin/sh

VERSION=0.40.2

ARCH_SUFFIX="x86_64"
if [ "$TARGETARCH" = "arm64" ]; then
	ARCH_SUFFIX="arm64"
fi

wget https://github.com/jesseduffield/lazygit/releases/download/v${VERSION}/lazygit_${VERSION}_Linux_${ARCH_SUFFIX}.tar.gz || exit 1
tar -xf lazygit_${VERSION}_Linux_${ARCH_SUFFIX}.tar.gz || exit 1
mv lazygit /usr/bin || exit 1
rm lazygit_${VERSION}_Linux_${ARCH_SUFFIX}.tar.gz || exit 1
