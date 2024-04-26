FROM docker:26.1.0@sha256:66183ea9201de4ca3be95ea9f21235a6e427b50f632563e2761b13c0ad1bad48 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.14.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:26.1.0@sha256:66183ea9201de4ca3be95ea9f21235a6e427b50f632563e2761b13c0ad1bad48
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
