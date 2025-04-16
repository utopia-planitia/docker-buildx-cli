FROM docker:28.0.4@sha256:4de6a5668da5d138bf9c18b29d2702e43c8773daee085087ba4fac61a6d34b7f AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.23.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:28.0.4@sha256:4de6a5668da5d138bf9c18b29d2702e43c8773daee085087ba4fac61a6d34b7f
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
