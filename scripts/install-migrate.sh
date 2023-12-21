#!/bin/sh

VERSION=4.16.2

wget https://github.com/golang-migrate/migrate/releases/download/v4.16.2/migrate.linux-amd64.tar.gz || exit 1
tar -xf migrate.linux-${TARGETARCH}.tar.gz || exit 1
chmod u+x migrate || exit 1
mv migrate /usr/bin/migrate || exit 1
rm migrate.linux-${TARGETARCH}.tar.gz || exit 1
