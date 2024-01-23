#!/bin/sh

# NOTE: Flutter doesn't currently offer an ARM build for Linux, so we skip this
# install if we're on arm64.
if [ "$TARGETARCH" != "amd64" ]; then
	exit 0
fi

FLUTTER_VERSION=3.16.8

curl -o flutter_linux_${FLUTTER_VERSION}-stable.tar.xz https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${FLUTTER_VERSION}-stable.tar.xz || exit 1
tar xf flutter_linux_${FLUTTER_VERSION}-stable.tar.xz || exit 1
rm flutter_linux_${FLUTTER_VERSION}-stable.tar.xz || exit 1
chown -R root:root /flutter || exit 1
/flutter/bin/flutter precache || exit 1
(yes | /flutter/bin/flutter doctor --android-licenses) || exit 1
