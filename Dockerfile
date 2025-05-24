FROM docker:28.1.1@sha256:eceba5b0fc2fcf83a74c298391c2ed9e1adbdaf04ee173611bd6282ec973e7ba AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.24.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:28.1.1@sha256:eceba5b0fc2fcf83a74c298391c2ed9e1adbdaf04ee173611bd6282ec973e7ba
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
