FROM docker:29.9.3@sha256:08a98015fce594af7c382883bea080ea206de74402a95da9dc52b6428c8cd121 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.39.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:29.9.3@sha256:08a98015fce594af7c382883bea080ea206de74402a95da9dc52b6428c8cd121
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
