FROM docker:26.1.4@sha256:a6b5add4d34aff635fbe7f3eb43b5f3b5dc7d9df61ce1f9f8f5fca2739992c19 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.15.0
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:26.1.4@sha256:a6b5add4d34aff635fbe7f3eb43b5f3b5dc7d9df61ce1f9f8f5fca2739992c19
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
