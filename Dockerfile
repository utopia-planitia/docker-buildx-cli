FROM docker:24.0.2@sha256:5edfe3067bdd8b76818b036d8ef61846696af4d458ba527356c5484fcd692c2a AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.10.5
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:24.0.2@sha256:5edfe3067bdd8b76818b036d8ef61846696af4d458ba527356c5484fcd692c2a
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
