FROM docker:24.0.7@sha256:0361a91d0b63463cc56997fe4e9abbc4d0f36d9cea24e8a29671f85fca540938 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.12.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:24.0.7@sha256:0361a91d0b63463cc56997fe4e9abbc4d0f36d9cea24e8a29671f85fca540938
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
