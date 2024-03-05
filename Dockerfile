FROM docker:25.0.3@sha256:0d70c541ee98e66b8f7ece8c0e9f7910732466e337a9087c2ac2868ef0775092 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.13.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:25.0.3@sha256:0d70c541ee98e66b8f7ece8c0e9f7910732466e337a9087c2ac2868ef0775092
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
