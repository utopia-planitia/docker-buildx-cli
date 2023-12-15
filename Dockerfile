FROM docker:24.0.7@sha256:ae63bb7c7d3ae23884a2c5d206939640279f6d15730618192b58662a0619f182 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.12.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:24.0.7@sha256:ae63bb7c7d3ae23884a2c5d206939640279f6d15730618192b58662a0619f182
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
