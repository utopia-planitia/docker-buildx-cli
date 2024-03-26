FROM docker:26.0.0@sha256:016c45d9e31461802186e8e9aaa394f35e173a8ce913ea7195a672cdc97102f2 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.13.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:26.0.0@sha256:016c45d9e31461802186e8e9aaa394f35e173a8ce913ea7195a672cdc97102f2
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
