FROM docker:27.0.3@sha256:2632da0d24924b179adf1c2e6f4ea6fb866747e84baea6b2ffaa8bff982ce102 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.15.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:27.0.3@sha256:2632da0d24924b179adf1c2e6f4ea6fb866747e84baea6b2ffaa8bff982ce102
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
