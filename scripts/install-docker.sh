#!/bin/sh

DOCKER_VERSION=24.0.7
DOCKER_COMPOSE_VERSION=2.21.0

wget https://download.docker.com/linux/ubuntu/dists/jammy/pool/stable/${TARGETARCH}/docker-ce-cli_${DOCKER_VERSION}-1~ubuntu.22.04~jammy_${TARGETARCH}.deb || exit 1
dpkg -i docker-ce-cli_${DOCKER_VERSION}-1~ubuntu.22.04~jammy_${TARGETARCH}.deb || exit 1

wget https://download.docker.com/linux/ubuntu/dists/jammy/pool/stable/${TARGETARCH}/docker-compose-plugin_${DOCKER_COMPOSE_VERSION}-1~ubuntu.22.04~jammy_${TARGETARCH}.deb || exit 1
dpkg -i docker-compose-plugin_${DOCKER_COMPOSE_VERSION}-1~ubuntu.22.04~jammy_${TARGETARCH}.deb || exit 1
