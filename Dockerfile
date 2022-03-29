FROM docker:20.10.14@sha256:cfb8c563f5d6784917b224b7fe61c0495234a69d982faead3a2ca22a6a999739 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.8.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:20.10.14@sha256:cfb8c563f5d6784917b224b7fe61c0495234a69d982faead3a2ca22a6a999739
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
