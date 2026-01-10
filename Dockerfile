FROM docker:29.1.4@sha256:d95427251fd155cd69a03311a8c4edf6d0778595444afc2d2c800a156eb2ecac AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.30.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:29.1.4@sha256:d95427251fd155cd69a03311a8c4edf6d0778595444afc2d2c800a156eb2ecac
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
