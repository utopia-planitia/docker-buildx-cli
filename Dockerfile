FROM docker:26.1.4@sha256:66776493766db8133f3d892b9c647551cd9bc5b8a948c57177d4ffbd4b33681e AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.15.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:26.1.4@sha256:66776493766db8133f3d892b9c647551cd9bc5b8a948c57177d4ffbd4b33681e
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
