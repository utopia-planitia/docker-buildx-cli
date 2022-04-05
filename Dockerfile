FROM docker:20.10.14@sha256:41978d1974f05f80e1aef23ac03040491a7e28bd4551d4b469b43e558341864e AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.8.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:20.10.14@sha256:41978d1974f05f80e1aef23ac03040491a7e28bd4551d4b469b43e558341864e
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
