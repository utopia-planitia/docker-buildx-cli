FROM docker:28.2.2@sha256:17aa5b215f2b70bc0e456a87bcdd93e8774f133c73452df69d89606abc555270 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.25.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:28.2.2@sha256:17aa5b215f2b70bc0e456a87bcdd93e8774f133c73452df69d89606abc555270
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
