FROM docker:24.0.7@sha256:d427455a328e3d7c8a612f4953336b1efe60343f3e17d557831fb4a3581950a5 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.12.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:24.0.7@sha256:d427455a328e3d7c8a612f4953336b1efe60343f3e17d557831fb4a3581950a5
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
