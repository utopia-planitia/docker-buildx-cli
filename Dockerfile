FROM docker:28.2.2@sha256:d4668861cabc1691635d98e827a81cfa834a416f8fe0f4efc609f9f806d86d82 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.24.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:28.2.2@sha256:d4668861cabc1691635d98e827a81cfa834a416f8fe0f4efc609f9f806d86d82
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
