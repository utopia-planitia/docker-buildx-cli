FROM docker:26.1.3@sha256:a811114bcd41954bc9b6577469ce7e648ee600c864e815e535aac79e50439352 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.14.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:26.1.3@sha256:a811114bcd41954bc9b6577469ce7e648ee600c864e815e535aac79e50439352
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
