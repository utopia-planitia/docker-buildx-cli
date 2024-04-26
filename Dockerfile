FROM docker:26.1.0@sha256:308c63f771a0596e23f6007f537c8e1d77c8cf68864f0a5a6fc476c69b9b7416 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.14.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:26.1.0@sha256:308c63f771a0596e23f6007f537c8e1d77c8cf68864f0a5a6fc476c69b9b7416
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
