FROM docker:24.0.1@sha256:99f37b72d498f19dcb9473b3e6dc58b7009bff129fb96bfa096e1b3b080b3df5 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.10.4
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:24.0.1@sha256:99f37b72d498f19dcb9473b3e6dc58b7009bff129fb96bfa096e1b3b080b3df5
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
