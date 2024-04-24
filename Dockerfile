FROM docker:26.1.0@sha256:b297701767faf221439ea00ebc52781c716e6e843893bbf9268785b0c0f5319d AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.14.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:26.1.0@sha256:b297701767faf221439ea00ebc52781c716e6e843893bbf9268785b0c0f5319d
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
