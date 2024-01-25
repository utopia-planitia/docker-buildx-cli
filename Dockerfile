FROM docker:25.0.1@sha256:7986efdd91d8049771bb935f27c53e4f040494d3274c5e377e54ca1337151c29 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.12.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:25.0.1@sha256:7986efdd91d8049771bb935f27c53e4f040494d3274c5e377e54ca1337151c29
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
