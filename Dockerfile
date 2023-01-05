FROM docker:20.10.22@sha256:fde7a4a9b1ca994f7c5bfd62fb32c70fddbbfea43a1ea74b029d7a88c6f0e243 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.9.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:20.10.22@sha256:fde7a4a9b1ca994f7c5bfd62fb32c70fddbbfea43a1ea74b029d7a88c6f0e243
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
