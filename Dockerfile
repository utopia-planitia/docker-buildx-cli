FROM docker:27.5.1@sha256:ba55987d5a560d321a148e9e33b9d465b9badf0400c5e3fa06b38c0048062294 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.20.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:27.5.1@sha256:ba55987d5a560d321a148e9e33b9d465b9badf0400c5e3fa06b38c0048062294
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
