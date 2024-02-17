FROM docker:25.0.3@sha256:28940f5d0a45dcb945f339636073bf4865cbc7df126a11cdc73531350cecee8a AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.12.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:25.0.3@sha256:28940f5d0a45dcb945f339636073bf4865cbc7df126a11cdc73531350cecee8a
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
