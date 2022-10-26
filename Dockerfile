FROM docker:20.10.21@sha256:169a07d8488874fb19341c959f67da2acc366921e729abd50c91d3e74a15616f AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.9.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:20.10.21@sha256:169a07d8488874fb19341c959f67da2acc366921e729abd50c91d3e74a15616f
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
