FROM docker:25.0.1@sha256:ef498d0eb1009a1a15f282683f0904681c6ab192b233b5d72795d783b5c60421 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.12.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:25.0.1@sha256:ef498d0eb1009a1a15f282683f0904681c6ab192b233b5d72795d783b5c60421
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
