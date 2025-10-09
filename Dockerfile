FROM docker:28.5.1@sha256:24173119fa6d1b5b4a27ab164fa7863deb66574ee5b90fef3b85dc888ef1a7e6 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.29.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:28.5.1@sha256:24173119fa6d1b5b4a27ab164fa7863deb66574ee5b90fef3b85dc888ef1a7e6
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
