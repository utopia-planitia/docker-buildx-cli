FROM docker:27.2.0@sha256:85f5f52219326ccdccb1566397fc82074961366c9d44adaa92b10c47ca9b1076 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.16.2
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:27.2.0@sha256:85f5f52219326ccdccb1566397fc82074961366c9d44adaa92b10c47ca9b1076
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
