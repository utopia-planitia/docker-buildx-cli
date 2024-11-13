FROM docker:27.3.1@sha256:09bf5e6944db2b59ab9c953d14c0af292459b169f5a2c15169450c072f9bf1d9 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.18.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:27.3.1@sha256:09bf5e6944db2b59ab9c953d14c0af292459b169f5a2c15169450c072f9bf1d9
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
