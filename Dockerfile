FROM docker:28.3.3@sha256:852ddc126f12563e1a4460bf2ae5cf71b07500bedaf235e62dcf77a41adb0e57 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.26.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:28.3.3@sha256:852ddc126f12563e1a4460bf2ae5cf71b07500bedaf235e62dcf77a41adb0e57
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
