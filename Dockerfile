FROM docker:27.1.0@sha256:0e8a2acce01fbb5dd4c94262bfc111b1ba33fd921147c8ae416a8bc2516835ae AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.16.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:27.1.0@sha256:0e8a2acce01fbb5dd4c94262bfc111b1ba33fd921147c8ae416a8bc2516835ae
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
