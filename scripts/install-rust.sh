#!/bin/sh

VERSION=1.74.1

(curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --default-toolchain $VERSION) || exit 1
$HOME/.cargo/bin/rustup component add clippy || exit 1
