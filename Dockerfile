FROM docker:23.0.1@sha256:d9a0fd8bdd156aae6e9be5db0264e0bc99e000e89e92055d4567e27ff13daff0 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.10.4
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:23.0.1@sha256:d9a0fd8bdd156aae6e9be5db0264e0bc99e000e89e92055d4567e27ff13daff0
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
