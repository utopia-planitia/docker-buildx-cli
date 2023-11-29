FROM docker:24.0.7@sha256:126aa7387eede4aae75107cc4bfb6eedaa431d68dd38e60ce1ad7db94a239ae5 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.12.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:24.0.7@sha256:126aa7387eede4aae75107cc4bfb6eedaa431d68dd38e60ce1ad7db94a239ae5
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
