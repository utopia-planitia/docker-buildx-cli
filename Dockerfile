FROM docker:24.0.5@sha256:9e71442b7584518e6efefd9f325cbc5b4b9b000886cffef6e679fcc06e93d8c7 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.11.2
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:24.0.5@sha256:9e71442b7584518e6efefd9f325cbc5b4b9b000886cffef6e679fcc06e93d8c7
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
