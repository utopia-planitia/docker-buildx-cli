FROM docker:29.8.1@sha256:3f3c01aaaebf7cce837356b688b7c059a4749f10bd7660dec7c58fc454a283f0 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.37.2
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:29.8.1@sha256:3f3c01aaaebf7cce837356b688b7c059a4749f10bd7660dec7c58fc454a283f0
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
