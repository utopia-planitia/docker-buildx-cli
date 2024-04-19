FROM docker:26.0.1@sha256:12b3a58c977a087514382df904f2af4f24f958fbaee86e81ba3fb092a5baa880 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.14.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:26.0.1@sha256:12b3a58c977a087514382df904f2af4f24f958fbaee86e81ba3fb092a5baa880
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
