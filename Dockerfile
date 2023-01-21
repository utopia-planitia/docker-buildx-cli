FROM docker:20.10.23@sha256:2655039c6abfc8a1d75978c5258fccd5c5cedf880b6cfc72077f076d0672c70a AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.10.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:20.10.23@sha256:2655039c6abfc8a1d75978c5258fccd5c5cedf880b6cfc72077f076d0672c70a
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
