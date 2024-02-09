# Start with Ubuntu.
FROM ubuntu:22.04 AS build
ARG TARGETARCH

# Install some basic packages.
RUN apt update
RUN apt upgrade -y
RUN apt install -y \
	git \
	unzip \
	zip \
	gcc \
	xz-utils \
	jq \
	curl \
	wget

# Install Postgres client.
RUN apt install -y postgresql-client

# Install Rust.
COPY ./scripts/install-rust.sh ./
RUN chmod u+x ./install-rust.sh && ./install-rust.sh && rm ./install-rust.sh

# Install Node.
COPY ./scripts/install-node.sh ./
RUN chmod u+x ./install-node.sh && ./install-node.sh && rm ./install-node.sh

# Install flyctl.
COPY ./scripts/install-flyctl.sh ./
RUN chmod u+x ./install-flyctl.sh && ./install-flyctl.sh && rm ./install-flyctl.sh

# Install migrate.
COPY ./scripts/install-migrate.sh ./
RUN chmod u+x ./install-migrate.sh && ./install-migrate.sh && rm ./install-migrate.sh

# Install task.
COPY ./scripts/install-task.sh ./
RUN chmod u+x ./install-task.sh && ./install-task.sh && rm ./install-task.sh

# Install terraform.
COPY ./scripts/install-terraform.sh ./
RUN chmod u+x ./install-terraform.sh && ./install-terraform.sh && rm ./install-terraform.sh

# Install lazygit.
COPY ./scripts/install-lazygit.sh ./
RUN chmod u+x ./install-lazygit.sh && ./install-lazygit.sh && rm ./install-lazygit.sh

# Install docker.
COPY ./scripts/install-docker.sh ./
RUN chmod u+x ./install-docker.sh && ./install-docker.sh && rm ./install-docker.sh

# Install AWS CLI.
COPY ./scripts/install-aws.sh ./
RUN chmod u+x ./install-aws.sh && ./install-aws.sh && rm ./install-aws.sh

# Install Java.
COPY ./scripts/install-java.sh ./
RUN chmod u+x ./install-java.sh && ./install-java.sh && rm ./install-java.sh

# Install Android SDK.
COPY ./scripts/install-android-sdk.sh ./
RUN chmod u+x ./install-android-sdk.sh && ./install-android-sdk.sh && rm ./install-android-sdk.sh

# Install Flutter.
COPY ./scripts/install-flutter.sh ./
RUN chmod u+x ./install-flutter.sh && ./install-flutter.sh && rm ./install-flutter.sh

# Setup Git autocomplete and a nice prompt.
COPY ./scripts/git-setup.sh /git-setup.sh
RUN cat /git-setup.sh >> /root/.bashrc
RUN rm /git-setup.sh

# Squash everything together.
FROM scratch
COPY --from=build / /
ENV PATH="/usr/bin/node/bin:/root/.cargo/bin:/root/.fly/bin:/java/bin:/android_sdk/cmdline-tools/latest/bin:/android_sdk/platform-tools:/flutter/bin:$PATH"
ENV ANDROID_HOME=/android_sdk
