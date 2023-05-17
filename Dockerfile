FROM docker:23.0.6@sha256:d9a1c228debaf2dc84e07a0aad72a9b8dd1645442d05ece950507e0a8838fcb1 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.10.4
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:23.0.6@sha256:d9a1c228debaf2dc84e07a0aad72a9b8dd1645442d05ece950507e0a8838fcb1
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
