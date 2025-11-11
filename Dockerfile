FROM docker:29.0.0@sha256:96789d56621ae702a2f8aa316c87a1a1875dd3f02bf67cdcb56a524a09fa3af9 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.29.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:29.0.0@sha256:96789d56621ae702a2f8aa316c87a1a1875dd3f02bf67cdcb56a524a09fa3af9
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
