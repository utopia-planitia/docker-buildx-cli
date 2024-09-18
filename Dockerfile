FROM docker:27.2.1@sha256:db7c4d6d0321c8f674c78a8d1186c8bdfc2f42909d28542a54358a426d34b25c AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.17.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:27.2.1@sha256:db7c4d6d0321c8f674c78a8d1186c8bdfc2f42909d28542a54358a426d34b25c
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
