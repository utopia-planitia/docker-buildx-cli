FROM docker:28.1.1@sha256:f49e1c71b5d9f8ebe53715f78996ce42b8be4b1ec03875d187dfe3c03de1dc00 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.23.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:28.1.1@sha256:f49e1c71b5d9f8ebe53715f78996ce42b8be4b1ec03875d187dfe3c03de1dc00
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
