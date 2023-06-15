FROM docker:24.0.2@sha256:415f69f316a52b057f5df23595c780f9d0cb50337772ee4114dbf7dc293f2627 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.11.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:24.0.2@sha256:415f69f316a52b057f5df23595c780f9d0cb50337772ee4114dbf7dc293f2627
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
