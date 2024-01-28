FROM docker:25.0.1@sha256:91c7180444442d2596355a2859317d86c73025c63c67bceca3e16cd09a08e649 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.12.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:25.0.1@sha256:91c7180444442d2596355a2859317d86c73025c63c67bceca3e16cd09a08e649
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
