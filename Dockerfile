FROM docker:29.5.3@sha256:7d85d0eda291f1a7ab6df4a9d1802b5ad4cf9145a088bd11188c78dcb5c7392b AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.34.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:29.5.3@sha256:7d85d0eda291f1a7ab6df4a9d1802b5ad4cf9145a088bd11188c78dcb5c7392b
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
