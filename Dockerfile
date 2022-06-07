FROM docker:20.10.17@sha256:206fb7d9747e035b5fb0b12840d1117ccce38b7508c5967ddd66bfc1f8abc36a AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.8.2
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:20.10.17@sha256:206fb7d9747e035b5fb0b12840d1117ccce38b7508c5967ddd66bfc1f8abc36a
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
