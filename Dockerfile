FROM docker:29.0.1@sha256:ecac43e78380d9b9d3bd24f0ab42b370f6391a1a06a66065c10a00b9d6d57a3e AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.30.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:29.0.1@sha256:ecac43e78380d9b9d3bd24f0ab42b370f6391a1a06a66065c10a00b9d6d57a3e
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
