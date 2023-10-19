FROM docker:24.0.6@sha256:4a704b30e173c7b31f408f11a01281043c33c5c87187ab97074d9dcb31baad2a AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.11.2
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:24.0.6@sha256:4a704b30e173c7b31f408f11a01281043c33c5c87187ab97074d9dcb31baad2a
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
