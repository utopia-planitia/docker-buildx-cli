FROM docker:27.2.1@sha256:ecfcb834c5047a751833f089e3a9a3e97ecec4a4dca8e9f13ff03694fd002443 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.17.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:27.2.1@sha256:ecfcb834c5047a751833f089e3a9a3e97ecec4a4dca8e9f13ff03694fd002443
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
