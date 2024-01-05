FROM docker:24.0.7@sha256:2afebd1b41e2729abdcc98cea5c3fb7ab13b3cf1e081165a0376e5233c4a4fa2 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.12.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:24.0.7@sha256:2afebd1b41e2729abdcc98cea5c3fb7ab13b3cf1e081165a0376e5233c4a4fa2
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
