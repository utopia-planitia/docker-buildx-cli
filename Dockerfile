FROM docker:24.0.6@sha256:d97a9d557c8501257b90f220b2b0ff8974117524b15b45244a910855e40fab66 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.11.2
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:24.0.6@sha256:d97a9d557c8501257b90f220b2b0ff8974117524b15b45244a910855e40fab66
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
