FROM docker:25.0.2@sha256:fed3a24717ab1f0ba660bf2a7a8960743f7d5facd3a2f27b6da8bcae3bcf7409 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.12.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:25.0.2@sha256:fed3a24717ab1f0ba660bf2a7a8960743f7d5facd3a2f27b6da8bcae3bcf7409
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
