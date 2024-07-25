FROM docker:27.1.1@sha256:7c15d6025e790c9842bdb0cb8fcff3acfe5fe802be4818fd107de5881c240ac2 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.16.2
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:27.1.1@sha256:7c15d6025e790c9842bdb0cb8fcff3acfe5fe802be4818fd107de5881c240ac2
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
