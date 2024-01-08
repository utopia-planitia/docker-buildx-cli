FROM docker:24.0.7@sha256:eb59696588157b44998ec085a1373fa0966a5e2cac8c42305cce085d1ef7adf0 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.12.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:24.0.7@sha256:eb59696588157b44998ec085a1373fa0966a5e2cac8c42305cce085d1ef7adf0
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
