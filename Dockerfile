FROM docker:28.0.1@sha256:71835c5efd0a0f907330f2b04b0ea8a143d0201072494e67eb7699d69281c9e2 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.22.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:28.0.1@sha256:71835c5efd0a0f907330f2b04b0ea8a143d0201072494e67eb7699d69281c9e2
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
