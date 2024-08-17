FROM docker:27.1.2@sha256:2e5515536bf789843b48030fdca3e3719463ba85c43b1da7d5687f5997b79d26 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.16.2
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:27.1.2@sha256:2e5515536bf789843b48030fdca3e3719463ba85c43b1da7d5687f5997b79d26
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
