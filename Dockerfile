FROM docker:27.3.1@sha256:61b179d1c34a08d85d68df58fa90e4f8f6fe469f8e89aefb474d29f2e3bc8b97 AS download
RUN apk add curl
ENV BUILDX_VERSION=v0.17.1
RUN curl --fail -L -o /docker-buildx \
    https://github.com/docker/buildx/releases/download/${BUILDX_VERSION}/buildx-${BUILDX_VERSION}.linux-amd64

FROM docker:27.3.1@sha256:61b179d1c34a08d85d68df58fa90e4f8f6fe469f8e89aefb474d29f2e3bc8b97
RUN mkdir -p ~/.docker/cli-plugins/
COPY --from=download /docker-buildx /root/.docker/cli-plugins/docker-buildx
RUN chmod a+x ~/.docker/cli-plugins/docker-buildx
