#!/bin/sh

VERSION=3.31.0

wget https://github.com/go-task/task/releases/download/v${VERSION}/task_linux_${TARGETARCH}.tar.gz || exit 1
tar -xf task_linux_${TARGETARCH}.tar.gz || exit 1
mv task /usr/bin/task || exit 1
rm task_linux_${TARGETARCH}.tar.gz || exit 1
