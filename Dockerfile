FROM docker:27.0.2@sha256:87d892c14d2b755ac4e8268b21e8c8a7ff7f44b52753e265b7a300d2fa065d50 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.15.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:27.0.2@sha256:87d892c14d2b755ac4e8268b21e8c8a7ff7f44b52753e265b7a300d2fa065d50
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
