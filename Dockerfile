FROM docker:27.0.3@sha256:3e52ceff980f04b332292e06421ba0d1b5818d1ff38c9e39b3b1cd0d67b2d8c1 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.15.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:27.0.3@sha256:3e52ceff980f04b332292e06421ba0d1b5818d1ff38c9e39b3b1cd0d67b2d8c1
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
