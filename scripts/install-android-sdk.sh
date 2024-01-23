#!/bin/sh

ANDROID_PLATFORM="android-33"
ANDROID_BUILD_TOOLS_VERSION="33.0.0"

export PATH=":/java/bin:$PATH"

curl -o commandlinetools-linux-11076708_latest.zip https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip || exit 1
unzip commandlinetools-linux-11076708_latest.zip || exit 1
mkdir /android_sdk || exit 1
mkdir /android_sdk/cmdline-tools || exit 1
mv cmdline-tools /android_sdk/cmdline-tools/latest || exit 1
rm commandlinetools-linux-11076708_latest.zip || exit 1
(yes | /android_sdk/cmdline-tools/latest/bin/sdkmanager "platform-tools" "platforms;$ANDROID_PLATFORM" "build-tools;$ANDROID_BUILD_TOOLS_VERSION") || exit 1
