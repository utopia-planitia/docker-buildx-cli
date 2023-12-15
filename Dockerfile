FROM docker:24.0.7@sha256:1b9844d846ce3a6a6af7013e999a373112c3c0450aca49e155ae444526a2c45e AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.12.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:24.0.7@sha256:1b9844d846ce3a6a6af7013e999a373112c3c0450aca49e155ae444526a2c45e
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
