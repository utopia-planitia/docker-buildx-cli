FROM docker:28.2.1@sha256:4610d33c9a2b9c2bce10ce76c693ee7564506845dd190deb80c3c3afbb62296d AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.24.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:28.2.1@sha256:4610d33c9a2b9c2bce10ce76c693ee7564506845dd190deb80c3c3afbb62296d
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
