FROM docker:20.10.21@sha256:0b2c96ce1907a9df3505759cbc8a4af52bcb40e8a9dff18bb5809eb3a821414e AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.9.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:20.10.21@sha256:0b2c96ce1907a9df3505759cbc8a4af52bcb40e8a9dff18bb5809eb3a821414e
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
