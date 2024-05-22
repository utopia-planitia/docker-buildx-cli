FROM docker:26.1.3@sha256:ae1f3ee621c3185d96624ac26ea5e6ac8536d1a284b16adb6fbc5136a3dc37c6 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.14.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:26.1.3@sha256:ae1f3ee621c3185d96624ac26ea5e6ac8536d1a284b16adb6fbc5136a3dc37c6
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
