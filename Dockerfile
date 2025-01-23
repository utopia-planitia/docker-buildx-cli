FROM docker:27.5.1@sha256:3ab005a2e4872f0b10fb9c00d4230334043f1281f29299bd3de94a8f14a05e69 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.20.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:27.5.1@sha256:3ab005a2e4872f0b10fb9c00d4230334043f1281f29299bd3de94a8f14a05e69
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
