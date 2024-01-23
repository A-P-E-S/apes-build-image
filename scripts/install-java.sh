#!/bin/sh

JAVA_VERSION=18.0.2

ARCH_SUFFIX=x64
if [ "$TARGETARCH" = "arm64" ]; then
	ARCH_SUFFIX="aarch64"
fi

curl -o java.tar.gz https://download.java.net/java/GA/jdk${JAVA_VERSION}/f6ad4b4450fd4d298113270ec84f30ee/9/GPL/openjdk-${JAVA_VERSION}_linux-${ARCH_SUFFIX}_bin.tar.gz || exit 1
tar xf java.tar.gz || exit 1
rm java.tar.gz || exit 1
mv jdk-${JAVA_VERSION} /java || exit 1
