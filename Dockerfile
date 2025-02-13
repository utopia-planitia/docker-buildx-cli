FROM docker:27.5.1@sha256:de91b21638c6898b6ff2b52ce5f31031c08234dc6f718b8e16cdc045bfdc0d7f AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.20.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:27.5.1@sha256:de91b21638c6898b6ff2b52ce5f31031c08234dc6f718b8e16cdc045bfdc0d7f
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
