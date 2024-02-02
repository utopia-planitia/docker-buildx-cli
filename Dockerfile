FROM docker:25.0.2@sha256:c5353bc15e6746f7dec07a61346e9bbd2a19291d1e4306d15b745cb343dd84b5 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.12.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:25.0.2@sha256:c5353bc15e6746f7dec07a61346e9bbd2a19291d1e4306d15b745cb343dd84b5
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
