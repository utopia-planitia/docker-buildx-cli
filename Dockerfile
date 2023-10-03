FROM docker:24.0.6@sha256:f28ffd78641197871fea8fd679f2bf8a1cdafa4dc3f1ce3e700ad964aac2879a AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.11.2
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:24.0.6@sha256:f28ffd78641197871fea8fd679f2bf8a1cdafa4dc3f1ce3e700ad964aac2879a
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
