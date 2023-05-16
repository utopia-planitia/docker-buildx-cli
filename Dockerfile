FROM docker:23.0.6@sha256:2985399fb735fa4c3b6cfba8d1087f011dc4c6f5fde105c9c5a77be472b73836 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.10.4
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:23.0.6@sha256:2985399fb735fa4c3b6cfba8d1087f011dc4c6f5fde105c9c5a77be472b73836
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
