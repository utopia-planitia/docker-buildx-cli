FROM docker:28.0.1@sha256:ddf7f6fd0d2175709739f1d47e6134fa8eb055d2f61c11c3f99780c79b44578e AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.22.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:28.0.1@sha256:ddf7f6fd0d2175709739f1d47e6134fa8eb055d2f61c11c3f99780c79b44578e
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
