FROM docker:29.0.2@sha256:d003717ad7a27d359dd2f5f6aa6ca691f5f58671e8d1ff0277d07e5635bb8332 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.30.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:29.0.2@sha256:d003717ad7a27d359dd2f5f6aa6ca691f5f58671e8d1ff0277d07e5635bb8332
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
