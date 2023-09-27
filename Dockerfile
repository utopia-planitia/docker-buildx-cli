FROM docker:24.0.6@sha256:264858d91f4d9f588c6039d165d4274dc61f5604a5a65c5910aea870496f27d3 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.11.2
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:24.0.6@sha256:264858d91f4d9f588c6039d165d4274dc61f5604a5a65c5910aea870496f27d3
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
