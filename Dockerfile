FROM docker:29.2.0@sha256:a284d31e4db9a9916fd9be44380263eaeafedf0e3048a859f978922b5a0c16fc AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.31.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:29.2.0@sha256:a284d31e4db9a9916fd9be44380263eaeafedf0e3048a859f978922b5a0c16fc
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
